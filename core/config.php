<?php

$config = array();

// Begin Configuration
$config['basedir']     =  'C:\xampp\htdocs\nms';
$config['baseurl']     =  'http://localhost/nms';

// Start Sessions
if (session_status() == PHP_SESSION_NONE) {
    session_start();
}

// Begin include library
require_once($config['basedir'].'/libraries/smarty/Smarty.class.php');
require_once($config['basedir'].'/core/template.class.php');
require_once($config['basedir'].'/libraries/adodb/adodb.inc.php');
require_once($config['basedir'].'/libraries/phpmailer/class.phpmailer.php');
require_once($config['basedir'].'/core/email.class.php');

// Start Define Varibles
$dbType = 'mysqli';
$dbHost = 'localhost';
$dbUser = 'root';
$dbPass = '';
$dbName = 'nms';
$default_language = "persian"; // Arabic, Turkish & English Comming soon
date_default_timezone_set('Asia/Tehran');
$config['adminurl']      =  $config['baseurl'].'/administrator';
$config['cssurl']      =  $config['baseurl'].'assets/css';
$config['imagedir']      =  $config['basedir'].'/images';
$config['imageurl']      =  $config['baseurl'].'/images';

//connect to db
$conn = &ADONewConnection($dbType);
$conn->PConnect($dbHost, $dbUser, $dbPass, $dbName);
$conn->EXECUTE("set names 'utf8'");

// select new language by user
if(isset($_REQUEST['language'])){
	if ($_REQUEST['language'] != "")
	{
		if ($_REQUEST['lang'] === "fa")
		{
			$_SESSION['language'] = "persian";
		}
		/*elseif ($_REQUEST['lang'] === "en")
		{
			$_SESSION['language'] = "english";
		}
		elseif ($_REQUEST['lang'] === "ar")
		{
			$_SESSION['language'] = "arabic";
		}
		elseif ($_REQUEST['lang'] === "tr")
		{
			$_SESSION['language'] = "turkish";
		}*/ // Multi Language  comming soon!
	}
}

// fill Language session
if ($_SESSION['language'] == "")
{
	$_SESSION['language'] = $default_language;
}

//load Language File
if ($_SESSION['language'] === "persian")
{
	include("lang/persian.php");
	STemplate::assign('rtl', "1");
	
}
elseif ($_SESSION['language'] === "arabic")
{
	include("lang/arabic.php");
	STemplate::assign('rtl', "1");
}
elseif ($_SESSION['language'] === "english"){
	include("lang/english.php");
	STemplate::assign('rtl', "0");
}
else
{
	include("lang/".$default_language.".php");
	STemplate::assign('rtl', "0");
}

//create smarty varibe from language file
for ($i=0; $i<count($lang); $i++)
{
	STemplate::assign('lang'.$i, $lang[$i]);
}

//create static smarty varible
STemplate::assign('baseurl',       $config['baseurl']);
STemplate::assign('basedir',       $config['basedir']);
STemplate::assign('adminurl',       $config['adminurl']);
STemplate::assign('cssurl',       $config['cssurl']);
STemplate::assign('imagedir',        $config['imagedir']);
STemplate::assign('imageurl',        $config['imageurl']);

//config smarty
STemplate::setCompileDir($config['basedir']."/temporary");
STemplate::setTplDir($config['basedir']."/themes");
?>