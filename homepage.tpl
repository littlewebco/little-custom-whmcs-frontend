{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
<div class="homepage-container">
    <!-- Hero Section -->
    <div class="hero-section">
        <div class="overlay"></div>
        <div class="container h-100">
            <div class="row h-100">
                <div class="col-12 my-auto">
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
        </div>
    </div>
</div>
{/if}

<!-- Hidden sections for reference -->
{* 
    Products Section, Quick Links, Help Section, and Account Section are moved to the navigation.
    This keeps the homepage clean with just the domain search hero section.
*}
