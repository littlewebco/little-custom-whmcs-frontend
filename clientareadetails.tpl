{if $successful}
    {include file="$template/includes/alert.tpl" type="success" msg=$LANG.changessavedsuccessfully textcenter=true}
{/if}

{if $errormessage}
    {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
{/if}

{if in_array('state', $optionalFields)}
    <script>
        var stateNotRequired = true;
    </script>
{/if}

<script type="text/javascript" src="{$BASE_PATH_JS}/StatesDropdown.js"></script>

<form method="post" action="?action=details" role="form">
    <input type="hidden" name="save" value="true" />
    
    <div class="card">
        <div class="card-body">
            <h3 class="card-title mb-4">{lang key='clientareanavdetails'}</h3>
            
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputFirstName" class="form-label">{lang key='clientareafirstname'}</label>
                        <input type="text" name="firstname" id="inputFirstName" value="{$clientfirstname}"{if in_array('firstname', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>
                
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputLastName" class="form-label">{lang key='clientarealastname'}</label>
                        <input type="text" name="lastname" id="inputLastName" value="{$clientlastname}"{if in_array('lastname', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputCompanyName" class="form-label">{lang key='clientareacompanyname'}</label>
                        <input type="text" name="companyname" id="inputCompanyName" value="{$clientcompanyname}"{if in_array('companyname', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputEmail" class="form-label">{lang key='clientareaemail'}</label>
                        <input type="email" name="email" id="inputEmail" value="{$clientemail}"{if in_array('email', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputPhone" class="form-label">{lang key='clientareaphonenumber'}</label>
                        <input type="tel" name="phonenumber" id="inputPhone" value="{$clientphonenumber}"{if in_array('phonenumber', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputTaxId" class="form-label">{lang key='clientareataxid'}</label>
                        <input type="text" name="tax_id" id="inputTaxId" value="{$clienttaxid}"{if in_array('tax_id', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                {if $customfields}
                    {foreach from=$customfields item=customfield}
                        <div class="col-md-6">
                            <div class="form-group">
                                <label for="customfield{$customfield.id}" class="form-label">
                                    {$customfield.name}
                                    {if $customfield.required} *{/if}
                                </label>
                                {$customfield.input}
                                {if $customfield.description}
                                    <small class="form-text text-muted">{$customfield.description}</small>
                                {/if}
                            </div>
                        </div>
                    {/foreach}
                {/if}
            </div>
        </div>
    </div>

    <div class="card mt-4">
        <div class="card-body">
            <h3 class="card-title mb-4">{lang key='clientareaaddress'}</h3>
            
            <div class="row g-4">
                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputAddress1" class="form-label">{lang key='clientareaaddress1'}</label>
                        <input type="text" name="address1" id="inputAddress1" value="{$clientaddress1}"{if in_array('address1', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputAddress2" class="form-label">{lang key='clientareaaddress2'}</label>
                        <input type="text" name="address2" id="inputAddress2" value="{$clientaddress2}"{if in_array('address2', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputCity" class="form-label">{lang key='clientareacity'}</label>
                        <input type="text" name="city" id="inputCity" value="{$clientcity}"{if in_array('city', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputState" class="form-label">{lang key='clientareastate'}</label>
                        <input type="text" name="state" id="inputState" value="{$clientstate}"{if in_array('state', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputPostcode" class="form-label">{lang key='clientareapostcode'}</label>
                        <input type="text" name="postcode" id="inputPostcode" value="{$clientpostcode}"{if in_array('postcode', $uneditablefields)} readonly{/if} class="form-control" />
                    </div>
                </div>

                <div class="col-md-6">
                    <div class="form-group">
                        <label for="inputCountry" class="form-label">{lang key='clientareacountry'}</label>
                        {$clientcountriesdropdown}
                    </div>
                </div>
            </div>
        </div>
    </div>

    {if $emailPreferencesEnabled}
        <div class="card mt-4">
            <div class="card-body">
                <h3 class="card-title mb-4">{lang key='clientareacontactsemails'}</h3>
                
                <div class="row g-4">
                    <div class="col-md-12">
                        {foreach $emailPreferences as $emailType => $value}
                            <div class="form-check mb-3">
                                <input type="hidden" name="email_preferences[{$emailType}]" value="0">
                                <input type="checkbox" name="email_preferences[{$emailType}]" id="email_preferences_{$emailType}" value="1"{if $value} checked{/if} class="form-check-input" />
                                <label for="email_preferences_{$emailType}" class="form-check-label">
                                    {lang key="emailPreferences."|cat:$emailType}
                                </label>
                            </div>
                        {/foreach}
                    </div>
                </div>
            </div>
        </div>
    {/if}

    <div class="form-group mt-4">
        <button type="submit" class="btn btn-primary">{lang key='clientareasavechanges'}</button>
        <button type="reset" class="btn btn-default">{lang key='cancel'}</button>
    </div>

</form>
