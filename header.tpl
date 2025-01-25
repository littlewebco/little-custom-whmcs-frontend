<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}

    <!-- Google Tag Manager -->
    {if $google_tag_manager_id}
        <script>
            window.dataLayer = window.dataLayer || [];
            dataLayer.push({
                'templateName': '{$template}',
                'templateFile': '{$templatefile}',
                'language': '{$LANG.locale}',
                'pageType': '{$templatefile}'
            });
            {literal}
            (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
            new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
            j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
            'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
            })(window,document,'script','dataLayer','{/literal}{$google_tag_manager_id}{literal}');
            {/literal}
        </script>
    {/if}
    <!-- End Google Tag Manager -->
</head>
<body class="{if $templatefile == 'homepage'}home{/if} {$language} {$templatefile}" data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}

    <!-- Google Tag Manager (noscript) -->
    {if $google_tag_manager_id}
        <noscript><iframe src="https://www.googletagmanager.com/ns.html?id={$google_tag_manager_id}" height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    {/if}
    <!-- End Google Tag Manager (noscript) -->

    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container">
            <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
                Little Cloud
            </a>

            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#primaryNavbar" aria-controls="primaryNavbar" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="primaryNavbar">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/index.php" class="nav-link">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Store</a>
                        <div class="dropdown-menu">
                            {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                        </div>
                    </li>
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/announcements.php" class="nav-link">Announcements</a>
                    </li>
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/knowledgebase.php" class="nav-link">Knowledgebase</a>
                    </li>
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/serverstatus.php" class="nav-link">Network Status</a>
                    </li>
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/affiliates.php" class="nav-link">Affiliates</a>
                    </li>
                    <li class="nav-item">
                        <a href="{$WEB_ROOT}/contact.php" class="nav-link">Contact Us</a>
                    </li>
                </ul>

                <div class="navbar-nav ms-auto">
                    {if $loggedin}
                        <div class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="fas fa-user me-1"></i>
                                {$clientsdetails.firstname}
                            </a>
                            <div class="dropdown-menu dropdown-menu-end">
                                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php">Dashboard</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=services">My Services</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=domains">My Domains</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=invoices">Billing</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/clientarea.php?action=details">My Details</a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="{$WEB_ROOT}/logout.php">Logout</a>
                            </div>
                        </div>
                    {else}
                        <a href="{$WEB_ROOT}/login.php" class="btn btn-outline-light">Login</a>
                        <a href="{$WEB_ROOT}/register.php" class="btn btn-primary ms-3">Sign Up</a>
                    {/if}
                </div>
            </div>
        </div>
    </nav>

    {if $templatefile == 'homepage'}
        {include file="$template/includes/network-issues-notifications.tpl"}
    {/if}

    {include file="$template/includes/verifyemail.tpl"}
    
    {if $templatefile == 'homepage'}
        {include file="$template/includes/network-issues-notifications.tpl"}
    {/if}

    {if $templatefile != 'login' && $templatefile != 'password-reset-container' && $templatefile != 'password-reset'}
        <div class="alert alert-warning global-warning-banner m-0 alert-warning {if $templatefile == 'homepage' || $templatefile == 'login' || $templatefile == 'password-reset-container' || $templatefile == 'password-reset'}global-warning-banner-slim{/if} {if $templatefile == 'homepage'}hidden{/if}" role="alert">
            <div class="container">
                <div class="d-flex flex-column flex-lg-row align-items-center justify-content-between">
                    <div class="fw-bold">
                        {if $lagomClientAlerts->default->warning}
                            {$lagomClientAlerts->default->warning}
                        {/if}
                    </div>
                    <div class="d-flex align-items-center">
                        <a href="{$WEB_ROOT}/cart.php" class="btn btn-success">{$LANG.orderForm.checkout}</a>
                    </div>
                </div>
            </div>
        </div>
    {/if}
</body>
</html>