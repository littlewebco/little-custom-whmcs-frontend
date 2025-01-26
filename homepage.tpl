{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
    <div class="search-box">
        <div class="container">
            <form method="post" action="cart.php?a=add&domain=register" id="domain-search">
                <h1 class="text-center">it all starts<br>with a <span class="search-box-text-primary">little</span> idea</h1>
                <p class="text-center">Secure your domain name and get started on your journey to success.</p>
                <div class="row">
                    <div class="col-md-8 col-md-offset-2 col-sm-10 col-sm-offset-1">
                        <div class="input-group input-group-lg">
                            <input type="text" class="form-control" name="domain" placeholder="eg. example.com" autocomplete="off" />
                        </div>
                        <div class="search-box-buttons">
                            <button type="submit" class="btn btn-primary">Search</button>
                            <button type="button" class="btn btn-success" onclick="window.location='cart.php?a=add&domain=transfer'">Transfer</button>
                        </div>
                    </div>
                </div>
            </form>
            <div class="domain-pricing">
                <div class="d-flex justify-content-center gap-4">
                    <span class="tld-pricing">.com $14.50</span>
                    <span class="tld-pricing">.net $15.99</span>
                    <br>
                    <a href="{$WEB_ROOT}/domain-pricing">View all pricing</a>
                </div>
            </div>
        </div>
    </div>

    <h2 class="text-center m-4">{lang key='clientHomePanels.productsAndServices'}</h2>

    <div class="card-columns home">
        {foreach $productGroups as $productGroup}
            <div class="card mb-3">
                <div class="card-body p-lg-4 p-xl-5 text-center">
                    <h3 class="card-title pricing-card-title">
                        {$productGroup->name}
                    </h3>
                    <p>{$productGroup->tagline}</p>
                    <a href="{$productGroup->getRoutePath()}" class="btn btn-block btn-outline-primary">
                        {lang key='browseProducts'}
                    </a>
                </div>
            </div>
        {/foreach}
    </div>
{/if}
