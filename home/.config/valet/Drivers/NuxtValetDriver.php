<?php

/**
 * NuxtValetDriver for running compiled nuxt.js sites
 */
class NuxtValetDriver extends BasicValetDriver
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
    public function frontControllerPath($sitePath, $siteName, $uri)
    {

        $_SERVER['PHP_SELF']    = $uri;
        $_SERVER['SERVER_ADDR'] = '127.0.0.1';
        $_SERVER['SERVER_NAME'] = $_SERVER['HTTP_HOST'];

        return parent::frontControllerPath($sitePath, $siteName, '/dist' . $uri);
    }

    public function isStaticFile($sitePath, $siteName, $uri)
    {
        // handle subfolder index pages
        $try_html = $sitePath . '/dist' . $uri . '/index.html';
        if (file_exists($try_html)) {
            return $try_html;
        }

        // handle public static files
        $try_uri = $sitePath . '/dist' . $uri;
        if (file_exists($try_uri)) {
            return $try_uri;
        }

        // handle the component files
        $path = '_nuxt/';
        if (false !== ($pos = stripos($uri, '/' . $path))) {
            $new_uri = '/dist' . substr($uri, $pos);
            if (file_exists($sitePath . $new_uri)) {
                return $sitePath . $new_uri;
            }
        }

        return parent::isStaticFile($sitePath, $siteName, $uri);
    }
}
