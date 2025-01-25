<div class="global-footer">
    <div class="container">
        <h2>{lang key='howCanWeHelp'}</h2>
        <div class="action-icon-btns">
            <a href="{routePath('announcement-index')}" class="card-accent-teal">
                <figure class="ico-container">
                    <i class="fas fa-bullhorn"></i>
                </figure>
                {lang key='announcementstitle'}
            </a>
            <a href="serverstatus.php" class="card-accent-pomegranate">
                <figure class="ico-container">
                    <i class="fas fa-server"></i>
                </figure>
                {lang key='networkstatustitle'}
            </a>
            <a href="{routePath('knowledgebase-index')}" class="card-accent-sun-flower">
                <figure class="ico-container">
                    <i class="fas fa-book"></i>
                </figure>
                {lang key='knowledgebasetitle'}
            </a>
            <a href="{routePath('download-index')}" class="card-accent-asbestos">
                <figure class="ico-container">
                    <i class="fas fa-download"></i>
                </figure>
                {lang key='downloadstitle'}
            </a>
            <a href="submitticket.php" class="card-accent-green">
                <figure class="ico-container">
                    <i class="fas fa-life-ring"></i>
                </figure>
                {lang key='homepage.submitTicket'}
            </a>
        </div>

        <h2>{lang key='homepage.yourAccount'}</h2>
        <div class="action-icon-btns">
            <a href="clientarea.php" class="card-accent-midnight-blue">
                <figure class="ico-container">
                    <i class="fas fa-home"></i>
                </figure>
                {lang key='homepage.yourAccount'}
            </a>
            <a href="clientarea.php?action=services" class="card-accent-midnight-blue">
                <figure class="ico-container">
                    <i class="fas fa-cubes"></i>
                </figure>
                {lang key='homepage.manageServices'}
            </a>
            {if $registerdomainenabled || $transferdomainenabled || $numberOfDomains}
                <a href="clientarea.php?action=domains" class="card-accent-midnight-blue">
                    <figure class="ico-container">
                        <i class="fas fa-globe"></i>
                    </figure>
                    {lang key='homepage.manageDomains'}
                </a>
            {/if}
            <a href="supporttickets.php" class="card-accent-midnight-blue">
                <figure class="ico-container">
                    <i class="fas fa-comments"></i>
                </figure>
                {lang key='homepage.supportRequests'}
            </a>
            <a href="clientarea.php?action=masspay&all=true" class="card-accent-midnight-blue">
                <figure class="ico-container">
                    <i class="fas fa-credit-card"></i>
                </figure>
                {lang key='homepage.makeAPayment'}
            </a>
        </div>
    </div>
</div> 