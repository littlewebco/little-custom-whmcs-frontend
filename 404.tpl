{if !empty($productGroups) || $registerdomainenabled || $transferdomainenabled}
<div class="error-page">
    <div class="container">
        <div class="error-content">
            <h1>Error 404</h1>
            <p>The page you are looking for was moved, removed or might never existed.</p>
            <a href="{$WEB_ROOT}" class="btn btn-primary">
                <i class="fas fa-home"></i>
                Go to homepage
            </a>
        </div>
    </div>
</div>
{/if} 