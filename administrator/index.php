<?php

include('../core/config.php');
// define var
$error      =   "";
$message    =   "";
if(isset($_SESSION['ADMINID'])){
    $adminID = $_SESSION['ADMINID'];
}else {
    $adminID = "";
}

if(isset($_SESSION['ADMINUSERNAME'])){
    $adminUN = $_SESSION['ADMINUSERNAME'];
}else {
    $adminUN = "";
}

if(isset($_SESSION['ADMINPASSWORD'])){
    $adminPSS = $_SESSION['ADMINPASSWORD'];
}else {
    $adminPSS = "";
}

//check login or not. if login redirect to admin.php
if ($adminID != "" && $adminUN != "" && $adminPSS != "")
{
	$redirect = $config['adminurl']."/admin.php";
    header("location: $redirect");
}
else
{
    if(isset($_POST['submit'])){
        $submit = $_POST['submit'];
    }else{
        $submit = "";
    }
    // check login form
    if( $sumbit = "1"){
        // code for checking data of login form
        
    }
    
    //load nessary template for loading
    STemplate::assign('message',$message);
    STemplate::assign('error',$error);
    STemplate::display('administrator/index.tpl');
}