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

namespace EA\Engine\Types;


/**
 * Class Decimal
 *
 * @deprecated
 *
 * @package EA\Engine\Types
 */
class Decimal extends Type {
    /**
     * @param mixed $value
     * @return bool
     */
    protected function validate($value)
    {
        return is_float($value);
    }
}
