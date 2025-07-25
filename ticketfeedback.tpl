<div class="card">
    <div class="card-body">
        {if $stillopen}
            {include file="$template/includes/alert.tpl" type="warning" msg="{lang key='feedbackclosed'}" textcenter=true}

            <p class="text-center">
                <a href="clientarea.php" class="btn btn-primary">{lang key='returnclient'}</a>
            </p>
        {elseif $feedbackdone}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='feedbackprovided'}" textcenter=true}

            <p class="text-center">{lang key='feedbackthankyou'}</p>

            <p class="text-center">
                <a href="clientarea.php" class="btn btn-primary">{lang key='returnclient'}</a>
            </p>
        {elseif $success}
            {include file="$template/includes/alert.tpl" type="success" msg="{lang key='feedbackreceived'}" textcenter=true}

            <p class="text-center">{lang key='feedbackthankyou'}</p>

            <p class="text-center">
                <a href="clientarea.php" class="btn btn-primary">{lang key='returnclient'}</a>
            </p>
        {else}

            {if $errormessage}
                {include file="$template/includes/alert.tpl" type="error" errorshtml=$errormessage}
            {/if}

            <p>{lang key='feedbackdesc'}</p>

            <p class="text-center"><a href="viewticket.php?tid={$tid}&amp;c={$c}" class="btn btn-success">{lang key='feedbackclickreview'}&nbsp; <i class="fas fa-arrow-right">&nbsp;</i></a></p>

            <div class="row">
                <div class="col-sm-10 offset-sm-1">
                    <table class="table table-striped">
                        <tr>
                            <td>{lang key='feedbackopenedat'}:</td>
                            <td><strong>{$opened}</strong></td>
                        </tr>
                        <tr>
                            <td>{lang key='feedbacklastreplied'}:</td>
                            <td><strong>{$lastreply}</strong></td>
                        </tr>
                        <tr>
                            <td>{lang key='feedbackstaffinvolved'}:</td>
                            <td><strong>{if $staffinvolvedtext}{$staffinvolvedtext}{else}{lang key='none'}{/if}</strong></td>
                        </tr>
                        <tr>
                            <td>{lang key='feedbacktotalduration'}:</td>
                            <td><strong>{$duration}</strong></td>
                        </tr>
                    </table>
                </div>
            </div>

            <form method="post" action="?tid={$tid}&c={$c}&feedback=1">
                <input type="hidden" name="validate" value="true" />

                {foreach $staffinvolved as $staffid => $staff}

                    <div class="ticketfeedbackstaffcont">

                        <p>{lang key='feedbackpleaserate1'} <strong>{$staff}</strong> {lang key='feedbackhandled'}:</p>

                        <table class="table text-center">
                            <thead>
                            <tr>
                                <td>{lang key='feedbackworst'}</td>
                                <td>1</td>
                                <td>2</td>
                                <td>3</td>
                                <td>4</td>
                                <td>5</td>
                                <td>6</td>
                                <td>7</td>
                                <td>8</td>
                                <td>9</td>
                                <td>10</td>
                                <td>{lang key='feedbackbest'}</td>
                            </tr>
                            </thead>
                            <tbody>
                            <tr>
                                <td>&nbsp;</td>
                                {foreach $ratings as $rating}
                                    <td><input type="radio" class="form-check-input" name="rate[{$staffid}]" value="{$rating}"{if $rate.$staffid eq $rating} checked{/if} /></td>
                                {/foreach}
                                <td>&nbsp;</td>
                            </tr>
                            </tbody>
                        </table>

                        <p>{lang key='feedbackpleasecomment1'} <strong>{$staff}</strong> {lang key='feedbackhandled'}.</p>

                        <div class="row">
                            <div class="col-sm-10 offset-sm-1">
                                <textarea name="comments[{$staffid}]" rows="4" class="form-control">{$comments.$staffid}</textarea>
                            </div>
                        </div>

                    </div>

                {/foreach}

                <p>{lang key='feedbackimprove'}</p>

                <div class="row">
                    <div class="col-sm-10 offset-sm-1">
                        <textarea name="comments[generic]" rows="4" class="form-control">{$comments.generic}</textarea>
                    </div>
                </div>

                <br />

                <div class="form-group text-center">
                    <input class="btn btn-primary" type="submit" name="save" value="{lang key='clientareasavechanges'}" />
                    <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
                </div>

            </form>

        {/if}
    </div>
</div>
