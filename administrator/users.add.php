<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";



(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);


if ($submit === 1){
    (isset($_POST['username']) ? $username = $_POST['username'] : $username = "");
    (isset($_POST['email']) ? $email = $_POST['email'] : $email = "");
    (isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
    (isset($_POST['usergroup']) ? $usergroup =intval($_POST['usergroup']):$usergroup =0);
    

    if($username==="")
    {
        $error = "1";
    }elseif(!verifyUserData("username",$username)){
        $error = "2";
    }elseif(!verify_user_unique("username",$username)){
        $error = "3";
    }elseif(strlen($username) < 4){
        $error = "4";
    }elseif(strlen($username) > 12){
        $error = "5";
    }elseif($usergroup === 0){
        $error = "6";
    }elseif($email ==="" AND $mobile === "")
    {
        $error = "7";
    }else{
        
        //check if email enter
        if ($email != ""){
            
            if(!verifyUserData("email",$email)){
                $error = "8";
            }elseif(!verify_user_unique("email",$email)){
                $error = "9";
            }
        }
        if($mobile != ""){
            
            if(strlen($mobile) != 11){
                $error = "10";
            }elseif(!verifyUserData("mobile",$mobile)){
                $error = "11";
            }elseif(!verify_user_unique("mobile",$mobile)){
                $error = "12";
            }
        }
    }
    
    $pass = generatePass( 6 , "number");
  
        
   
    
    // if not seen error insert new user into bank
    if($error===""){
        
        /* ToDoo
        **********************************
        1) isAdmin must added for admin and employer users for accessing to backend site.
        **********************************
        */
        $username    = $conn->qStr($username);
        
        if($email !=""){
            $email   = $conn->qStr($email);
        }else{ $email   = "null";}
        
        if($mobile !=""){
            $mobile   = $conn->qStr($mobile);
        }else{ $mobile   = "null";}
        
        $firstPass  = $conn->qStr($pass);
        $mdPass     = md5($pass);
        
        
        
       $query=" INSERT INTO `users`(`username`, `email`, `mobile`,`user_group`, `firstPass` , `pass`) VALUES ($username,$email,$mobile,$usergroup,$firstPass, '$mdPass') ";
        echo $query;
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/users.php");
       } 
        

    }else{
        
        header("location:".$config['adminurl']."/users.php?tsError=".$error);
   
    }
}
//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.add.tpl');
//STemplate::display('administrator/footer.tpl'); /* Load form users file */
?>