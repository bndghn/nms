<?php

include ('core/config.php');
if($config['public'] === "0"){
   verify_login();
}

(isset($_SESSION['USR_ID']) ? $usrID = $_SESSION['USR_ID'] : $usrID = "");


(isset($_GET['catid']) ? $catid = $_GET['catid'] : $catid = "");
if($catid === ""){
	header("location: ".$config['baseurl']);
	
}





STemplate::assign('catid',$catid);
STemplate::display('cat.tpl');
?>
