            </div><!-- /.primary-content -->
        </div><!-- /.row -->
    </div><!-- /.container -->
</section><!-- /#main-body -->

<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-md-3">
                <h5>Company</h5>
                <ul class="list-unstyled">
                    <li><a href="{$WEB_ROOT}/about-us">About Us</a></li>
                    <li><a href="{$WEB_ROOT}/contact">Contact Us</a></li>
                    <li><a href="{routePath('announcement-index')}">Announcements</a></li>
                    <li><a href="{$WEB_ROOT}/affiliates">Affiliates</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Services</h5>
                <ul class="list-unstyled">
                    <li><a href="{$WEB_ROOT}/store/shared-hosting">Shared Hosting</a></li>
                    <li><a href="{$WEB_ROOT}/store/wordpress-hosting">WordPress Hosting</a></li>
                    <li><a href="{$WEB_ROOT}/store/ssl-certificates">SSL Certificates</a></li>
                    <li><a href="{$WEB_ROOT}/store/website-builder">Website Builder</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Support</h5>
                <ul class="list-unstyled">
                    <li><a href="{routePath('knowledgebase-index')}">Knowledge Base</a></li>
                    <li><a href="serverstatus.php">Network Status</a></li>
                    <li><a href="{routePath('download-index')}">Downloads</a></li>
                    <li><a href="submitticket.php">Submit a Ticket</a></li>
                </ul>
            </div>
            <div class="col-md-3">
                <h5>Legal</h5>
                <ul class="list-unstyled">
                    <li><a href="{$WEB_ROOT}/privacy">Privacy Policy</a></li>
                    <li><a href="{$WEB_ROOT}/terms">Terms of Service</a></li>
                </ul>
            </div>
        </div>

        <div class="footer-bottom">
            <div class="row align-items-center">
                <div class="col-md-6">
                    <p class="copyright mb-0">
                        Copyright &copy; {$date_year} {$companyname}. All Rights Reserved.
                    </p>
                </div>
                <div class="col-md-6 text-md-end">
                    <div class="social-links">
                        <a href="#" target="_blank" class="me-3"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" target="_blank" class="me-3"><i class="fab fa-twitter"></i></a>
                        <a href="#" target="_blank" class="me-3"><i class="fab fa-linkedin-in"></i></a>
                        <a href="#" target="_blank"><i class="fab fa-github"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>

<div id="fullpage-overlay" class="w-hidden">
    <div class="outer-wrapper">
        <div class="inner-wrapper">
            <img src="{$WEB_ROOT}/assets/img/overlay-spinner.svg">
            <br>
            <span class="msg"></span>
        </div>
    </div>
</div>

<div class="modal system-modal fade" id="modalAjax" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title"></h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="loader">
                    <i class="fas fa-spinner fa-spin"></i>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-bs-dismiss="modal">
                    {lang key='close'}
                </button>
                <button type="button" class="btn btn-primary modal-submit">
                    {lang key='submit'}
                </button>
            </div>
        </div>
    </div>
</div>

{include file="$template/includes/generate-password.tpl"}

{$footeroutput}

</body>
</html>
