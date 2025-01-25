    </main><!-- /.main-content -->

    <section class="footer-section">
        <div class="container">
            <div class="row">
                <div class="col">
                    <div class="footer-logo">
                        <img src="{$WEB_ROOT}/assets/img/logo.svg" alt="{$companyname}">
                        <span>{$companyname}</span>
                    </div>
                    <p>Our mission is to make life easier for our customers. We do it by offering easy to use, fast and reliable technology and support services.</p>
                </div>
                <div class="col">
                    <h4>Services</h4>
                    <ul>
                        <li><a href="{$WEB_ROOT}/index.php/store/ai-protection">AI Protection</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/store/managed-services">Managed Services</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/store/cyber-security">Cyber Security</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/store/whois">WHOIS</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/store/domain-tracker">Domain Tracker</a></li>
                    </ul>
                </div>
                <div class="col">
                    <h4>Company</h4>
                    <ul>
                        <li><a href="{$WEB_ROOT}/index.php/about-us">About Us</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/terms-of-service">Terms of Service</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/privacy-policy">Privacy Policy</a></li>
                        <li><a href="{$WEB_ROOT}/index.php/faq">FAQ</a></li>
                    </ul>
                </div>
                <div class="col">
                    <div class="newsletter-form">
                        <h4>Subscribe to our newsletter</h4>
                        <div class="input-group">
                            <input type="email" placeholder="Your email" aria-label="Your email">
                            <button type="submit">Subscribe</button>
                        </div>
                    </div>
                    <h4>Contact Us</h4>
                    <p><a href="mailto:helpdesk@little.cloud" style="color: var(--si-gray-400); text-decoration: none;">helpdesk@little.cloud</a></p>
                </div>
            </div>
            <div class="company-info">
                <p>Little Cloud OÜ</p>
            </div>
        </div>
    </section>

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a href="{$WEB_ROOT}">
                        {if $assetLogoPath}
                            <img src="{$assetLogoPath}" alt="{$companyname}" class="footer-logo" />
                        {else}
                            <img src="{$WEB_ROOT}/assets/img/logo.svg" alt="{$companyname}" class="footer-logo" />
                        {/if}
                    </a>
                    <p class="footer-desc">Our mission is to make life easier for our customers. We do it by offering easy to use, fast and reliable technology and support services.</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <nav class="footer-nav">
                        <a href="{$WEB_ROOT}/about">About Us</a>
                        <a href="{$WEB_ROOT}/services">Services</a>
                        <a href="{$WEB_ROOT}/ai-protection">AI Protection</a>
                        <a href="{$WEB_ROOT}/managed-services">Managed Services</a>
                        <a href="{$WEB_ROOT}/cyber-security">Cyber Security</a>
                        <a href="{$WEB_ROOT}/whois">WHOIS</a>
                        <a href="{$WEB_ROOT}/domain-tracker">Domain Tracker</a>
                    </nav>
                </div>
                <div class="col-md-4">
                    <h5>Contact</h5>
                    <p>
                        <strong>Email:</strong> <a href="mailto:helpdesk@little.cloud">helpdesk@little.cloud</a>
                    </p>
                </div>
            </div>
            <div class="footer-copyright">
                <p>Copyright &copy; {$date_year} {$companyname}. All Rights Reserved.</p>
            </div>
        </div>
    </footer>

    {if $languagechangeenabled && count($locales) > 1}
        <div class="modal fade" id="languageChooser">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h4 class="modal-title">{$LANG.chooselanguage}</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="{$LANG.close}"></button>
                    </div>
                    <div class="modal-body">
                        <ul class="list-group list-group-flush">
                            {foreach $locales as $locale}
                                <a href="{$currentpagelinkback}language={$locale.language}" class="list-group-item{if $language eq $locale.language} active{/if}">
                                    {$locale.localisedName}
                                </a>
                            {/foreach}
                        </ul>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-bs-dismiss="modal">{$LANG.close}</button>
                    </div>
                </div>
            </div>
        </div>
    {/if}

    <div id="fullScreenLoader" class="w-hidden">
        <div class="loader">
            {include file="$template/includes/common/loader.tpl"}
        </div>
    </div>

    <div class="overlay"></div>

    {include file="$template/includes/generate-password.tpl"}

    {$footeroutput}

</body>
</html>