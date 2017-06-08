<div class="padding-15">

    <div class="login-box">
        
        {if $error ne ""}
        <div class="alert alert-danger margin-bottom-30">
            <b>{$lang27}</b> {$error}
        </div>
        {/if}                   
        
        <!-- login form -->
        <form action="{$adminurl}/index.php" method="post" class="sky-form boxed">
            <header><i class="fa fa-users"></i> {$lang0} </header>

            <!--
            <div class="alert alert-danger noborder text-center weight-400 nomargin noradius">
                Invalid Email or Password!
            </div>

            <div class="alert alert-warning noborder text-center weight-400 nomargin noradius">
                Account Inactive!
            </div>

            <div class="alert alert-default noborder text-center weight-400 nomargin noradius">
                <strong>Too many failures!</strong> <br />
                Please wait: <span class="inlineCountdown" data-seconds="180"></span>
            </div>
            -->

            <fieldset>	

                <section>
                    <label class="label">{$lang1}</label>
                    <label class="input">
                        <i class="icon-append fa fa-envelope"></i>
                        <input type="text" name="username" id="username">
                        <span class="tooltip tooltip-top-right">{$lang1} {$lang22}</span>
                    </label>
                </section>

                <section>
                    <label class="label">{$lang2}</label>
                    <label class="input">
                        <i class="icon-append fa fa-lock"></i>
                        <input type="password" name="password" id="password">
                        <b class="tooltip tooltip-top-right">{$lang2} {$lang22}</b>
                    </label>
                    <label class="checkbox"><input type="checkbox" name="checkbox-inline" checked><i></i>{$lang3}</label>
                </section>

            </fieldset>

            <footer>
                <input type="hidden" name="login" value="1" />
                <button type="submit" class="btn btn-primary pull-right">{$lang5}</button>
                <div class="forgot-password pull-left">
                    <a href="page-password.html">{$lang4}</a> <br />
                   
                </div>
            </footer>
        </form>
        <!-- /login form -->

        <hr />

        


        

    </div>

</div>