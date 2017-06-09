<?php

function strip_mq_gpc($arg)
{
  	$arg = str_replace('"',"'",$arg);
  	$arg = stripslashes($arg);
    return $arg;
}
function cleanit($text)
{
	return htmlentities(strip_tags(stripslashes($text)), ENT_COMPAT, "UTF-8");
}

function get_last_ip(){
    $lstip = get_client_ip();
    if ($lstip!="::1"){
        return trim($lstip);
    }else{
        $lstip = getLocalIP();
        return trim($lstip);
    }
}

// Function to get the client IP address
function get_client_ip() {
    $ipaddress = '';
    if (isset($_SERVER['HTTP_CLIENT_IP']))
        $ipaddress = $_SERVER['HTTP_CLIENT_IP'];
    else if(isset($_SERVER['HTTP_X_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_X_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_X_FORWARDED'];
    else if(isset($_SERVER['HTTP_FORWARDED_FOR']))
        $ipaddress = $_SERVER['HTTP_FORWARDED_FOR'];
    else if(isset($_SERVER['HTTP_FORWARDED']))
        $ipaddress = $_SERVER['HTTP_FORWARDED'];
    else if(isset($_SERVER['REMOTE_ADDR']))
        $ipaddress = $_SERVER['REMOTE_ADDR'];
    else
        $ipaddress = 'UNKNOWN';
    return $ipaddress;
}

function getLocalIP(){
    exec("ipconfig /all", $output);
        foreach($output as $line){
            if (preg_match("/(.*)IPv4 Address(.*)/", $line)){
                $ip = $line;
                $ip = str_replace("IPv4 Address. . . . . . . . . . . :","",$ip);
                $ip = str_replace("(Preferred)","",$ip);
            }
        }
    return $ip;
}

function verify_login_admin()
{
        global $config,$conn;
        if($_SESSION['ADMIN_ID'] != "" && is_numeric($_SESSION['ADMIN_ID']) && $_SESSION['ADMIN_USER'] != "" && $_SESSION['ADMIN_PASS'] != "")
        {
            $qUsername = $conn->qStr($_SESSION['ADMIN_USER']);
            $qPass = $conn->qStr($_SESSION['ADMIN_PASS']);
            $qID = intval($_SESSION['ADMIN_ID']);
             
            
            
			$query="SELECT * FROM `users` WHERE `username`=$qUsername AND `pass`=$qPass AND `id`=".$qID;
        	$executequery=$conn->execute($query);
            $isAdmin    =  intval($executequery->fields['admin']);
            
			if($conn->affected_rows()!==1)
			{ 
                header("location:$config[adminurl]/logout.php?error=26");
            	exit;
			}
            
            if($isAdmin === 0){
                header("location:$config[adminurl]/logout.php?error=25");
            	exit;
            }

        }
		else
		{
			
            header("location:$config[adminurl]/logout.php?error=29");
            exit;
		}
}

function insert_get_user_list($var){
    global $conn,$config;
    if(!isset($var['user_group']) ){
        $add_sql    = "`user_group` = 0 ";
    }else{
        $ugroup = intval($var['user_group']);
        $add_sql    = "`user_group` = $ugroup ";
    }
    if(!isset($var['start'])){
        $limit = intval($config['limit_users']);
        $add_sql    .= " LIMIT 0,". $limit;
    }else{
        $limit  = intval($config['limit_users']);
        $start  = intval($var['limit_start']);
        $add_sql    .= " LIMIT ".$start.",". $limit;
    }
    $query  = "SELECT * FROM `users` WHERE ".$add_sql;
    //echo $query;
    $result = $conn->execute($query);
    $users = $result->getAll();
    
    return $users;
    
}