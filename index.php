<?php

include ('core/config.php');
if($config['public'] === "0"){
   verify_login();
}

(isset($_SESSION['USR_ID']) ? $usrID = $_SESSION['USR_ID'] : $usrID = "");
(isset($_SESSION['USR_USER']) ? $usrUN = $_SESSION['USR_USER'] : $usrUN = "");
(isset($_SESSION['USR_PASS']) ? $usrPSS = $_SESSION['USR_PASS'] : $usrPSS = "");

STemplate::assign('test',"test");
STemplate::display('index.tpl');
?>
