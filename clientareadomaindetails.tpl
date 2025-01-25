{if $registrarcustombuttonresult=="success"}
    {include file="$template/includes/alert.tpl" type="success" msg="{lang key='moduleactionsuccess'}" textcenter=true}
{elseif $registrarcustombuttonresult}
    {include file="$template/includes/alert.tpl" type="error" msg="{lang key='moduleactionfailed'}" textcenter=true}
{/if}

{if $unpaidInvoice}
    <div class="alert alert-{if $unpaidInvoiceOverdue}danger{else}warning{/if}" id="alert{if $unpaidInvoiceOverdue}Overdue{else}Unpaid{/if}Invoice">
        <div class="float-end">
            <a href="viewinvoice.php?id={$unpaidInvoice}" class="btn btn-sm btn-light">
                {lang key='payInvoice'}
            </a>
        </div>
        {$unpaidInvoiceMessage}
    </div>
{/if}

<div class="card">
    <div class="card-body">
        <h3 class="card-title mb-4">{lang key='overview'}</h3>

        {if $alerts}
            {foreach $alerts as $alert}
                {include file="$template/includes/alert.tpl" type=$alert.type msg="<strong>{$alert.title}</strong><br>{$alert.description}" textcenter=true}
            {/foreach}
        {/if}

        {if $systemStatus != 'Active'}
            <div class="alert alert-warning text-center">
                {lang key='domainCannotBeManagedUnlessActive'}
            </div>
        {/if}

        {if $lockstatus eq "unlocked"}
            {capture name="domainUnlockedMsg"}<strong>{lang key='domaincurrentlyunlocked'}</strong><br />{lang key='domaincurrentlyunlockedexp'}{/capture}
            {include file="$template/includes/alert.tpl" type="error" msg=$smarty.capture.domainUnlockedMsg}
        {/if}

        <div class="row g-4">
            <div class="col-lg-6">
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='clientareahostingdomain'}</label>
                    <div><a href="http://{$domain}" target="_blank" class="text-decoration-none">{$domain}</a></div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='clientareahostingregdate'}</label>
                    <div>{$registrationdate}</div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='clientareahostingnextduedate'}</label>
                    <div>{$nextduedate}</div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='clientareastatus'}</label>
                    <div><span class="badge bg-{if $status eq 'Active'}success{else}danger{/if}">{$status}</span></div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='firstpaymentamount'}</label>
                    <div>{$firstpaymentamount}</div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='recurringamount'}</label>
                    <div>{$recurringamount} {lang key='every'} {$registrationperiod} {lang key='orderyears'}</div>
                </div>
                <div class="mb-3">
                    <label class="form-label text-muted">{lang key='orderpaymentmethod'}</label>
                    <div>{$paymentmethod}</div>
                </div>
                {if $sslStatus}
                    <div class="mb-3">
                        <label class="form-label text-muted">{lang key='sslState.sslStatus'}</label>
                        <div class="{if $sslStatus->isInactive()}ssl-inactive{/if}">
                            <img src="{$sslStatus->getImagePath()}" width="16" data-type="domain" data-domain="{$domain}" data-showlabel="1" class="{$sslStatus->getClass()}"/>
                            <span id="statusDisplayLabel">
                                {if !$sslStatus->needsResync()}
                                    {$sslStatus->getStatusDisplayLabel()}
                                {else}
                                    {lang key='loading'}
                                {/if}
                            </span>
                        </div>
                    </div>
                {/if}
            </div>
        </div>
    </div>
</div>

<div class="card mt-4">
    <div class="card-body">
        <h3 class="card-title mb-4">{lang key='domainnameservers'}</h3>

        {if $nameservererror}
            {include file="$template/includes/alert.tpl" type="error" msg=$nameservererror textcenter=true}
        {/if}
        {if $subaction eq "savens"}
            {if $updatesuccess}
                {include file="$template/includes/alert.tpl" type="success" msg="{lang key='changessavedsuccessfully'}" textcenter=true}
            {elseif $error}
                {include file="$template/includes/alert.tpl" type="error" msg=$error textcenter=true}
            {/if}
        {/if}

        {include file="$template/includes/alert.tpl" type="info" msg="{lang key='domainnsexp'}"}

        <form class="form-horizontal" role="form" method="post" action="{$smarty.server.PHP_SELF}?action=domaindetails#tabNameservers">
            <input type="hidden" name="id" value="{$domainid}" />
            <input type="hidden" name="sub" value="savens" />

            <div class="row g-3">
                {for $num=1 to 5}
                    <div class="col-lg-6">
                        <div class="form-group">
                            <label for="inputNs{$num}" class="form-label">{lang key='clientareanameserver'} {$num}</label>
                            <input type="text" name="ns{$num}" class="form-control" id="inputNs{$num}" value="{$nameservers[$num].value}" />
                        </div>
                    </div>
                {/for}
            </div>

            <div class="text-center mt-4">
                <button type="submit" class="btn btn-primary">
                    {lang key='changenameservers'}
                </button>
            </div>
        </form>
    </div>
</div>

