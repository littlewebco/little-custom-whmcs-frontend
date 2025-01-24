{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="overlay"></div>
        <div class="container h-100 d-flex align-items-center justify-content-center">
            <div class="content text-center">
                <h1 class="mb-4">Secure your domain name</h1>
                <div class="domain-search">
                    <form method="post" action="cart.php?a=add&domain=register" id="domain-search">
                        <div class="input-group">
                            <input type="text" class="form-control form-control-lg" placeholder="eg. example.com" name="domain" autocomplete="off">
                            <button type="submit" class="btn btn-primary btn-lg">Search</button>
                            <button type="button" class="btn btn-success btn-lg" onclick="window.location='cart.php?a=add&domain=transfer'">Transfer</button>
                        </div>
                    </form>
                    <div class="domain-prices mt-4">
                        <div class="d-flex justify-content-center gap-4">
                            <div class="domain-price">
                                <span class="tld">.com</span>
                                <span class="price">$14.50</span>
                            </div>
                            <div class="domain-price">
                                <span class="tld">.net</span>
                                <span class="price">$15.99</span>
                            </div>
                            <div class="text-end">
                                <a href="{$WEB_ROOT}/domain-pricing" class="text-white">View all pricing <i class="fas fa-arrow-right ms-2"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Section 
    <section class="products-section">
        <div class="container">
            <h2 class="section-title text-center mb-5">Browse our Products/Services</h2>
            <div class="row g-4">
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fab fa-wordpress"></i>
                        </div>
                        <h3>WordPress</h3>
                        <p>Optimized WordPress hosting with automatic updates and backups</p>
                        <a href="{$WEB_ROOT}/store/wordpress-hosting" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-server"></i>
                        </div>
                        <h3>Shared Web Hosting</h3>
                        <p>Choose your plan today</p>
                        <a href="{$WEB_ROOT}/store/shared-hosting" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-cogs"></i>
                        </div>
                        <h3>Cpanel Hosting</h3>
                        <p>Full featured web hosting with Cpanel control panel</p>
                        <a href="{$WEB_ROOT}/store/cpanel-hosting" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-headset"></i>
                        </div>
                        <h3>Support Services</h3>
                        <p>Website, Email, Hardware, Administration & Support all in one place.</p>
                        <a href="{$WEB_ROOT}/store/support-services" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-paint-brush"></i>
                        </div>
                        <h3>Website Builder</h3>
                        <p>Build your website with a simple drag and drop interface and plenty of templates to choose from</p>
                        <a href="{$WEB_ROOT}/store/website-builder" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-shield-alt"></i>
                        </div>
                        <h3>CodeGuard</h3>
                        <p>Get peace-of-mind that your website is backed up</p>
                        <a href="{$WEB_ROOT}/store/codeguard" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4">
                    <div class="product-card h-100">
                        <div class="icon">
                            <i class="fas fa-envelope-open"></i>
                        </div>
                        <h3>Email Spam Filtering</h3>
                        <p>Take back control of your inbox</p>
                        <a href="{$WEB_ROOT}/store/email-spam-filtering" class="btn btn-outline-primary">Browse Products</a>
                    </div>
                </div>
                {if $registerdomainenabled}
                    <div class="col-md-6 col-lg-4">
                        <div class="product-card h-100">
                            <div class="icon">
                                <i class="fas fa-globe"></i>
                            </div>
                            <h3>Register a New Domain</h3>
                            <p>Secure your domain name by registering it today</p>
                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-outline-primary">Domain Search</a>
                        </div>
                    </div>
                {/if}
                {if $transferdomainenabled}
                    <div class="col-md-6 col-lg-4">
                        <div class="product-card h-100">
                            <div class="icon">
                                <i class="fas fa-exchange-alt"></i>
                            </div>
                            <h3>Transfer Your Domain</h3>
                            <p>Transfer now to extend your domain by 1 year</p>
                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-outline-primary">Transfer Your Domain</a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </section>
{/if}
-->

<!-- Quick Links 
<section class="quick-links">
    <div class="container">
        <div class="row g-4">
            <div class="col-md-4">
                <a href="{$WEB_ROOT}/store/email-spam-filtering" class="quick-link-card">
                    <i class="fas fa-envelope-open"></i>
                    <h3>Email Spam Filtering</h3>
                    <p>Take back control of your inbox</p>
                </a>
            </div>
            <div class="col-md-4">
                <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="quick-link-card">
                    <i class="fas fa-globe"></i>
                    <h3>Register a New Domain</h3>
                    <p>Secure your domain name by registering it today</p>
                </a>
            </div>
            <div class="col-md-4">
                <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="quick-link-card">
                    <i class="fas fa-exchange-alt"></i>
                    <h3>Transfer Your Domain</h3>
                    <p>Transfer now to extend your domain by 1 year</p>
                </a>
            </div>
        </div>
    </div>
</section>
-->
<!-- Help Section 
<section class="help-section">
    <div class="container">
        <h2 class="section-title text-center">How can we help today</h2>
        <div class="row g-4">
            <div class="col-6 col-md">
                <a href="{routePath('announcement-index')}" class="help-link">
                    <i class="fas fa-bullhorn"></i>
                    <span>Announcements</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="serverstatus.php" class="help-link">
                    <i class="fas fa-server"></i>
                    <span>Network Status</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="{routePath('knowledgebase-index')}" class="help-link">
                    <i class="fas fa-book"></i>
                    <span>Knowledge Base</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="{routePath('download-index')}" class="help-link">
                    <i class="fas fa-download"></i>
                    <span>Downloads</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="submitticket.php" class="help-link">
                    <i class="fas fa-life-ring"></i>
                    <span>Submit a Ticket</span>
                </a>
            </div>
        </div>
    </div>
</section>
-->
<!-- Account Section 
<section class="account-section">
    <div class="container">
        <h2 class="section-title text-center">Your Account</h2>
        <div class="row g-4">
            <div class="col-6 col-md">
                <a href="clientarea.php" class="help-link">
                    <i class="fas fa-home"></i>
                    <span>Your Account</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="clientarea.php?action=services" class="help-link">
                    <i class="fas fa-cubes"></i>
                    <span>Manage Services</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="clientarea.php?action=domains" class="help-link">
                    <i class="fas fa-globe"></i>
                    <span>Manage Domains</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="supporttickets.php" class="help-link">
                    <i class="fas fa-comments"></i>
                    <span>Support Requests</span>
                </a>
            </div>
            <div class="col-6 col-md">
                <a href="clientarea.php?action=masspay&all=true" class="help-link">
                    <i class="fas fa-credit-card"></i>
                    <span>Make a Payment</span>
                </a>
            </div>
        </div>
    </div>
</section>
-->
