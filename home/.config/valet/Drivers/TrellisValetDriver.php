<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\ValetDriver;

class TrellisValetDriver extends ValetDriver
{
    /**
     * Determine if the driver serves the request.
     *
     * @param  string $sitePath
     * @param  string $siteName
     * @param  string $uri
     * @return bool
     */
    public function serves(string $sitePath, string $siteName, string $uri): bool
    {
        return file_exists($sitePath . '/site/web/app/mu-plugins/bedrock-autoloader.php') || (
            is_dir($sitePath . '/site/web/app/') &&
            file_exists($sitePath . '/site/web/wp-config.php') &&
            file_exists($sitePath . '/site/config/application.php')
        );
    }

    /**
     * Determine if the incoming request is for a static file.
     *
     * @param  string       $sitePath
     * @param  string       $siteName
     * @param  string       $uri
     * @return string|false
     */
    public function isStaticFile(string $sitePath, string $siteName, string $uri)
    {
        $staticFilePath = $sitePath . '/site/web' . $uri;

        if ($this->isActualFile($staticFilePath)) {
            return $staticFilePath;
        }

        return false;
    }

    /**
     * Determine if the incoming request is for a static file.
     *
     * @param  string       $sitePath
     * @param  string       $siteName
     * @param  string       $uri
     * @return string|false
     */
    public function frontControllerPath(string $sitePath, string $siteName, string $uri): string
    {
        $_SERVER['PHP_SELF'] = $uri;

        if (strpos($uri, '/wp/') === 0) {
            return is_dir($sitePath . '/site/web' . $uri)
                ? $sitePath . '/site/web' . $this->forceTrailingSlash($uri) . '/index.php'
                : $sitePath . '/site/web' . $uri;
        }

        return $sitePath . '/site/web/index.php';
    }

    /**
     * Force a trailing slash on the URI.
     *
     * @param  string $uri
     * @return string
     */
    protected function forceTrailingSlash(string $uri): string
    {
        if (substr($uri, -1 * strlen('/wp/wp-admin')) == '/wp/wp-admin') {
            header('Location: ' . $uri . '/');
            die;
        }

        return $uri;
    }
}
