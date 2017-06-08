<?php

include('../core/config.php');

verify_login_admin();

// define var
$error      =   "";
$message    =   "";

$query  = "SELECT * FROM `users`";
$result = $conn->Execute($query);
$users  = $result->getrows();



//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

// send var to theme
STemplate::assign('users',$users);

STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */