    </main><!-- /.main-content -->

    {$footeroutput}

    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <a href="{$WEB_ROOT}">
                        {if $assetLogoPath}
                            <img src="https://little.cloud/assets/img/logo.svg" alt="{$companyname}" class="footer-logo" />
                        {else}
                            <img src="https://little.cloud/assets/img/logo.svg" alt="{$companyname}" class="footer-logo" />
                        {/if}
                    </a>
                    <p class="footer-desc">Our mission is to make life easier for our customers. We do it by offering easy to use, fast and reliable technology and support services.</p>
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <nav class="footer-nav">
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register">Register Domain</a>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">Transfer Domain</a>
                        <a href="{$WEB_ROOT}/domain-pricing">Domain Pricing</a>
                        <a href="{$WEB_ROOT}/whois">WHOIS Lookup</a>
                        <a href="{$WEB_ROOT}/clientarea.php?action=domains">Domain Management</a>
                        <a href="{$WEB_ROOT}/ssl-certificates">SSL Certificates</a>
                        <a href="{$WEB_ROOT}/contact.php">Contact Us</a>
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

</body>
</html>