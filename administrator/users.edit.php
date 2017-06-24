<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['id']) ? $userID = $_GET['id'] : $userID = "");

if($userID !=""){
    STemplate::assign('userID',$userID);
    STemplate::display('administrator/users.edit.tpl');
}

//after form submit by user
(isset($_POST['isSubmit']) ? $isSubmit = $_POST['isSubmit'] : $isSubmit = "");
if ($isSubmit === "1"){
    //do something
}

                      