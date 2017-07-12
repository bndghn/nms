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

function verify_login(){
    global $config,$conn;
    if(!isset($_SESSION['LOGIN'])){
       /* $CookieStatus = loginByCookie("1");
        if($CookieStatus!=""){
            header("location: ".$config['basedir']."/logout.php?error=".$CookieStatus);
        }
        */
        header("location: ".$config['baseurl']."/login.php");
       // echo "you must login";
    }
}

function adminIsValid(){
    global $config,$conn;
    $adminID = intval($_SESSION['ADMIN_ID']);
    $sql = "SELECT `admin` FROM `users` WHERE userid=".$adminID;
    $rs=$conn->execute($sql);
    if($rs->fields['admin'] === "0"){
        $_SESSION['ISADMIN'] = 0;
        $_SESSION['ADMIN_LOGIN'] = 0;
        return false;
    }elseif($rs->fields['userstatus'] === "0"){
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
            elseif($rs->fields['user_status'] === "0")
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
                    $_SESSION['ADMIN_ID']       = $rs->fields['userid'];
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
                    $_SESSION['ID']         = $rs->fields['userid'];
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
/**********************************************/
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
    if(!isset($var['user_status'])){
      $add_sql  .= " AND users.user_status !=2";
    }elseif($var['user_status']=="2"){
      $add_sql  .= " AND users.user_status =2";
    }
      
    
     $query ="SELECT count(*) as total  FROM `users`,`user_group` WHERE  user_group.id= users.user_group ".$add_sql;
    //echo $query;
    $result = $conn->execute($query);
    $total = $result->fields['total'];
    return $total;
    
    
}
/**********************************************/
function insert_get_user($var){
    global $conn,$config;
    $uID = intval($var['userid']);
    $query = "SELECT users.*, user_group.* FROM `users`,`user_group` WHERE user_group.id= users.user_group AND users.userid=$uID";
    $result = $conn->execute($query);
    if(!$user = $result->getArray()){
        echo $conn->errorMsg();
        return false;
    }else{
        return $user['0'];
    }
}
/**********************************************/
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
        $add_sql    .= " AND users.verified = 0 ";
    }else{
        $add_sql    .= " AND users.verified = 1 ";
    }
    
    if(!isset($var['status'])){
        $add_sql    .= " AND users.user_status != '2'";
    }else{
        $uStatus = intval($var['status']);
        $add_sql    .= " AND users.user_status = '$uStatus' ";
    }
    
    if(!isset($var['customer']) ){
        $add_sql    .= "";
    }else{
        $isCustomer = intval($var['customer']);
        $add_sql    .= "AND user_group.isCustomer=$isCustomer";
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
/**********************************************/
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
/**********************************************/
function generatePass($characters, $type="mixed") {
    if($type === "mixed"){
        $possible = '123456789@_#abcdefghijklmnopqrstuvwxyz';
    }elseif($type === "number"){
        $possible = '123456789';
    }elseif($type === "numchar"){
        $possible = '123456789abcdefghijklmnopqrstuvwxyz';
    }elseif($type === "char"){
        $possible = 'abcdefghijklmnopqrstuvwxyz';
    }
    
    $code = '';
    $i = 0;
    while ($i < (int)$characters) {
        $code .= substr($possible, mt_rand(0, strlen($possible)-1), 1);
        $i++;
    }
    return $code;
}

/**********************************************/
//for check email mobile username and codeMelli foramt
function verifyUserData($type,$value){
    if($type === "email"){
        
        if(!preg_match("/^[_\.0-9a-zA-Z-]+@([0-9a-zA-Z][0-9a-zA-Z-]+\.)+[a-zA-Z]{2,6}$/i", $value)){return false;}else{return true;}
        
    }elseif($type === "mobile"){
        
        if ( ! preg_match("/^09(0[1-9]|1[0-9]|2[1-9]|3[1-9]|9[0-9])-?[0-9]{3}-?[0-9]{4}$/",$value)){return false;}else{return true;} 
        
    }elseif($type === "username"){
        
        if(!preg_match("/^[a-zA-Z0-9]*$/i",$value)){ return false; } else {return true;}
           
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
/**********************************************/
function verify_user_unique($field,$value)
{
    global $config,$conn;
    $cValue = $conn->qStr($value);
	$query = "SELECT count(*) as `total` FROM `users` WHERE  `$field` = $cValue  limit 1";
	$executequery = $conn->execute($query);
    //echo $conn->errorMsg();
	$total = $executequery->fields['total'];
	if ($total >= 1)
	{
		return false;
	}
	else
	{
		return true;
	}
}
/**********************************************/
function isUserChange($uid, $field, $value){
    global $config,$conn;
    $cValue = $conn->qStr($value);
    $query = "SELECT count(*) as `total` FROM `users` WHERE `userid`=$uid AND  `$field` = $cValue  limit 1";
    if(!$executequery = $conn->execute($query))echo $conn->errorMsg();
    $total = $executequery->fields['total'];
   // echo $query."for $field and total = $total </br>";
    
    
    if ($total === 0)
	{
		return true;
	}
	else
	{
		return false;
	}
    
}

/**********************************************/
function insert_get_shop_category_list($gvar){
    global $conn;
  
    if(!isset($gvar['parent_id'])){
      $add_sql    = "pntid = pntid ";
    }else{
      $pid = intval($gvar['parent_id']);
      $add_sql = "pntid = $pid ";
    }
    if(!isset($gvar['cat_status']) ){
        $add_sql    .= "";
    }elseif($gvar['cat_status'] === "0"){
        $add_sql    .= "AND`cat_status` = 0 ";
    }else{
        $add_sql    .= "AND `cat_status` = 1 ";
    }
    
    
    $query = "SELECT * FROM `shop_category` WHERE ".$add_sql." ORDER BY `order` ASC ";
    $result = $conn->execute($query);
    $shopcat = $result->getAll();
    
    return $shopcat;
}
/**********************************************/
function insert_ishaveChild_shop_cat($var){
  global $conn;
  $catid = intval($var['catid']);
  $query = "SELECT count(*) as `total` FROM `shop_category` WHERE pntid = $catid";
  if(!$executequery = $conn->execute($query))echo $conn->errorMsg();
    $total = $executequery->fields['total'];
    //echo $query." for  total = $total </br>";
    
    
    if ((int)$total === 0)
	{
		return false;
	}
	else
	{
		return true;
	}
 
}

/**********************************************/
function insert_get_shop_cat($gvar){
    global $conn;
    $CatID = intval($gvar['catid']);
    $query = "SELECT *  FROM `shop_category` WHERE `catid`= $CatID";
    $result = $conn->execute($query);
  
    if(!$category = $result->getArray()){
        echo $conn->errorMsg();
        return false;
    }else{
        return $category['0'];
    }
}
/**********************************************/
function get_shop_cat_parent($catid){
     global $conn;
    $CatID = intval($catid);
    $query = "SELECT *  FROM `shop_category` WHERE `catid`= $CatID";
    $result = $conn->execute($query);
    $parent = $result->fields['pntid'];
    return $parent;
}
/**********************************************/
/*********** product **********/
/**********************************************/
function insert_get_pro_count($var){
    global $conn;
//    $var=intval($var['stock_status']);
  if($var['pro_status']=="1"){ 
    $add_sql = " `pro_status`=1 ";
  }
  elseif($var['pro_status']=="0"){ 
    $add_sql = " `pro_status`=0 "; 
  }
  
  if(!isset($var['stock_status'])){
      $add_sql .= "";    
    }
  elseif($var['stock_status']=="0"){
      $add_sql .= " AND `stock_status`=0";
    }  
  elseif($var['stock_status']=="1"){
      $add_sql .= " AND `stock_status`=1";
    }
  elseif($var['stock_status']=="2"){
      $add_sql .= " AND `stock_status`=2";
    }
    
 
    
  $query ="SELECT count(*) as total  FROM `shop_product` WHERE  ".$add_sql;
    //echo $query;
    $result = $conn->execute($query);
    $total = $result->fields['total'];
    return $total;
}

/**********************************************/
function insert_get_product_list($gvar){
    global $conn;
  //$gvar=intval($gvar['stock_status']);
    
  if(!isset($gvar['stock_status'])){
    
   $add_sql = " 'stock_status' = 'stock_status' " ;
  }
  elseif($gvar['stock_status']==1){ 
    
    $add_sql = " `stock_status`=1";
  
  }
  elseif($gvar['stock_status']==2){
    
    $add_sql = " `stock_status`=2"; 

  }
  elseif($gvar['stock_status']==0){ 
    
    $add_sql = " `stock_status`=0"; 
   
  }
    
  if($gvar['pro_status']== 1 ){ 
    
    $add_sql .= " AND  `pro_status`=1";
  
  }
  elseif($gvar['pro_status']== 0 ){ 
    
    $add_sql .= " AND  `pro_status`=0"; 
   
  }
  
    //echo $query;
  
    echo $conn->errorMsg();
  
    $query ="SELECT * FROM `shop_product` WHERE ".$add_sql;
    $result = $conn->execute($query);
    $produc = $result->getAll();
    return $produc;
}
/**********************************/
// i made this func for get list of products to catalog edit and its diferent by the other one
/*********************************/
function insert_product_list($var){
  
  
  global $conn;
  $proid = intval($var['proid']);
  $query = "SELECT *  FROM `shop_product` WHERE `proid`= $proid";
  $result = $conn->execute($query);
  
    if(!$product = $result->getArray()){
        echo $conn->errorMsg();
        return false;
    }else{
        return $product['0'];
    }
}


/**********************************************/
function insert_get_product_cat($var){
    global $conn,$config;
  
  if(!isset($var['stock_status'])){
    $add_sql = " 'stock_status' = 'stock_status' ";    
    }
  elseif($var['stock_status']==1){
    
    $add_sql = " shop_product.stock_status=1"; 
  }elseif($var['stock_status']==2){
      
   $add_sql = " shop_product.stock_status=2"; 
    
  }elseif($var['stock_status']==0){
   $add_sql = " shop_product.stock_status=0"; 
  }
  
  if($var['pro_status']=="1"){ 
    
    $add_sql .= " AND  shop_product.pro_status=1 ";
  
  }
  elseif($var['pro_status']=="0"){ 
    
    $add_sql .= " AND shop_product.pro_status=0 "; 
   
  }
    //echo $query;
   $query ="SELECT shop_product.*, shop_category.* FROM `shop_product`,`shop_category` WHERE shop_product.pro_catid= shop_category.catid AND".$add_sql;
    $result = $conn->execute($query);
    $pro_Cat = $result->getAll();
    return $pro_Cat;  
}


/**********************************************/
/************* products price ******/
function insert_get_product_ugroup_prc($gvar){
  global $conn;

  if($gvar['id']=="5" ){
    $add_sql = " AND `id`=5 ";
  }
  elseif($gvar['id']=="6" ){
    $add_sql = " AND `id`=6 ";
  }
  elseif($gvar['id']=="7" ){
    $add_sql = " AND `id`=7 ";
  }
  
  $query = "SELECT * FROM `user_group` WHERE `isCustomer`=1 AND `status`=1 ".$add_sql;
  $result = $conn->execute($query);
  
 if(!$userGroups = $result->getArray()){
      echo $conn->errorMsg();
      return false;
  }else{
    return $userGroups['0'];
  }
  
}
/**********************************************/
/************ package products**************/
function insert_get_packages($var){
  global $conn;
  
  $query = "SELECT * FROM `shop_packages`";
  $result = $conn->execute($query);
  $package = $result->getAll();
  return $package;
}

function insert_get_pack_edit($gvar){
  global $conn;
  $pckid = intval($gvar['pckid']);
  $query = "SELECT * FROM `shop_packages` WHERE `pckid`= $pckid";
  $result = $conn->execute($query);

  if(!$package = $result->getArray()){
        echo $conn->errorMsg();
        return false;
    }else{
        return $package['0'];
    }
}
/************favorites category****************/
/**********************************************/
function get_fav_cats($userid){
  global $conn;
  $uid = intval($userid);
  $query = "SELECT `fav_cats` FROM `users` WHERE `userid` =$uid ";
  $result = $conn->execute($query);
  $fav_string = $result->fields['fav_cats'];
  $fav_cats = explode(",", $fav_string);
  
  return $fav_cats;
  
}
/**********************************************/
/****************** user address **************/
/**********************************************/
function insert_get_state($var){
  global $conn;
  
  $query="SELECT * FROM `states`";
  $result = $conn->execute($query);
  $state = $result->getAll();
  return $state;
}


function insert_get_cities($var){
 global $conn;
  $s_id = intval($var['state_id']); 
  $query="SELECT * FROM `cities` WHERE state_id = $s_id";

  $result = $conn->execute($query);
  $city = $result->getAll();
  return $city;
  
}

function get_cities($stateid){
 global $conn;
  $s_id = intval($stateid); 
  $query="SELECT * FROM `cities` WHERE state_id = $s_id";

  $result = $conn->execute($query);
  $city = $result->getAll();
  return $city;
  
}
/*
*/
function do_resize_image($file, $width = 0, $height = 0, $proportional = false, $output = 'file')
{
	if($height <= 0 && $width <= 0)
	{
	  return false;
	}

	$info = getimagesize($file);
	$image = '';

	$final_width = 0;
	$final_height = 0;
	list($width_old, $height_old) = $info;

	if($proportional)
	{
	  if ($width == 0) $factor = $height/$height_old;
	  elseif ($height == 0) $factor = $width/$width_old;
	  else $factor = min ( $width / $width_old, $height / $height_old);

	  $final_width = round ($width_old * $factor);
	  $final_height = round ($height_old * $factor);

	  if($final_width > $width_old && $final_height > $height_old)
	  {
	  	  $final_width = $width_old;
		  $final_height = $height_old;

	  }
	}
	else
	{
	  $final_width = ( $width <= 0 ) ? $width_old : $width;
	  $final_height = ( $height <= 0 ) ? $height_old : $height;
	}

	switch($info[2])
	{
	  case IMAGETYPE_GIF:
		$image = imagecreatefromgif($file);
	  break;
	  case IMAGETYPE_JPEG:
		$image = imagecreatefromjpeg($file);
	  break;
	  case IMAGETYPE_PNG:
		$image = imagecreatefrompng($file);
	  break;
	  default:
		return false;
	}

	$image_resized = imagecreatetruecolor( $final_width, $final_height );

	if(($info[2] == IMAGETYPE_GIF) || ($info[2] == IMAGETYPE_PNG))
	{
	  $trnprt_indx = imagecolortransparent($image);

	  if($trnprt_indx >= 0)
	  {
		$trnprt_color    = imagecolorsforindex($image, $trnprt_indx);
		$trnprt_indx    = imagecolorallocate($image_resized, $trnprt_color['red'], $trnprt_color['green'], $trnprt_color['blue']);
		imagefill($image_resized, 0, 0, $trnprt_indx);
		imagecolortransparent($image_resized, $trnprt_indx);
	  }
	  elseif($info[2] == IMAGETYPE_PNG)
	  {
		imagealphablending($image_resized, false);
		$color = imagecolorallocatealpha($image_resized, 0, 0, 0, 127);
		imagefill($image_resized, 0, 0, $color);
		imagesavealpha($image_resized, true);
	  }
	}
	imagecopyresampled($image_resized, $image, 0, 0, 0, 0, $final_width, $final_height, $width_old, $height_old);

	switch( strtolower($output))
	{
	  case 'browser':
		$mime = image_type_to_mime_type($info[2]);
		header("Content-type: $mime");
		$output = NULL;
	  break;
	  case 'file':
		$output = $file;
	  break;
	  case 'return':
		return $image_resized;
	  break;
	  default:
	  break;
	}

	if(file_exists($output))
	{
		@unlink($output);
	}

	switch($info[2])
	{
	  case IMAGETYPE_GIF:
		imagegif($image_resized, $output);
	  break;
	  case IMAGETYPE_JPEG:
		imagejpeg($image_resized, $output, 100);
	  break;
	  case IMAGETYPE_PNG:
		imagepng($image_resized, $output);
	  break;
	  default:
		return false;
	}
	return true;
}

function insert_get_verify_user_step($var){
    global $conn;
    if(isset($gvar['usrid'])){
        $uid = intval($gvar['usrid']);
    }else{
        $uid = intval($_SESSION['USR_ID']);
    }
    
    $query = "SELECT `userid`,`verify_step` FROM `users` WHERE `userid`= $uid";
    $result = $conn->execute($query);
    $step = $result->fields('verify_step');
    return $step;
    
}