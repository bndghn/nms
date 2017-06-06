<div class="padding-15">

    <div class="login-box">

        <!-- login form -->
        <form action="{$adminurl}/dashboard.php" method="post" class="sky-form boxed">
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
                        <input type="username">
                        <span class="tooltip tooltip-top-right">Email Address</span>
                    </label>
                </section>

                <section>
                    <label class="label">{$lang2}</label>
                    <label class="input">
                        <i class="icon-append fa fa-lock"></i>
                        <input type="password">
                        <b class="tooltip tooltip-top-right">Type your Password</b>
                    </label>
                    <label class="checkbox"><input type="checkbox" name="checkbox-inline" checked><i></i>{$lang3}</label>
                </section>

            </fieldset>

            <footer>
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