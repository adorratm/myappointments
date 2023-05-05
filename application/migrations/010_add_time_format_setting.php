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
 * Class Migration_Add_time_format_setting
 *
 * @property CI_DB_query_builder $db
 * @property CI_DB_forge $dbforge
 */
class Migration_Add_time_format_setting extends CI_Migration {
    /**
     * Upgrade method.
     */
    public function up()
    {
        $this->db->insert('settings', [
            'name' => 'time_format',
            'value' => 'regular'
        ]);
    }

    /**
     * Downgrade method.
     */
    public function down()
    {
        $this->db->delete('settings', ['name' => 'time_format']);
    }
}
