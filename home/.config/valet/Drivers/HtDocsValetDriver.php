<?php

/**
 * HtDocs Larvel Valet Driver
 *
 * Supports static HtDocs within a project root.
 */
class HtDocsValetDriver extends ValetDriver
{
    /**
     * Serve a generic request if a `htdocs/index.php`
     * exists in the site path.
     *
     * @param   string  $sitePath
     * @param   string  $siteName
     * @param   string  $uri
     * @return  bool
     */
    public function serves($sitePath, $siteName, $uri)
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
    public function isStaticFile($sitePath, $siteName, $uri)
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
    public function frontControllerPath($sitePath, $siteName, $uri)
    {
        return $sitePath . '/htdocs/index.php';
    }
}
