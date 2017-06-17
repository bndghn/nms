<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

//check wich usergroup must user add it.
(isset($_GET['type']) ? $type = $_GET['type'] : $type = "");

if ($type != ""){
    STemplate::assign('type',$type);
   
}else{
     STemplate::assign('type',"");
}

(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);


if ($submit === 1){
    (isset($_POST['username']) ? $username = $_POST['username'] : $username = "");
    (isset($_POST['email']) ? $email = $_POST['email'] : $email = "");
    (isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
    (isset($_POST['usergroup']) ? $usergroup =intval($_POST['usergroup']):$usergroup ="");
    

    if($username==="")
    {

        $error = "حتما باید نام کاربری را وارد نمایید.";

    }
    
    if(!verify_valid_email($email)){
            if($mobile==="")
            {

                $error = "حتما باید شماره تلفن همراه را وارد نمایید.";

            }

    }
        
    if($mobile==="")
    {

        $error = "حتما باید شماره تلفن همراه را وارد نمایید.";

    }

    
    
    
    
    
    
    
    if($error===""){
        $catname    = $conn->qStr($catname);
        $descript   = $conn->qStr($descript);
        
       $query=" INSERT INTO `users`(`username`, `email`, `mobile`,`user_group`) VALUES ('.$username.','.$email.','.$mobile.','.$usergroup.') ";
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/users.php");
       } 
        else{
           $error=$conn->errorMsg(); 
        }

    }

















}
//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.add.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */
?>