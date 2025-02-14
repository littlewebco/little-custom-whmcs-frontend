<div class="providerLinkingFeedback"></div>

<form method="post" action="{routePath('login-validate')}" class="login-form" role="form">
    <div class="card mb-4">
        <div class="card-body extra-padding px-sm-5 py-5">
            <div class="mb-4">
                <h6 class="h3">{lang key='loginbutton'}</h6>
                <p class="text-muted mb-0">{lang key='userLogin.signInToContinue'}</p>
            </div>
            
            {include file="$template/includes/flashmessage.tpl"}

            {include file="$template/includes/linkedaccounts.tpl" linkContext="login" customFeedback=true}

            <div class="divider my-4">
                <span class="divider-text text-muted">or continue with email</span>
            </div>

            <div class="form-group">
                <label for="inputEmail" class="form-control-label">{lang key='clientareaemail'}</label>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-user"></i></span>
                    </div>
                    <input type="email" class="form-control" name="username" id="inputEmail" placeholder="name@example.com" autofocus>
                </div>
            </div>

            <div class="form-group mb-4">
                <div class="d-flex align-items-center justify-content-between">
                    <label for="inputPassword" class="form-control-label">{lang key='clientareapassword'}</label>
                    <div class="mb-2">
                        <a href="{routePath('password-reset-begin')}" class="small text-muted" tabindex="-1">{lang key='forgotpw'}</a>
                    </div>
                </div>
                <div class="input-group">
                    <div class="input-group-prepend">
                        <span class="input-group-text"><i class="fas fa-key"></i></span>
                    </div>
                    <input type="password" class="form-control" name="password" id="inputPassword" placeholder="{lang key='clientareapassword'}" autocomplete="off">
                    <div class="input-group-append">
                        <button class="btn btn-default btn-reveal-pw" type="button" tabindex="-1">
                            <i class="fas fa-eye"></i>
                        </button>
                    </div>
                </div>
            </div>

            {if $captcha->isEnabled()}
                <div class="text-center margin-bottom">
                    {include file="$template/includes/captcha.tpl"}
                </div>
            {/if}

            <div class="form-group">
                <div class="d-flex align-items-center justify-content-between">
                    <button id="login" type="submit" class="btn btn-primary{$captcha->getButtonClass($captchaForm)}">
                        {lang key='loginbutton'}
                    </button>    
                </div>
                <div class="w-100 mb-2"><label class="mb-0">
                        <input type="checkbox" class="form-check-input" name="rememberme" />
                        {lang key='loginrememberme'}
                        </label>
                </div>
            </div>
        </div>
        <div class="card-footer px-md-5 py-4 border-0">
            <div class="text-center">
                <small>{lang key='userLogin.notRegistered'}</small>
                <a href="{$WEB_ROOT}/register.php" class="small font-weight-bold ml-2">{lang key='userLogin.createAccount'}</a>
            </div>
        </div>
    </div>
</form>
