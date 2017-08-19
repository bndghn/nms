<?php

include ('core/config.php');
if($config['public'] === "0"){
   verify_login();
}

(isset($_SESSION['USR_ID']) ? $usrID = $_SESSION['USR_ID'] : $usrID = "");


(isset($_GET['cid']) ? $pid = $_GET['cid'] : $pid = "");
if($pid === ""){
	//header("location: ".$config['baseurl']);
	echo "not fount pid in php file";
}





STemplate::assign('pid',$pid);
STemplate::display('product.tpl');
?>
