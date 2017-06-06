<?php

include('../core/config.php');
// define var
$error      =   "";
$message    =   "";

// Define Varibel From Sessions
(isset($_SESSION['ADMINID']) ? $adminID = $_SESSION['ADMINID'] : $adminID = "");
(isset($_SESSION['ADMINUSERNAME']) ? $adminUN = $_SESSION['ADMINUSERNAME'] : $adminUN = "");
(isset($_SESSION['ADMINPASSWORD']) ? $adminPSS = $_SESSION['ADMINPASSWORD'] : $adminPSS = "");




//check login or not. if login redirect to admin.php
if ($adminID != "" && $adminUN != "" && $adminPSS != "")
{
	$redirect = $config['adminurl']."/dashboard.php";
    header("location: $redirect");
}
else
{
    // file $submit with useful value
    (isset($_POST['submit']) ? $sumbit = $_POST['submit'] : $sumbit = "");
    
    // check login form
    if( $sumbit != ""){
        // code for checking data of login form
        
    }
    
    //load nessary template for loading
    STemplate::assign('message',$message);
    STemplate::assign('error',$error);
    
    STemplate::display('administrator/header.tpl');
    STemplate::display('administrator/index.tpl');
    STemplate::display('administrator/footer.tpl');
}