<?php defined('BASEPATH') or exit('No direct script access allowed');

/* ----------------------------------------------------------------------------
 * MYAppointments - Open Source Web Scheduler
 *
 * @package     MYAppointments
 * @author      Adorratm <https://github.com/adorratm>
 * @copyright   Copyright (c) 2013 - 2020, Adorratm
 * @license     https://opensource.org/licenses/GPL-3.0 - GPLv3
 * @link        https://mutfakyapim.com
 * @since       v1.0.0
 * ---------------------------------------------------------------------------- */

/**
 * Captcha Controller
 *
 * @package Controllers
 */
class Captcha extends EA_Controller {
    /**
     * Class Constructor
     */
    public function __construct()
    {
        parent::__construct();

        $this->load->library('captcha_builder');
    }

    /**
     * Make a request to this method to get a captcha image.
     */
    public function index()
    {
        header('Content-type: image/jpeg');
        $this->captcha_builder->build();
        $this->session->set_userdata('captcha_phrase', $this->captcha_builder->getPhrase());
        $this->captcha_builder->output();
    }
}
