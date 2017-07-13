<?php

include ('core/config.php');
verify_login();

$error = "";
$message = "";

(isset($_SESSION['USR_ID']) ? $usrID = intval($_SESSION['USR_ID']) : $usrID = "");

(isset($_POST['step1']) ? $step1 = intval($_POST['step1']) : $step1 = 0);
(isset($_POST['step2']) ? $step2 = intval($_POST['step2']) : $step2 = 0);
(isset($_POST['step3']) ? $step3 = intval($_POST['step3']) : $step3 = 0);
(isset($_GET['action']) ? $action = trim($_GET['action']) : $action = "");

if($step1 === 1 ){
	(isset($_POST['fname']) ? $fname = trim($_POST['fname']) : $fname = "");
	(isset($_POST['lname']) ? $lname = trim($_POST['lname']) : $lname = "");
	(isset($_POST['email']) ? $email = trim($_POST['email']) : $email = "");
	(isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
	(isset($_POST['born_date']) ? $born_date = trim($_POST['born_date']) : $born_date = "");
	(isset($_POST['state_id']) ? $state = intval($_POST['state_id']) : $state = 0);
	(isset($_POST['city_id']) ? $city = intval($_POST['city_id']) : $city = 0);
	$gender = intval($_POST['gender']);
	
	if($fname ===""){
		$error = "نام خود را وارد نکردید!";
	}elseif(mb_strlen($fname,'UTF-8')<3){
		$error = "واقعا اسمتون کمتر از ۳ حرفه؟!";
		
	}elseif($lname === ""){
		$error = "نام خانوادگی فراموش کردی!";
		
	}elseif(mb_strlen($lname, 'UTF-8')<3){
		$error = "واقعا فامیلتون کمتر از ۳ حرفه؟!";
		
	}elseif($email != "" and !verifyUserData("email",$email)){
			$error = "ایمیل اشتباه وارد شده است.";
		
	}elseif($mobile === ""){
		$error = "موبایل فراموش کردی!";
	}elseif(!verifyUserData("mobile",$mobile)){
		$error = "شماره تلفن همراه‌ت اشتباه وارد کردی!";
	}
	if($born_date != ""){
		$bDate = digit_converter($born_date, "en");
		$bDate = explode('/', $bDate);
		$bDate=j\jmktime(12,01,01,$bDate[1],$bDate[2],$bDate[0]);
		
	}else{
		$bDate="";
	}
	
	if($error === ""){
		$qFname		= $conn->qStr($fname);
		$qLname		= $conn->qStr($lname);
		$qEmail		= $conn->qStr($email);
		$qMobile	= $conn->qStr($mobile);
		$qBDate		= $conn->qStr($bDate);
		$query = "UPDATE `users` SET";
		$query .= "`fname`=$qFname,`lname`=$qLname, `email`=$qEmail, `mobile`=$qMobile, ";
		$query .= "`born_date`=$qBDate, `state_id`=$state, `city_id`=$city, `verify_step`=1 ";
		$query .= "WHERE `userid` = $usrID";
		if($conn->EXECUTE($query)){
			$message = "اطلاعات شخصی‌ت با موفقیت وارد کردی، حالا نوبت اینه که بهمون بگی به چه چیزهایی علاقه‌مندی؟";
		}else{
			$error = $conn->errorMsg();
		}
		
		
		
	}else{
		STemplate::assign('fname',$fname);
		STemplate::assign('lname',$lname);
		STemplate::assign('email',$email);
		STemplate::assign('gender',$gender);
		STemplate::assign('mobile',$mobile);
		STemplate::assign('usrState',$state);
		STemplate::assign('usrState2',$state);
		STemplate::assign('usrCity',$city);
		STemplate::assign('brnDate',$born_date);
		
	}
	
	
}

if($step2 === 1){
	
	(isset($_POST['fav']) ? $fav_cat = $_POST['fav'] : $fav_cat = "");
	if($fav_cat!=""){
		$fav_db = implode(',',$fav_cat);
	}else{
		$fav_db = null;
	}
	$fav_db = $conn->qStr($fav_db);

	$queryy = "UPDATE `users` SET `fav_cats`=$fav_db, `verify_step`=2 WHERE `userid` = $usrID";
	
	if($conn->EXECUTE($queryy)){
		$message = "علاقه‌مندی‌هات رو هم اضافه کردی! الان وقتشه مناسبت‌های مهم زندگیت رو اینجا ثبت کنی.";
	}else{
		$error = $conn->errorMsg();
	}
}


if($step3 === 1){
	
	$type = intval($_POST['type']);
	$edit = intval($_POST['edit']);
	$eid = intval($_POST['eid']);
	(isset($_POST['date']) ? $evnt_date = $_POST['date'] : $evnt_date = "");
	(isset($_POST['title']) ? $evnt_title = $_POST['title'] : $evnt_title = "");
	
	if($evnt_date === ""){
		$error = "تاریخ چرا وارد نکردی؟!";
	}elseif($evnt_title === ""){
		$error = "موضوع مناسبت رو نمی خوای بهش اشاره کنی؟!";
	}
	
	if($error === ""){
		
		//process date
		$bDate = digit_converter($evnt_date, "en");
		$bDate = explode('/', $bDate);
		$bDate=j\jmktime(12,01,01,$bDate[1],$bDate[2],$bDate[0]);
		$qBDate		= $conn->qStr($bDate);
		// process title
		$qTitle		= $conn->qStr($evnt_title);
		
		if($edit === 0){	//insert new event
			
			$query		= "INSERT INTO `event`(`event_title`, `event_date`, `event_uid`,`event_type`) VALUES  ";
			$query		.="($qTitle,$qBDate,$usrID,$type)";
			
		}
		if($edit ===1){
			$query		= "UPDATE `event` SET `event_title`=$qTitle, `event_date`=$qBDate, `event_uid`=$usrID,`event_type`=$type ";
			$query		.="WHERE `event_id`=$eid";
		}
		if($conn->EXECUTE($query)){
			$message = "این مناسبت اضافه شد. میتونی مناسبت های دیگه رو هم اضافه کنی.";
			$conn->EXECUTE($queryVerify);
		}else{
			$error = $conn->errorMsg();
		}
	}
	
}


echo $action;
if($action ==="delete"){
	(isset($_GET['eid']) ? $evnt_id = intval($_GET['eid']) : $evnt_id = 0);
	if($evnt_id != 0){
		$query = "DELETE FROM `event` WHERE `event_id`=$evnt_id";
		if($conn->EXECUTE($query)){
			$message = "مناسبت با موفقیت حذف کردی.";
		} 
		else{
			$error =  $conn->errorMsg(); 
		}
	}
}

if($action ==="verify"){
	$query	= "UPDATE `users` SET `verified` = 1 WHERE `userid`=$usrID";
	if($conn->EXECUTE($query)){
		header('location: '.$config["baseurl"].'/index.php');
	}else{
		$error =  $conn->errorMsg(); 
	}
}


STemplate::assign('message',$message);
STemplate::assign('error',$error);

STemplate::assign('favs_array',get_fav_cats($usrID));
STemplate::assign('uid',$usrID);

STemplate::display('profile.tpl');



