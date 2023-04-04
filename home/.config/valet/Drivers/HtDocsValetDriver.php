<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\ValetDriver;

class HtDocsValetDriver extends ValetDriver
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
        if (file_exists($sitePath . '/htdocs/index.php')) {
            return true;
        }

        return false;
    }

    /**
     * Determine if the incoming request is static.
     *
     * @param   string        $sitePath
     * @param   string        $siteName
     * @param   string        $uri
     * @return  string|false
     */
    public function isStaticFile(string $sitePath, string $siteName, string $uri)
    {
        if (file_exists($staticFilePath = $sitePath . '/htdocs/' . $uri)) {
            return $staticFilePath;
        }

        return false;
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param   string  $sitePath
     * @param   string  $siteName
     * @param   string  $uri
     * @return  string
     */
    public function frontControllerPath(string $sitePath, string $siteName, string $uri): string
    {
        return $sitePath . '/htdocs/index.php';
    }
}
