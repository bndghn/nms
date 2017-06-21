<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";

//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu
STemplate::assign('section',"dashboard");
STemplate::assign('page',"");
    
STemplate::display('administrator/header.tpl');
STemplate::display('administrator/dashboard.tpl');
STemplate::display('administrator/footer.tpl');
