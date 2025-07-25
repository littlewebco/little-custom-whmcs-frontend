<div class="card mw-540">
    <div class="card-body">
        {include file="$template/includes/flashmessage.tpl"}

        {if $accounts->count() == 0}
            <p>{lang key="switchAccount.noneFound"}</p>
            <p>{lang key="switchAccount.createInstructions"}</p>
            <p>
                <a href="{routePath('cart-index')}" class="btn btn-default">
                    {lang key="shopNow"}
                </a>
            </p>
            <br><br>
        {else}
            <p>{lang key="switchAccount.choose"}</p>

            <div class="select-account">
                {foreach $accounts as $account}
                    <a href="#" data-id="{$account->id}"{if $account->status == 'Closed'} class="disabled"{/if}>
                        {$account->displayName}
                        {if $account->authedUserIsOwner()}
                            <span class="label label-info">{lang key="clientOwner"}</span>
                        {/if}
                        {if $account->status == 'Closed'}
                            <span class="label label-default">{$account->status}</span>
                        {/if}
                    </a>
                {/foreach}
            </div>
        {/if}
    </div>
</div>

<form method="post" action="{routePath('user-accounts')}">
    <input type="hidden" name="id" value="" id="inputSwitchAcctId">
</form>

<script>
    jQuery(document).ready(function() {
        jQuery('.select-account a').click(function(e) {
            e.preventDefault();
            jQuery('#inputSwitchAcctId').val(jQuery(this).data('id'))
                .parent('form').submit();
        });
    });
</script>
