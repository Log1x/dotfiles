<?php

/**
 * VuePress Larvel Valet Driver
 *
 * Supports VuePress within the projects root or the `docs` directory.
 */
class VuePressValetDriver extends ValetDriver
{
    /**
     * Serves
     *
     * Determines if the driver serves the request by Checking for a
     * `.vuepress/config.js` file within the project root directory or within
     * the `/docs/` directory.
     *
     * @param   string  $sitePath
     * @param   string  $siteName
     * @param   string  $uri
     * @return  bool
     */
    public function serves($sitePath, $siteName, $uri)
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
     * isStaticFile
     *
     * Determine if the incoming request is for a static file.
     *
     * @param   string        $sitePath
     * @param   string        $siteName
     * @param   string        $uri
     * @return  string|false
     */
    public function isStaticFile($sitePath, $siteName, $uri)
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
     * frontControllerPath
     *
     * Get the fully resolved path to the application's front controller.
     *
     * @param   string  $sitePath
     * @param   string  $siteName
     * @param   string  $uri
     * @return  string
     */
    public function frontControllerPath($sitePath, $siteName, $uri)
    {
        if (file_exists($sitePath . '/.vuepress/config.js')) {
            return $sitePath . '/.vuepress/dist/index.html';
        }

        if (file_exists($sitePath . '/docs/.vuepress/config.js')) {
            return $sitePath . '/docs/.vuepress/dist/index.html';
        }
    }
}
