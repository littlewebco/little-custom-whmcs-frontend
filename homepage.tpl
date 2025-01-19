{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="overlay"></div>
        <div class="container">
            <div class="row align-items-center">
                <div class="col-lg-12 text-center">
                    <div class="content">
                        <h1 class="mb-4">Secure your <span class="text-primary">domain name</span></h1>
                        <div class="domain-search">
                            <form class="inline-form">
                                <input type="text" class="form-control form-control-lg" placeholder="eg. example.com" name="domain" autocomplete="off">
                                <button type="submit" class="btn btn-primary btn-lg">Search</button>
                                <button type="button" class="btn btn-success btn-lg">Transfer</button>
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
                                        <a href="#" class="text-primary">View all pricing</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Section -->
    <section class="products-section">
        <div class="container">
            <h2 class="section-title text-center mb-5">Browse our Products/Services</h2>
            <div class="row g-4">
                {foreach $productGroups as $productGroup}
                    <div class="col-md-6 col-lg-4">
                        <div class="product-card h-100">
                            <h3>{$productGroup->name}</h3>
                            <p>{$productGroup->tagline}</p>
                            <a href="{$productGroup->getRoutePath()}" class="btn btn-outline-primary">
                                Browse Products
                            </a>
                        </div>
                    </div>
                {/foreach}

                {if $registerdomainenabled}
                    <div class="col-md-6 col-lg-4">
                        <div class="product-card h-100">
                            <h3>Register a New Domain</h3>
                            <p>Secure your domain name by registering it today</p>
                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-outline-primary">
                                Domain Search
                            </a>
                        </div>
                    </div>
                {/if}

                {if $transferdomainenabled}
                    <div class="col-md-6 col-lg-4">
                        <div class="product-card h-100">
                            <h3>Transfer Your Domain</h3>
                            <p>Transfer now to extend your domain by 1 year</p>
                            <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-outline-primary">
                                Transfer Your Domain
                            </a>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </section>
{/if}

<!-- Help Section -->
<section class="help-section">
    <div class="container">
        <h2 class="section-title text-center mb-5">How can we help today</h2>
        <div class="row g-4">
            <div class="col">
                <a href="{routePath('announcement-index')}" class="help-card">
                    <div class="icon">
                        <i class="fal fa-bullhorn"></i>
                    </div>
                    <h3>Announcements</h3>
                </a>
            </div>
            <div class="col">
                <a href="serverstatus.php" class="help-card">
                    <div class="icon">
                        <i class="fal fa-server"></i>
                    </div>
                    <h3>Network Status</h3>
                </a>
            </div>
            <div class="col">
                <a href="{routePath('knowledgebase-index')}" class="help-card">
                    <div class="icon">
                        <i class="fal fa-book"></i>
                    </div>
                    <h3>Knowledge Base</h3>
                </a>
            </div>
            <div class="col">
                <a href="{routePath('download-index')}" class="help-card">
                    <div class="icon">
                        <i class="fal fa-download"></i>
                    </div>
                    <h3>Downloads</h3>
                </a>
            </div>
            <div class="col">
                <a href="submitticket.php" class="help-card">
                    <div class="icon">
                        <i class="fal fa-life-ring"></i>
                    </div>
                    <h3>Submit a Ticket</h3>
                </a>
            </div>
        </div>
    </div>
</section>

<!-- Account Section -->
<section class="account-section">
    <div class="container">
        <h2 class="section-title text-center mb-5">Your Account</h2>
        <div class="row g-4">
            <div class="col">
                <a href="clientarea.php" class="help-card">
                    <div class="icon">
                        <i class="fal fa-home"></i>
                    </div>
                    <h3>Your Account</h3>
                </a>
            </div>
            <div class="col">
                <a href="clientarea.php?action=services" class="help-card">
                    <div class="icon">
                        <i class="far fa-cubes"></i>
                    </div>
                    <h3>Manage Services</h3>
                </a>
            </div>
            {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
                <div class="col">
                    <a href="clientarea.php?action=domains" class="help-card">
                        <div class="icon">
                            <i class="fal fa-globe"></i>
                        </div>
                        <h3>Manage Domains</h3>
                    </a>
                </div>
            {/if}
            <div class="col">
                <a href="supporttickets.php" class="help-card">
                    <div class="icon">
                        <i class="fal fa-comments"></i>
                    </div>
                    <h3>Support Requests</h3>
                </a>
            </div>
            <div class="col">
                <a href="clientarea.php?action=masspay&all=true" class="help-card">
                    <div class="icon">
                        <i class="fal fa-credit-card"></i>
                    </div>
                    <h3>Make a Payment</h3>
                </a>
            </div>
        </div>
    </div>
</section>
