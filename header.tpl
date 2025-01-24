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
                    <img src="{$WEB_ROOT}/assets/img/logo.png" alt="{$companyname}">
                </a>

                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#primaryNavbar" aria-controls="primaryNavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>

                <div class="collapse navbar-collapse" id="primaryNavbar">
                    <ul class="navbar-nav me-auto">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Hosting
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/shared-hosting">Shared Hosting</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/wordpress-hosting">WordPress Hosting</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/cpanel-hosting">cPanel Hosting</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/website-builder">Website Builder</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Domains
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="{$WEB_ROOT}/cart.php?a=add&domain=register">Register</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/cart.php?a=add&domain=transfer">Transfer</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/domain-pricing">Pricing</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Security
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/ssl-certificates">SSL Certificates</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/codeguard">Website Backup</a>
                                <a class="dropdown-item" href="{$WEB_ROOT}/store/email-spam-filtering">Email Protection</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">
                                Support
                            </a>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="{routePath('knowledgebase-index')}">Knowledge Base</a>
                                <a class="dropdown-item" href="serverstatus.php">Network Status</a>
                                <a class="dropdown-item" href="{routePath('announcement-index')}">Announcements</a>
                                <a class="dropdown-item" href="submitticket.php">Contact Support</a>
                            </div>
                        </li>
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
