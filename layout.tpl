<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>
<body class="{if $templatefile == 'homepage'}home{/if} {$language} {$templatefile}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}
    
    {include file="$template/header.tpl"}
    
    <main class="main-content">
        <div id="main-body">
            {if $templatefile == 'homepage'}
                {include file="$template/includes/network-issues-notifications.tpl"}
            {/if}

            {include file="$template/includes/verifyemail.tpl"}
            {include file="$template/includes/validateuser.tpl"}
            {include file="$template/includes/network-issues-notifications.tpl"}

            <div class="{if !$skipMainBodyContainer}container{/if}">
                <div class="row">
                    {if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}
                        <div class="col-lg-4 col-xl-3">
                            <div class="sidebar">
                                {include file="$template/includes/sidebar.tpl" sidebar=$primarySidebar}
                            </div>
                            {if !$inShoppingCart && $secondarySidebar->hasChildren()}
                                <div class="d-none d-lg-block sidebar">
                                    {include file="$template/includes/sidebar.tpl" sidebar=$secondarySidebar}
                                </div>
                            {/if}
                        </div>
                    {/if}
                    <div class="{if !$inShoppingCart && ($primarySidebar->hasChildren() || $secondarySidebar->hasChildren())}col-lg-8 col-xl-9{else}col-12{/if} primary-content">
                        {$template_content}
                    </div>
                </div>
            </div>
        </div>
    </main>

    {include file="$template/includes/footer.tpl"}

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
                        <div class="spinner spinner-sm spinner-light">
                            <div class="rect1"></div>
                            <div class="rect2"></div>
                            <div class="rect3"></div>
                            <div class="rect4"></div>
                            <div class="rect5"></div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="pull-left loader">
                        <i class="fas fa-circle-notch fa-spin"></i>
                        {lang key='loading'}
                    </div>
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