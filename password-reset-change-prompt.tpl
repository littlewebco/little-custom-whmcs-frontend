<p>{lang key='pwresetenternewpw'}</p>

<form class="using-password-strength" method="POST" action="{routePath('password-reset-change-perform')}">
    <input type="hidden" name="answer" id="answer" value="{$securityAnswer}" />

    <div id="newPassword1" class="form-group has-feedback">
        <label class="control-label" for="inputNewPassword1">{lang key='newpassword'}</label>
        <input type="password" name="newpw" id="inputNewPassword1" class="form-control" autocomplete="off" />
    </div>

    <div id="newPassword2" class="form-group has-feedback">
        <label class="control-label" for="inputNewPassword2">{lang key='confirmnewpassword'}</label>
        <input type="password" name="confirmpw" id="inputNewPassword2" class="form-control" autocomplete="off" />
        <div id="inputNewPassword2Msg"></div>
    </div>

    <div class="form-group">
        <label class="control-label">{lang key='pwstrength'}</label>
        {include file="$template/includes/pwstrength.tpl"}
    </div>

    <div class="form-group">
        <div class="text-center">
            <input class="btn btn-primary" type="submit" name="submit" value="{lang key='clientareasavechanges'}" />
            <input class="btn btn-default" type="reset" value="{lang key='cancel'}" />
        </div>
    </div>

</form>

<script>
function showValidationMessage(message) {
    var msgContainer = jQuery("#inputNewPassword2Msg");
    msgContainer.html('<p class="alert alert-danger">' + message + '</p>');
}

function validatePasswordSubmission() {
    var password1 = jQuery("#inputNewPassword1").val();
    var password2 = jQuery("#inputNewPassword2").val();
    var pwstrength = calculatePasswordStrength(password1);
    
    if (!password1 || !password2) {
        showValidationMessage("Both password fields are required");
        return false;
    }
    
    if (password1 !== password2) {
        showValidationMessage("Passwords do not match");
        return false;
    }
    
    if (pwstrength < pwStrengthErrorThreshold) {
        showValidationMessage("Password does not meet minimum strength requirements");
        return false;
    }
    
    return true;
}

jQuery(document).ready(function() {
    // Remove the initial disabled state
    jQuery('.using-password-strength input[type="submit"]').removeAttr('disabled');
    
    // Add form submission handler
    jQuery('.using-password-strength').submit(function(e) {
        var password1 = jQuery("#inputNewPassword1").val();
        var password2 = jQuery("#inputNewPassword2").val();
        var pwstrength = calculatePasswordStrength(password1);
        
        console.log('Form Submit Attempt:', {
            'Passwords Match': password1 === password2,
            'Password Strength': pwstrength
        });
        
        if (password1 !== password2 || pwstrength < pwStrengthErrorThreshold) {
            e.preventDefault();
            console.log('Form submission prevented due to validation');
        }
    });
});
</script>
