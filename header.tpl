<!doctype html>
<html lang="en">
<head>
    <meta charset="{$charset}" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>{if $kbarticle.title}{$kbarticle.title} - {/if}{$pagetitle} - {$companyname}</title>
    {include file="$template/includes/head.tpl"}
    {$headoutput}
</head>
<body class="primary-bg-color" data-phone-cc-input="{$phoneNumberInputStyle}">
    {$headeroutput}

    <header id="header" class="header">
        <nav class="navbar navbar-expand-lg fixed-top">
            <div class="container">
                <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
                    {if $assetLogoPath}
                        <img src="{$assetLogoPath}" alt="{$companyname}" width="47" height="47">
                    {else}
                        <img src="{$WEB_ROOT}/assets/img/logo.svg" alt="{$companyname}" width="47" height="47">
                    {/if}
                    <span>{$companyname}</span>
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#primaryNavbar" aria-controls="primaryNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="primaryNavbar">
                    <ul class="navbar-nav me-auto">
                        {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
                    </ul>

                    <div class="navbar-nav ms-auto">
                        <div class="theme-toggle me-3">
                            <span class="theme-toggle-option" data-theme="light">Light</span>
                            <span class="theme-toggle-option active" data-theme="dark">Dark</span>
                        </div>
                        {if $loggedin}
                            <div class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                    <i class="fas fa-user me-1"></i>
                                    {$clientsdetails.firstname}
                                </a>
                                <div class="dropdown-menu dropdown-menu-end">
                                    <a class="dropdown-item" href="clientarea.php">Dashboard</a>
                                    <a class="dropdown-item" href="clientarea.php?action=services">My Services</a>
                                    <a class="dropdown-item" href="clientarea.php?action=domains">My Domains</a>
                                    <a class="dropdown-item" href="clientarea.php?action=invoices">Billing</a>
                                    <a class="dropdown-item" href="clientarea.php?action=details">My Details</a>
                                    <div class="dropdown-divider"></div>
                                    <a class="dropdown-item" href="logout.php">Logout</a>
                                </div>
                            </div>
                        {else}
                            <a href="login.php" class="btn btn-outline-light me-2">Login</a>
                            <a href="register.php" class="btn btn-primary">Sign Up</a>
                        {/if}
                    </div>
                </div>
            </div>
        </nav>
    </header>

    {if $templatefile == 'homepage'}
        {include file="$template/includes/network-issues-notifications.tpl"}
    {/if}

    {include file="$template/includes/verifyemail.tpl"}

    {if $templatefile != 'login' && $templatefile != 'password-reset-container' && $templatefile != 'password-reset-confirm' && $templatefile != 'logout'}
        <nav class="master-breadcrumb" aria-label="breadcrumb">
            <div class="container">
                <ol class="breadcrumb">
                    {foreach $breadcrumb as $item}
                        <li class="breadcrumb-item{if $item@last} active{/if}">
                            {if !$item@last}<a href="{$item.link}">{/if}
                            {$item.label}
                            {if !$item@last}</a>{/if}
                        </li>
                    {/foreach}
                </ol>
            </div>
        </nav>
    {/if}

    {include file="$template/includes/validateuser.tpl"}
    {include file="$template/includes/network-issues-notifications.tpl"}

    <section id="main-body">
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
