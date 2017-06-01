<?php

$config = array();

// Begin Configuration
$config['basedir']     =  'C:\xampp\htdocs\nmc';
$config['baseurl']     =  'http://localhost/nmc';



// Begin include library
require_once($config['basedir'].'/library/smarty/Smarty.class.php');
require_once($config['basedir'].'/core/template.class.php');

?>