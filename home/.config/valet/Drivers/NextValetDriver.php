<?php

/**
 * NextValetDriver for running compiled next.js sites
 */
class NextValetDriver extends BasicValetDriver
{
    /**
     * Determine if the driver serves the request.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return bool
     */
    public function serves($sitePath, $siteName, $uri)
    {
        return is_dir($sitePath . '/out/_next');
    }

    /**
     * Get the fully resolved path to the application's front controller.
     *
     * @param  string  $sitePath
     * @param  string  $siteName
     * @param  string  $uri
     * @return string
     */
    public function frontControllerPath($sitePath, $siteName, $uri)
    {

        $_SERVER['PHP_SELF']    = $uri;
        $_SERVER['SERVER_ADDR'] = '127.0.0.1';
        $_SERVER['SERVER_NAME'] = $_SERVER['HTTP_HOST'];

        return parent::frontControllerPath($sitePath, $siteName, '/out' . $uri);
    }

    public function isStaticFile($sitePath, $siteName, $uri)
    {
        // handle subfolder index pages
        $try_html = $sitePath . '/out' . $uri . '/index.html';
        if (file_exists($try_html)) {
            return $try_html;
        }

        // handle public static files
        $try_uri = $sitePath . '/out' . $uri;
        if (file_exists($try_uri)) {
            return $try_uri;
        }

        // handle the component files
        $path = '_next/';
        if (false !== ($pos = stripos($uri, '/' . $path))) {
            $new_uri = '/out' . substr($uri, $pos);
            if (file_exists($sitePath . $new_uri)) {
                return $sitePath . $new_uri;
            }
        }

        return parent::isStaticFile($sitePath, $siteName, $uri);
    }
}
