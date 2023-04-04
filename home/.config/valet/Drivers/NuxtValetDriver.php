<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\ValetDriver;

class NuxtValetDriver extends ValetDriver
{
    /**
     * Determine if the driver serves the request.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return bool
     */
    public function serves(string $sitePath, string $siteName, string $uri): bool
    {
        return is_dir($sitePath . '/dist/_nuxt');
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return string
     */
    public function frontControllerPath(string $sitePath, string $siteName, string $uri): string
    {
        $_SERVER['PHP_SELF'] = $uri;
        $_SERVER['SERVER_ADDR'] = '127.0.0.1';
        $_SERVER['SERVER_NAME'] = $_SERVER['HTTP_HOST'];

        return parent::frontControllerPath($sitePath, $siteName, '/dist' . $uri);
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
        if (file_exists($staticFilePath = $sitePath . '/dist' . $uri . '/index.html')) {
            return $staticFilePath;
        }

        if (file_exists($staticFilePath = $sitePath . '/dist' . $uri)) {
            return $staticFilePath;
        }

        if (($path = stripos($uri, '/' . '_nuxt/')) !== false) {
            if (file_exists($staticFilePath = $sitePath . '/dist' . substr($uri, $path))) {
                return $staticFilePath;
            }
        }

        return parent::isStaticFile($sitePath, $siteName, $uri);
    }
}
