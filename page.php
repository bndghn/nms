<?php

include ('core/config.php');
if($config['public'] === "0"){
   verify_login();
}

(isset($_SESSION['USR_ID']) ? $usrID = $_SESSION['USR_ID'] : $usrID = "");
(isset($_SESSION['USR_GENDER']) ? $usrGndr = $_SESSION['USR_GENDER'] : $usrGndr = "");
(isset($_SESSION['USR_FNAME']) ? $usrFname = $_SESSION['USR_FNAME'] : $usrFname = "");
(isset($_SESSION['USR_LNAME']) ? $usrLname = $_SESSION['USR_LNAME'] : $usrLname = "");

(isset($_GET['slug']) ? $slug = $_GET['slug'] : $slug = "");
if($slug === ""){
	header("location: ".$config['baseurl']);
}





STemplate::assign('slug',$slug);
STemplate::display('page.tpl');
?>
