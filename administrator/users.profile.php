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
    STemplate::assign('favs_array',get_fav_cats($userID));
    STemplate::display('administrator/users.profile.tpl');
}
(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);

if ($submit === 1){
    (isset($_POST['fname']) ? $fname = $_POST['fname'] : $fname = "");
    (isset($_POST['lname']) ? $lname = $_POST['lname'] : $lname = "");
    (isset($_POST['email']) ? $email = $_POST['email'] : $email = "");
    (isset($_POST['mobile']) ? $mobile = $_POST['mobile'] : $mobile = "");
    (isset($_POST['born_date']) ? $born_date = $_POST['born_date'] : $born_date = "");
    (isset($_POST['user_address']) ? $address = $_POST['user_address'] : $address = "");
    $user_id =intval($_POST['userid']);
    $gender =intval($_POST['gender']);
    $status =intval($_POST['user_status']);
    $usergroup =intval($_POST['usergroup']);
    $state_id =intval($_POST['state_id']);
    $city_id =intval($_POST['city_id']);
    $verified =intval($_POST['verified']);
  
  
  
  
  
  // `fav_cats`)
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
            if($address !=""){
                $qadd= $conn->qStr($address);
                $addSQL .=" , `user_address` = $qadd";
            }
          if($born_date !=""){
            //$born_date =  date_create_from_format('j-M-Y', 'born_date');
  
                $qborn= $conn->qStr($born_date);
                $addSQL .=" , `born_date` = $qborn";
            }
         
            
            
            //$quName = $conn->qStr($username);
           
           
           $query = "UPDATE `users`
                        SET `user_status`=$status , `verified` = 1 , `user_group`=$usergroup , `gender`=$gender ,`state_id`=$state_id, `city_id`=$city_id ".$addSQL."
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


(isset($_POST['favSubmit']) ? $fav_submit = $_POST['favSubmit'] : $fav_submit = "0");


if($fav_submit == "1"){
  $user_id =intval($_POST['userid']);
  
  
  (isset($_POST['fav']) ? $fav_cat = $_POST['fav'] : $fav_cat = "");
  if($fav_cat!=""){
    $fav_db = implode(',',$fav_cat);
  }else{
    $fav_db = null;
  }
  $fav_db = $conn->qStr($fav_db);
  
    $queryy = "UPDATE `users` SET `fav_cats`=$fav_db WHERE `userid` = $user_id";
  echo $queryy;
    if($conn->EXECUTE($queryy)){
      header("location: ".$config['adminurl']."/users.profile.php?id=$user_id");
   }else{
        echo $conn->errorMsg();
    }

}










//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu

?>