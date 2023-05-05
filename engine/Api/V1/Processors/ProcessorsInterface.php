<?php

/* ----------------------------------------------------------------------------
 * MYAppointments - Open Source Web Scheduler
 *
 * @package     MYAppointments
 * @author      Adorratm <https://github.com/adorratm>
 * @copyright   Copyright (c) 2013 - 2020, Adorratm
 * @license     http://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        https://mutfakyapim.com
 * @since       v1.2.0
 * ---------------------------------------------------------------------------- */

namespace EA\Engine\Api\V1\Processors;

/**
 * Interface ProcessorsInterface
 *
 * @deprecated
 *
 * @package EA\Engine\Api\V1\Processors
 */
interface ProcessorsInterface {
    public static function process(array &$response);
}
