{$headeroutput}

<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <a class="navbar-brand" href="{$WEB_ROOT}/index.php">
            {if $assetLogoPath}
                <img src="{$assetLogoPath}" alt="{$companyname}" class="logo">
            {else}
                <img src="{$WEB_ROOT}/assets/img/logo.svg" alt="{$companyname}" class="logo">
            {/if}
            Little Cloud
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#primaryNavbar" aria-controls="primaryNavbar" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="primaryNavbar">
            <ul class="navbar-nav me-auto">
                {include file="$template/includes/navbar.tpl" navbar=$primaryNavbar}
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
                    <a href="{$WEB_ROOT}/login.php" class="btn btn-outline-light me-2">Login</a>
                    <a href="{$WEB_ROOT}/register.php" class="btn btn-primary">Sign Up</a>
                {/if}
            </div>
        </div>
    </div>
</nav>

{if $templatefile == 'homepage'}
    {include file="$template/includes/network-issues-notifications.tpl"}
{/if}
