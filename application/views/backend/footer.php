<div id="footer">
    <div class="container-fluid">
        <div class="row align-items-center align-content-center align-self-center">
            <div id="footer-content" class="col-12 col-lg-4 text-center">
                <a href="<?= base_url() ?>">
                    <img class="img-fluid mr-1" src="<?= base_url('assets/img/logo.png') ?>" alt="MYAppointments Logo">
                </a>
            </div>
            <div class="col-12 col-lg-4 text-center">

                &copy; <?= date('Y') ?>

                |

                <?= lang('licensed_under') ?>

                |

                <span id="select-language" class="badge badge-secondary d-none">
                    <i class="fas fa-language mr-2"></i>
                    <?= ucfirst(config('language')) ?>
                </span>

                |

                <a href="<?= site_url('appointments') ?>">
                    <?= lang('go_to_booking_page') ?>
                </a>
            </div>

            <div id="footer-user-display-name" class="col-12 col-lg-4 text-center">
                <a href="https://mutfakyapim.com" title="Mutfak Yapım Dijital Reklam Ajansı">
                    <img style="filter:drop-shadow(1px 1px 1px black)" class="mx-1" src="https://mutfakyapim.com/images/mutfak/logo.png" alt="Mutfak Yapım Dijital Reklam Ajansı" height="40">
                </a>
                <?= lang('hello') . ', ' . $user_display_name ?>!
            </div>
        </div>
    </div>
</div>

<script src="<?= asset_url('assets/js/backend.js') ?>"></script>
<script src="<?= asset_url('assets/js/polyfill.js') ?>"></script>
<script src="<?= asset_url('assets/js/general_functions.js') ?>"></script>
</body>

</html>