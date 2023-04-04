<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\ValetDriver;

class DirectusValetDriver extends ValetDriver
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
        return file_exists($sitePath . '/bin/directus');
    }

    /**
     * Determine if the incoming request is for a static file.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return string|false
     */
    public function isStaticFile(string $sitePath, string $siteName, string $uri)
    {
        if ($uri === '/admin') {
            return false;
        }

        if (file_exists($staticFilePath = $sitePath . '/public/admin' . $uri)) {
            return $staticFilePath;
        }

        if (file_exists($staticFilePath = $sitePath . '/public' . $uri)) {
            return $staticFilePath;
        }

        return false;
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
        $url = $this->parseUrl($uri);

        if ($url['first'] === 'admin') {
            return $sitePath.'/public/admin/index.html';
        }

        if ($url['first'] === 'api') {
            return strpos($url['path'], 'api/extensions') !== false ?
                $sitePath . '/public/api.php?run_extension=' . implode('/', array_slice($url['parts'], 2)) :
                $sitePath . '/public/api.php?run_api_router=1';
        }

        return $sitePath . '/public/index.php';
    }

    /**
     * Parse the specified URI.
     *
     * @param  string $uri
     * @return array
     */
    public function parseUrl(string $uri): array
    {
        $url = parse_url($uri);
        $path = explode('/', trim($url['path'], '/'));

        return array_merge($url, [
            'parts' => $path,
            'first' => reset($path),
            'last' => end($path),
        ]);
    }
}
