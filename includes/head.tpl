<!-- Styling -->
{\WHMCS\View\Asset::fontCssInclude('open-sans-family.css')}
<!-- Preload critical CSS for faster loading -->
<link rel="preload" href="{assetPath file='all.min.css'}?v={$versionHash}" as="style" onload="this.onload=null;this.rel='stylesheet'">
<noscript><link href="{assetPath file='all.min.css'}?v={$versionHash}" rel="stylesheet"></noscript>
<link href="{assetPath file='theme.min.css'}?v={$versionHash}" rel="stylesheet">
<link href="{$WEB_ROOT}/assets/css/fontawesome-all.min.css" rel="stylesheet">
{if $templatefile == 'homepage'}
<link href="{$WEB_ROOT}/assets/css/homepage.css" rel="stylesheet">
{/if}
{assetExists file="custom.css"}
<link href="{$__assetPath__}" rel="stylesheet">
{/assetExists}

<!-- Preconnect to external resources -->
<link rel="preconnect" href="https://cdn.jsdelivr.net" crossorigin>
<link rel="dns-prefetch" href="https://cdn.jsdelivr.net">

<!-- JavaScript Dependencies - Load jQuery synchronously first -->
<!-- Load jQuery first (required by WHMCS components) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js"></script>

<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}";
    {if $captcha}{$captcha->getPageJs()}{/if}
</script>
<!-- Load WHMCS core scripts first -->
<script src="{assetPath file='scripts.min.js'}?v={$versionHash}"></script>
<!-- Load WHMCS-specific scripts after jQuery is available -->
<script>
// Ensure jQuery is available before executing
jQuery(document).ready(function() {
  jQuery("[href*='whmcs.com']").each(function(){
    jQuery(this).parent().remove();
  });
});

// SSO Callback Handler and WHMCS Error Prevention
window.onerror = function(message, source, lineno, colno, error) {
    // Prevent WHMCS is not defined errors from breaking SSO
    if (message.includes('WHMCS is not defined')) {
        console.warn('WHMCS object not yet loaded, initializing fallback...');
        // Initialize minimal WHMCS object if not available
        if (typeof window.WHMCS === 'undefined') {
            window.WHMCS = {
                http: {
                    jqClient: {
                        post: function(url, data, callback) {
                            jQuery.post(url, data, callback);
                        }
                    }
                },
                utils: {},
                hasModule: function(name) { return false; },
                loadModule: function(name) { return false; }
            };
        }
        return true; // Prevent error from propagating
    }
    return false;
};

// SSO Callback Handlers
window.rs = window.rs || {};
window.rs.onSignIn = function(response) {
    console.log('SSO Sign-In callback triggered');
    if (typeof window.WHMCS !== 'undefined' && window.WHMCS.http) {
        // Process SSO response with WHMCS
        try {
            // Handle the SSO response properly
            if (response && response.credential) {
                // Redirect to SSO processing endpoint
                window.location.href = whmcsBaseUrl + '/oauth/process.php?provider=google&token=' + encodeURIComponent(response.credential);
            }
        } catch (e) {
            console.error('SSO processing error:', e);
        }
    } else {
        // Fallback for when WHMCS is not loaded
        console.warn('WHMCS not loaded, using fallback SSO handling');
        setTimeout(function() {
            if (response && response.credential) {
                window.location.href = whmcsBaseUrl + '/oauth/process.php?provider=google&token=' + encodeURIComponent(response.credential);
            }
        }, 500);
    }
};

// Generic error handler for SSO
window.addEventListener('message', function(event) {
    // Handle Cross-Origin-Opener-Policy postMessage errors
    if (event.data && event.data.type === 'sso_callback') {
        rs.onSignIn(event.data.response);
    }
}, false);
</script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
