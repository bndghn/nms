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

    if(!isset($_SESSION['ADMIN_LOGIN'])){
        $CookieStatus = loginByCookie("1");
        if($CookieStatus!=""){
            header("location: ".$config['adminurl']."/logout.php?error=".$CookieStatus);
        }
    }
    /** for more security remove SHARPS #
     ********************************* */
  #  elseif(!adminIsValid()) {
  #     header("location: ".$config['adminurl']."/logout");
  #  }
    
        
}

function adminIsValid(){
    global $config,$conn;
    $adminID = intval($_SESSION['ADMIN_ID']);
    $sql = "SELECT `admin` FROM `users` WHERE id=".$adminID;
    $rs=$conn->execute($sql);
    if($rs->fields['admin'] === "0"){
        $_SESSION['ISADMIN'] = 0;
        $_SESSION['ADMIN_LOGIN'] = 0;
        return false;
    }elseif($rs->fields['status'] === "0"){
        $_SESSION['ADMIN_LOGIN'] = 0;
        $_SESSION['LOGIN'] = 0;
        return false;
    }else{
        return true;
    }
}

function create_remember(){
    
    $key = md5(sha1($_SESSION['USERNAME'] . get_last_ip()));
    global $conn;
    $username = $conn->qStr($_SESSION['USERNAME']);
    $sql="update `users` set remember_time='".date('Y-m-d H:i:s')."', remember_key='".$key."' WHERE username=".$username;
    $conn->execute($sql);
    echo $conn->errorMsg();
    setcookie('remember', gzcompress(serialize(array($_SESSION['USERNAME'], $key)), 9), time()+60*60*24*30);
}

function destroy_remember($username) {
    if (strlen($username) > 0) {
            global $conn;
            $conn->qStr($username);
            $sql="update `users` set `remember_time`=NULL,`remember_key`=NULL WHERE `username`='".$username."'";
            
            $conn->execute($sql);
           echo $conn->errorMsg();
    }
    setcookie ("remember", "", time() - 3600);
}

function loginByCookie($isAdmin="0"){
    global $config,$conn;
    $error="";
    if (!isset($_SESSION["USERNAME"]) && isset($_COOKIE['remember'])) 
    {
        $sql="update `users` set `remember_time`=NULL and `remember_key`=NULL WHERE `remember_time`<'".date('Y-m-d H:i:s', mktime(0, 0, 0, date("m")-1, date("d"),   date("Y")))."'";
        $conn->execute($sql); 
        //echo $conn->errorMsg();
        list($username, $key) = @unserialize(gzuncompress(stripslashes($_COOKIE['remember'])));
        if (strlen($username) > 0 && strlen($key) > 0)
        {
            $conn->qStr($username);
            $conn->qStr($key);
            
            $sql="SELECT * FROM `users` WHERE `username`= '".$username."' and `remember_key`='".$key."'";
            
            $rs=$conn->execute($sql);
            //echo $conn->errorMsg();
            if($rs->recordCount()<1)
            {
                $error = '26';
            }
            elseif($rs->fields['status'] === "0")
            {
                $error = '57';
            }
            if($isAdmin==="1"){
                if($rs->fields['admin'] === "0"){
                    $error = '25';
                    $_SESSION['ISADMIN'] = "0";
                }
            }
            if($error=="")
            {				
                
                if($isAdmin==="1"){
                    $_SESSION['ADMIN_ID']       = $rs->fields['id'];
                    $_SESSION['ADMIN_USER']     = $rs->fields['username'];
                    $_SESSION['USERNAME']       = $rs->fields['username'];
                    $_SESSION['ADMIN_PASS']     = $rs->fields['pass'];
                    $_SESSION['ADMIN_GENDER']   = $rs->fields['gender'];
                    $_SESSION['ADMIN_FNAME']    = $rs->fields['fname'];
                    $_SESSION['ADMIN_LNAME']    = $rs->fields['lname'];
                    $_SESSION['ADMIN_EMAIL']    = $rs->fields['email'];
                    $_SESSION['ADMIN_MOBILE']   = $rs->fields['mobile'];
                    $_SESSION['ISADMIN']        = "1"; //check is Admin or NOT
                    $_SESSION['ADMIN_LOGIN']    = "1"; //nessary for checking in admin page
                    $_SESSION['LOGIN']          = "1"; //nessary for checking in front page
                }else{
                    $_SESSION['ID']         = $rs->fields['id'];
                    $_SESSION['PASS']       = $rs->fields['pass'];
                    $_SESSION['USER_NAME']  = $rs->fields['username'];
                    $_SESSION['VERIFIED']   = $rs->fields['verified'];
                    $_SESSION['FNAME']      = $rs->fields['fname'];
                    $_SESSION['LNAME']      = $rs->fields['lname'];
                    $_SESSION['EMAIL']      = $rs->fields['email'];
                    $_SESSION['MOBILE']     = $rs->fields['mobile'];
                    $_SESSION['LOGIN']      = "1";
                }
                    
                
                create_remember();
            }
            else
            {
                destroy_remember($username);
                return $error;
            }
        }
    }else{
        $error = '29';
        return $error;
    }

}

function insert_get_users_count($var){
    global $conn;
    if(!isset($var['user_group']) ){
        $add_sql    = " ";
    }elseif($var['user_group']=="0"){
        //$ugroup = intval($var['user_group']);
        $add_sql    = " NOT users.user_group = 1 ";
    }else{
        $ugroup = intval($var['user_group']);
        $add_sql    = "  users.user_group = $ugroup ";
    }
    if(!isset($var['verified'])){
        $add_sql    .= "";
    }else{
        $verify = intVal($var['verified']);
        $add_sql    .= " AND users.verified = $verify ";
    }
    
    if(!isset($var['customer']) ){
        $add_sql    .= "AND user_group.isCustomer=0";
    }else{
        $add_sql    .= "AND user_group.isCustomer=1";
    }
    
     $query ="SELECT count(*) as total  FROM `users`,`user_group` WHERE user_group.id= users.user_group ".$add_sql;
    //echo $query;
    $result = $conn->execute($query);
    $total = $result->fields['total'];
    return $total;
    
    
}


function insert_get_user_list($var){
    global $conn,$config;
    if(!isset($var['user_group']) ){
        $add_sql    = " ";
    }elseif($var['user_group']=="0"){
        //$ugroup = intval($var['user_group']);
        $add_sql    = " AND NOT users.user_group = 1 ";
    }else{
        $ugroup = intval($var['user_group']);
        $add_sql    = " AND users.user_group = $ugroup ";
    }
    if(!isset($var['verified'])){
        $add_sql    .= "";
    }elseif($var['verified']=="0"){
        $add_sql    = " AND users.verified = 0 ";
    }else{
        $add_sql    = " AND users.verified = 1 ";
    }
    
    if(!isset($var['customer']) ){
        $add_sql    .= "AND user_group.isCustomer=0";
    }else{
        $add_sql    .= "AND user_group.isCustomer=1";
    }
    
    if(!isset($var['start'])){
        $limit = intval($config['limit_users']);
        $add_sql    .= " LIMIT 0,". $limit;
    }else{
        $limit  = intval($config['limit_users']);
        $start  = intval($var['limit_start']);
        $add_sql    .= " LIMIT ".$start.",". $limit;
    }
    
    
    $query ="SELECT users.*, user_group.* FROM `users`,`user_group` WHERE user_group.id= users.user_group ".$add_sql;
    
    //echo $query;
    $result = $conn->execute($query);
    if(!$users = $result->getArray()){
        echo $conn->errorMsg();
        return false;
    }else{
        return $users;
    }
    
    
    
}

function insert_get_user_group_list($gvar){
    global $conn;
    if(!isset($gvar['isCustomer']) ){
        $add_sql    = "";
    }elseif($gvar['isCustomer'] === "0"){
        $add_sql    = "WHERE `isCustomer` = 0 ";
    }else{
        $add_sql    = "WHERE `isCustomer` = 1 ";
    }
    
    $query = "SELECT * FROM `user_group` ".$add_sql;
    $result = $conn->execute($query);
    $userGroups = $result->getAll();
    
    return $userGroups;
}

function generatePass($characters) {
    $possible = '123456789@_#abcdefgikmlnoz';
    $code = '';
    $i = 0;
    while ($i < $characters) {
        $code .= substr($possible, mt_rand(0, strlen($possible)-1), 1);
        $i++;
    }
    return $code;
}


//for check email mobile and codeMelli foramt
function verifyContact($type,$value){
    if($type === "email"){
        
        if(!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i", $value))
        {return false;}else{return true;}
        
    }elseif($type === "mobile"){
        
        if ( ! preg_match("/^09(0[1-9]|1[0-9]|2[1-9]|3[1-9]|9[0-9])-?[0-9]{3}-?[0-9]{4}$/",$value))
        {return false;}else{return true;}  
    }elseif($type === "codemeli"){
        
        if (strlen($value) == 10){
            if($value=='1111111111' || $value=='0000000000' || $value=='2222222222' || $value=='3333333333' || $value=='4444444444' ||              $value=='5555555555' || $value=='6666666666' || $value=='7777777777' || $value=='8888888888' || $value=='9999999999' ){
                return false;
            }
        $c = intval(substr($value,9,1));
        $n = intval(substr($value,0,1))*10 +
        intval(substr($value,1,1))*9 + intval(substr($value,2,1))*8 +  intval(substr($value,3,1))*7 + intval(substr($value,4,1))*6 + intval(substr($value,5,1))*5 + intval(substr($value,6,1))*4 + intval(substr($value,7,1))*3 + intval(substr($value,8,1))*2;
        $r = $n - intval ($n/11)*11;
            if (($r == 0 && $r == $c) || ($r == 1 && $c == 1) || ($r > 1 && $c == 11 - $r)){
                return true;
            }else{
                return false;
            }
        }else{
            return false;
        }
        
        
    }// end check codeMelli
    else{
        //when dont send any type
        return false;
    }
}

function verify_user_unique($field,$value)
{
    global $config,$conn;
    $cValue = $conn->qStr($value);
	$query = "select count(*) as total from `users` WHERE  `$field` = $cValue  limit 1";
	$executequery = $conn->execute($query);
	$totalemails = $executequery->fields[total];
	if ($totalemails >= 1)
	{
		return false;
	}
	else
	{
		return true;
	}
}


