<?php

include('../core/config.php');

verify_login_admin();

// define var
$error      =   "";
$message    =   "";




//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu
STemplate::assign('section',"users_manager");
STemplate::assign('page',"users");


STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */