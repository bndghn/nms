<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";
$pass  =  "";
$num_rows  =  "";
$result    =  "";
$dupesql   =  "";
$duperaw   =  "";


//check wich usergroup must user add it.
(isset($_GET['type']) ? $type = $_GET['type'] : $type = "");

if ($type != ""){
    STemplate::assign('type',$type);
   
}else{
     STemplate::assign('type',"");
}

(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);


if ($submit === 1){
    
    $pass = generatePass($pass);
    
    (isset($_POST['username']) ? $username = $_POST['username'] : $username = "");
    (isset($_POST['email']) ? $email = $_POST['email'] : $email = "");
    (isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
    (isset($_POST['usergroup']) ? $usergroup =intval($_POST['usergroup']):$usergroup ="");
    
    if($username==="")
    {
        $error = "حتما باید نام کاربری را وارد نمایید.";
    }
    
    if(!verify_valid_email($email))
    {
        if($mobile==="" && $email==="")
        {
            $error = "حداقل باید شماره تلفن همراه یا آدرس پست الکترونیکی را وارد نمایید.";
        }
        else if($email !="" && $mobile==="")
        {
            $error = "آدرس پست الکترونیکی را درست وارد نمایید.";
        }
        else if($email !="" && $mobile !="")
        {
            $error = "آدرس پست الکترونیکی را درست وارد نمایید.";
        }
    }
    
   if(!check_tel($mobile))
    {
        if($mobile==="" && $email==="")
            {
                $error = "حداقل باید شماره تلفن همراه یا آدرس پست الکترونیکی را وارد نمایید.";
            }
        else if($email ==="" && $mobile!="")
            {
                $error = "شماره تلفن همراه را درست وارد نمایید.";
            }
        else if($email !="" && $mobile !="")
            {
                $error = "شماره تلفن همراه را درست وارد نمایید.";
            }
    }
    
    if(!check_tel($mobile) && !verify_valid_email($email)){
        $error = "اطلاعات وارد شده را بررسی کنید.";
    }
    
    
  
    /*
    $result = mysql_query("SELECT * FROM `users` WHERE key_id='$email'");
    $num_rows =intval(mysql_num_rows($result));

    if ($num_rows>1) {
       $error="It exists.";
    }*/
    
   

  

    
    
    if($error==="")
    {
       /* $dupesql = "SELECT * FROM `users` WHERE (`username`='.$username.',`email`='.$email.',`mobile`='.$mobile.')";
        $duperaw =intval(mysql_query($dupesql));

        if($duperaw > 0) 
        {
            $error="already exists in";
        }
        else{*/
           $query=" INSERT INTO `users`(`username`, `email`, `mobile`,`user_group`,`pass`) VALUES ('.$username.','.$email.','.$mobile.','.$usergroup.','.$pass.') ";
           if($conn->EXECUTE($query)){
               header("location: ".$config['adminurl']."/users.php");
           } 
                
    }else{
           $error=$conn->errorMsg(); 
    }
}
    
//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.add.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */
?>