{include file="$template/includes/flashmessage.tpl"}

<div class="tiles mb-4 animate-fade-in">
    <div class="row g-4">
        <div class="col-6 col-xl-3">
            <a href="clientarea.php?action=services" class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-cube fa-2x mb-3 text-primary"></i>
                    <div class="stat display-6 fw-bold">{$clientsstats.productsnumactive}</div>
                    <div class="title text-muted">{lang key='navservices'}</div>
                </div>
            </a>
        </div>
        {if $clientsstats.numdomains || $registerdomainenabled || $transferdomainenabled}
            <div class="col-6 col-xl-3">
                <a href="clientarea.php?action=domains" class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-globe fa-2x mb-3 text-success"></i>
                        <div class="stat display-6 fw-bold">{$clientsstats.numactivedomains}</div>
                        <div class="title text-muted">{lang key='navdomains'}</div>
                    </div>
                </a>
            </div>
        {elseif $condlinks.affiliates && $clientsstats.isAffiliate}
            <div class="col-6 col-xl-3">
                <a href="affiliates.php" class="card h-100">
                    <div class="card-body text-center">
                        <i class="fas fa-shopping-cart fa-2x mb-3 text-success"></i>
                        <div class="stat display-6 fw-bold">{$clientsstats.numaffiliatesignups}</div>
                        <div class="title text-muted">{lang key='affiliatessignups'}</div>
                    </div>
                </a>
            </div>
        {else}
            <div class="col-6 col-xl-3">
                <a href="clientarea.php?action=quotes" class="card h-100">
                    <div class="card-body text-center">
                        <i class="far fa-file-alt fa-2x mb-3 text-success"></i>
                        <div class="stat display-6 fw-bold">{$clientsstats.numquotes}</div>
                        <div class="title text-muted">{lang key='quotes'}</div>
                    </div>
                </a>
            </div>
        {/if}
        <div class="col-6 col-xl-3">
            <a href="supporttickets.php" class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-comments fa-2x mb-3 text-danger"></i>
                    <div class="stat display-6 fw-bold">{$clientsstats.numactivetickets}</div>
                    <div class="title text-muted">{lang key='navtickets'}</div>
                </div>
            </a>
        </div>
        <div class="col-6 col-xl-3">
            <a href="clientarea.php?action=invoices" class="card h-100">
                <div class="card-body text-center">
                    <i class="fas fa-credit-card fa-2x mb-3 text-warning"></i>
                    <div class="stat display-6 fw-bold">{$clientsstats.numunpaidinvoices}</div>
                    <div class="title text-muted">{lang key='navinvoices'}</div>
                </div>
            </a>
        </div>
    </div>
</div>

{foreach $addons_html as $addon_html}
    <div class="mb-4">
        {$addon_html}
    </div>
{/foreach}

<div class="client-home-panels">
    <div class="row g-4">
        <div class="col-12">
            {function name=outputHomePanels}
                <div menuItemName="{$item->getName()}" class="card card-accent-{$item->getExtra('color')}{if $item->getClass()} {$item->getClass()}{/if}"{if $item->getAttribute('id')} id="{$item->getAttribute('id')}"{/if}>
                    <div class="card-header border-0 bg-transparent">
                        <h3 class="card-title m-0">
                            {if $item->getExtra('btn-link') && $item->getExtra('btn-text')}
                                <div class="float-end">
                                    <a href="{$item->getExtra('btn-link')}" class="btn btn-sm btn-primary">
                                        {if $item->getExtra('btn-icon')}<i class="{$item->getExtra('btn-icon')} me-1"></i>{/if}
                                        {$item->getExtra('btn-text')}
                                    </a>
                                </div>
                            {/if}
                            {if $item->hasIcon()}<i class="{$item->getIcon()} me-2"></i>{/if}
                            {$item->getLabel()}
                            {if $item->hasBadge()}<span class="badge bg-primary ms-2">{$item->getBadge()}</span>{/if}
                        </h3>
                    </div>
                    {if $item->hasBodyHtml()}
                        <div class="card-body">
                            {$item->getBodyHtml()}
                        </div>
                    {/if}
                    {if $item->hasChildren()}
                        <div class="list-group list-group-flush{if $item->getChildrenAttribute('class')} {$item->getChildrenAttribute('class')}{/if}">
                            {foreach $item->getChildren() as $childItem}
                                {if $childItem->getUri()}
                                    <a menuItemName="{$childItem->getName()}" href="{$childItem->getUri()}" class="list-group-item list-group-item-action d-flex align-items-center{if $childItem->getClass()} {$childItem->getClass()}{/if}{if $childItem->isCurrent()} active{/if}"{if $childItem->getAttribute('dataToggleTab')} data-toggle="tab"{/if}{if $childItem->getAttribute('target')} target="{$childItem->getAttribute('target')}"{/if} id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} me-2"></i>{/if}
                                        <span>{$childItem->getLabel()}</span>
                                        {if $childItem->hasBadge()}<span class="badge bg-primary ms-auto">{$childItem->getBadge()}</span>{/if}
                                    </a>
                                {else}
                                    <div menuItemName="{$childItem->getName()}" class="list-group-item d-flex align-items-center{if $childItem->getClass()} {$childItem->getClass()}{/if}" id="{$childItem->getId()}">
                                        {if $childItem->hasIcon()}<i class="{$childItem->getIcon()} me-2"></i>{/if}
                                        <span>{$childItem->getLabel()}</span>
                                        {if $childItem->hasBadge()}<span class="badge bg-primary ms-auto">{$childItem->getBadge()}</span>{/if}
                                    </div>
                                {/if}
                            {/foreach}
                        </div>
                    {/if}
                </div>
            {/function}

            {foreach $panels as $item}
                {if $item->getExtra('colspan')}
                    {outputHomePanels}
                    {assign "panels" $panels->removeChild($item->getName())}
                {/if}
            {/foreach}
        </div>

        <div class="col-md-6">
            {foreach $panels as $item}
                {if $item@iteration is odd}
                    {outputHomePanels}
                {/if}
            {/foreach}
        </div>
        <div class="col-md-6">
            {foreach $panels as $item}
                {if $item@iteration is even}
                    {outputHomePanels}
                {/if}
            {/foreach}
        </div>
    </div>
</div>
