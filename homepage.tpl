{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <!-- Domain Search Section -->
    <div class="domain-search-section">
        <div class="container">
            <h1>Secure your <span class="highlight">domain name</span></h1>
            <form class="domain-search-form">
                <input type="text" placeholder="eg. example.com" name="domain" autocomplete="off">
                <button type="submit" class="btn btn-primary">Transfer</button>
            </form>
            <div class="domain-prices">
                <div class="domain-price">
                    <span class="tld">.com</span>
                    <span class="price">$14.50</span>
                </div>
                <div class="domain-price">
                    <span class="tld">.net</span>
                    <span class="price">$15.99</span>
                </div>
            </div>
        </div>
    </div>

    <!-- Products Section -->
    <div class="products-section">
        <div class="container">
            <h2>Browse our Products/Services</h2>
            <div class="products-grid">
                {foreach $productGroups as $productGroup}
                    <div class="product-card">
                        <h3>{$productGroup->name}</h3>
                        <p>{$productGroup->tagline}</p>
                        <a href="{$productGroup->getRoutePath()}" class="btn btn-outline-primary">
                            {lang key='browseProducts'}
                        </a>
                    </div>
                {/foreach}

                {if $registerdomainenabled}
                    <div class="product-card">
                        <h3>{lang key='orderregisterdomain'}</h3>
                        <p>{lang key='secureYourDomain'}</p>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=register" class="btn btn-outline-primary">
                            {lang key='navdomainsearch'}
                        </a>
                    </div>
                {/if}
                {if $transferdomainenabled}
                    <div class="product-card">
                        <h3>{lang key='transferYourDomain'}</h3>
                        <p>{lang key='transferExtend'}</p>
                        <a href="{$WEB_ROOT}/cart.php?a=add&domain=transfer" class="btn btn-outline-primary">
                            {lang key='transferYourDomain'}
                        </a>
                    </div>
                {/if}
            </div>
        </div>
    </div>
{/if}

<!-- Help Section -->
<div class="help-section">
    <div class="container">
        <h2>{lang key='howCanWeHelp'}</h2>
        <div class="help-grid">
            <a href="{routePath('announcement-index')}" class="help-card">
                <div class="icon">
                    <i class="fal fa-bullhorn"></i>
                </div>
                <h3>{lang key='announcementstitle'}</h3>
            </a>
            <a href="serverstatus.php" class="help-card">
                <div class="icon">
                    <i class="fal fa-server"></i>
                </div>
                <h3>{lang key='networkstatustitle'}</h3>
            </a>
            <a href="{routePath('knowledgebase-index')}" class="help-card">
                <div class="icon">
                    <i class="fal fa-book"></i>
                </div>
                <h3>{lang key='knowledgebasetitle'}</h3>
            </a>
            <a href="{routePath('download-index')}" class="help-card">
                <div class="icon">
                    <i class="fal fa-download"></i>
                </div>
                <h3>{lang key='downloadstitle'}</h3>
            </a>
            <a href="submitticket.php" class="help-card">
                <div class="icon">
                    <i class="fal fa-life-ring"></i>
                </div>
                <h3>{lang key='homepage.submitTicket'}</h3>
            </a>
        </div>
    </div>
</div>

<!-- Account Section -->
<div class="help-section">
    <div class="container">
        <h2>{lang key='homepage.yourAccount'}</h2>
        <div class="help-grid">
            <a href="clientarea.php" class="help-card">
                <div class="icon">
                    <i class="fal fa-home"></i>
                </div>
                <h3>{lang key='homepage.yourAccount'}</h3>
            </a>
            <a href="clientarea.php?action=services" class="help-card">
                <div class="icon">
                    <i class="far fa-cubes"></i>
                </div>
                <h3>{lang key='homepage.manageServices'}</h3>
            </a>
            {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
                <a href="clientarea.php?action=domains" class="help-card">
                    <div class="icon">
                        <i class="fal fa-globe"></i>
                    </div>
                    <h3>{lang key='homepage.manageDomains'}</h3>
                </a>
            {/if}
            <a href="supporttickets.php" class="help-card">
                <div class="icon">
                    <i class="fal fa-comments"></i>
                </div>
                <h3>{lang key='homepage.supportRequests'}</h3>
            </a>
            <a href="clientarea.php?action=masspay&all=true" class="help-card">
                <div class="icon">
                    <i class="fal fa-credit-card"></i>
                </div>
                <h3>{lang key='homepage.makeAPayment'}</h3>
            </a>
        </div>
    </div>
</div>
