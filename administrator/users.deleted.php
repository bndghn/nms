<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error = "";
$message = "";

(isset($_GET['userid']) ? $userid =intval($_GET['userid']) : $userid = 0 );

if ($userid != 0){
  if($error === "" ){
        $query= "DELETE FROM `users` WHERE `userid`=$userid";
               
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/users.php");
       } 
        else{
            echo $conn->errorMsg(); 
        }
    }else{
        header("location: ".$config['adminurl']."/users.php?tsError=$error");
    }
}
?>