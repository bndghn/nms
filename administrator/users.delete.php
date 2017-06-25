<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['id']) ? $userID = intval($_GET['id']) : $userID = "");

if($userID !=""){
    
    $user = insert_get_user(array('value' => 'var', 'userid' =>  $userID ));
    if($user['userid'] === "1"){
       $error = "14";
    }
    
    if($error === ""){
        if($user['verified'] === "1"){
            $query =    "UPDATE `users` SET `user_status`=2 WHERE `userid` = $userID ";
            if($conn->EXECUTE($query)){
                header("location: ".$config['adminurl']."/users.php");
            }else{
                echo $conn->errorMsg();
            }
                
        }else{
            // delete customers if not valid
            $queryDelete =    "DELETE FROM `users` WHERE `userid` = $userID ";
            if($conn->EXECUTE($queryDelete)){
                header("location: ".$config['adminurl']."/users.php");
            }else{
                echo $conn->errorMsg();
            }
            
        }
    }else{
         header("location: ".$config['adminurl']."/users.php?tsError=$error");
    }
    
   
    
    
}