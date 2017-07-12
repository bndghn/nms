<?php

include ('core/config.php');
verify_login();

(isset($_SESSION['USR_ID']) ? $usrID = intval($_SESSION['USR_ID']) : $usrID = "");

$error = "";
$message = "";

STemplate::assign('message',$message);
STemplate::assign('error',$error);

STemplate::assign('favs_array',get_fav_cats($usrID));
STemplate::assign('uid',$usrID);

STemplate::display('profile.tpl');



