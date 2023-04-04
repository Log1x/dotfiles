<?php

namespace Valet\Drivers\Custom;

use Valet\Drivers\ValetDriver;

class VuePressValetDriver extends ValetDriver
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
        if (
            file_exists($sitePath . '/.vuepress/config.js') ||
            file_exists($sitePath . '/docs/.vuepress/config.js')
        ) {
            return true;
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
    public function isStaticFile(string $sitePath, string $siteName, string $uri)
    {
        if (
            file_exists($staticFilePath = $sitePath . '/.vuepress/dist/' . $uri) ||
            file_exists($staticFilePath = $sitePath . '/docs/.vuepress/dist/' . $uri)
        ) {
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
        if (file_exists($sitePath . '/.vuepress/config.js')) {
            return $sitePath . '/.vuepress/dist/index.html';
        }

        if (file_exists($sitePath . '/docs/.vuepress/config.js')) {
            return $sitePath . '/docs/.vuepress/dist/index.html';
        }
    }
}
