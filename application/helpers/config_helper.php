<?php defined('BASEPATH') or exit('No direct script access allowed');

/* ----------------------------------------------------------------------------
 * MYAppointments - Open Source Web Scheduler
 *
 * @package     MYAppointments
 * @author      Adorratm <https://github.com/adorratm>
 * @copyright   Copyright (c) 2013 - 2020, Adorratm
 * @license     http://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        https://mutfakyapim.com
 * @since       v1.3.0
 * ---------------------------------------------------------------------------- */

/**
 * Quickly fetch the value of a framework configuration.
 *
 * @param string $key Configuration key.
 *
 * @return mixed Returns the configuration value.
 */
function config($key)
{
    $CI = &get_instance();

    return $CI->config->item($key);
}
