<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    
    <!-- Critical performance optimizations -->
    <style>
        /* Critical layout styles to prevent CLS */
        body { margin: 0; font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif; }
        .main-content { margin-top: 76px; min-height: calc(100vh - 200px); }
        .container { max-width: 1200px; margin: 0 auto; padding: 0 15px; }
        .sidebar { margin-bottom: 2rem; }
        .primary-content { padding: 0; }
        /* Loading states */
        .spinner { display: inline-block; width: 20px; height: 20px; }
        .spinner div { background-color: #007bff; }
        /* Prevent layout shift for images */
        img { max-width: 100%; height: auto; }
        .logo-img { width: 40px; height: 40px; }
    </style>
    
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

    <!-- Optimized overlay with better UX -->
    <div id="fullpage-overlay" class="w-hidden" style="position: fixed; top: 0; left: 0; width: 100%; height: 100%; background: rgba(255,255,255,0.9); z-index: 9999; display: flex; align-items: center; justify-content: center;">
        <div class="outer-wrapper">
            <div class="inner-wrapper" style="text-align: center;">
                <!-- Optimized spinner using CSS animation instead of SVG -->
                <div style="width: 40px; height: 40px; border: 4px solid #f3f3f3; border-top: 4px solid #007bff; border-radius: 50%; animation: spin 1s linear infinite; margin: 0 auto 1rem;"></div>
                <span class="msg" style="color: #666; font-size: 14px;">Loading...</span>
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

    <!-- Add spinner animation CSS -->
    <style>
        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }
        
        /* Optimize modal animations */
        .modal.fade .modal-dialog {
            transition: transform 0.2s ease-out;
        }
        
        /* Improve focus management */
        .btn:focus, .form-control:focus {
            outline: 2px solid #007bff;
            outline-offset: 2px;
        }
    </style>

    {$footeroutput}
</body>
</html> 