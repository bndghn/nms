<?php

include('../core/config.php');

verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['id']) ? $userID = $_GET['id'] : $userID = "");

STemplate::assign('section',"users_manager");
STemplate::assign('page',"users");
  

if($userID !=""){
    STemplate::assign('userID',$userID);
    STemplate::display('administrator/users.profile.tpl');
}
(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);

if ($submit === 1){
  (isset($_POST['fname']) ? $fname = $_POST['fname'] : $fname = "");
    (isset($_POST['lname']) ? $lname = $_POST['lname'] : $lname = "");
    (isset($_POST['email']) ? $email = $_POST['email'] : $email = "");
    (isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
  
    $user_id =intval($_POST['userid']);
    $status =intval($_POST['status']);
    $usergroup =intval($_POST['usergroup']);

    /*if($username==="" )
    {
        $error = "1";
    }
    elseif(isUserChange($user_id,"username",$username)){
        if(!verifyUserData("username",$username)){
            $error = "2";
        }elseif(!verify_user_unique("username",$username)){
            $error = "3";
        }elseif(strlen($username) < 4){
            $error = "4";
        }elseif(strlen($username) > 12){
            $error = "5";
        }
        
    }*/
    
    
    
        
        
    if($fname!="" && strlen($fname)<3){ 
        $error = "13";
    }
    elseif($lname!="" && strlen($lname)<5){
        $error = "13";
    }
    
    elseif($email ==="" AND $mobile === ""){
        $error = "7";
    }
    else{
        
        //check if email enter
        if ($email != ""){
            if(isUserChange($user_id,"email",$email)){
                if(!verifyUserData("email",$email)){
                    $error = "8";
                }elseif(!verify_user_unique("email",$email)){
                    $error = "9";
                }
            }
            
        }
        if($mobile != ""){
            if(isUserChange($user_id,"mobile",$mobile)){
                if(strlen($mobile) != 11){
                    $error = "10";
                }elseif(!verifyUserData("mobile",$mobile)){
                    $error = "11";
                }elseif(!verify_user_unique("mobile",$mobile)){
                    $error = "12";
                }
            }
        }
    }
    
    
    
    
    
    
    
    if(isset($user_id)){
        
        if($error === ""){
            
            $addSQL = "";
                    
            if($fname !=""){
                $qfName = $conn->qStr($fname);
                $addSQL .=" , `fname` = $qfName";
            }
            if($lname !=""){
                $qlName = $conn->qStr($lname);
                $addSQL .=" , `lname` = $qlName";
            }
            if($email !=""){
                $qEmail= $conn->qStr($email);
                $addSQL .=" , `email` = $qEmail";
            }
            if($mobile !=""){
                $qmobile= $conn->qStr($mobile);
                $addSQL .=" , `mobile` = $qmobile";
            }
            
            
            //$quName = $conn->qStr($username);
            
            $query = "UPDATE `users`
                        SET `user_status`=$status , `user_group`=$usergroup  ".$addSQL."
                        WHERE `userid` = $user_id";
            if($conn->EXECUTE($query)){
                header("location: ".$config['adminurl']."/users.php");
             }else{
                echo $conn->errorMsg();
            }
            
        }else{
            header("location: ".$config['adminurl']."/users.php?tsError=$error");
        }
        
    }
}













//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu

?>