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

<!-- JavaScript Dependencies - Using modern CDN versions instead of bundled outdated ones -->
<!-- Preload critical JavaScript -->
<link rel="preload" href="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js" as="script">
<link rel="preload" href="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" as="script">
<link rel="preload" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" as="script">

<!-- Load jQuery first (required by WHMCS components) -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" defer></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.min.js" defer></script>

<script>
    var csrfToken = '{$token}',
        markdownGuide = '{lang|addslashes key="markdown.title"}',
        locale = '{if !empty($mdeLocale)}{$mdeLocale}{else}en{/if}',
        saved = '{lang|addslashes key="markdown.saved"}',
        saving = '{lang|addslashes key="markdown.saving"}',
        whmcsBaseUrl = "{\WHMCS\Utility\Environment\WebHelper::getBaseUrl()}",
        requiredText = '{lang|addslashes key="orderForm.required"}',
        recaptchaSiteKey = "{if $captcha}{$captcha->recaptcha->getSiteKey()}{/if}";
</script>
<!-- Load only WHMCS-specific scripts, removing the large bundled library -->
<script src="{$WEB_ROOT}/js/whmcs.js?v={$versionHash}" defer></script>
<script src="{$WEB_ROOT}/js/bootstrap-init.js?v={$versionHash}" defer></script>
<!-- Load our optimized performance script -->
<script src="{$WEB_ROOT}/js/performance-optimizer.js?v={$versionHash}" defer></script>
<script>
// Defer non-critical JavaScript execution
document.addEventListener('DOMContentLoaded', function() {
  $("[href*='whmcs.com']").each(function(){
    $(this).parent().remove();
  });
});
</script>

{if $templatefile == "viewticket" && !$loggedin}
  <meta name="robots" content="noindex" />
{/if}
