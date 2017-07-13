<?php

include('core/config.php');
// Define Varibel From Sessions

$error = "";
$message = "";

(isset($_SESSION['LOGIN']) ? $login = $_SESSION['LOGIN'] : $login = "");
(isset($_SESSION['verifeid']) ? $verify = $_SESSION['verifeid'] : $verify = "");

//check login or not. if login redirect to dashboard.php
if (isset($_SESSION['LOGIN']))
{   
    if($verify =="0"){
        $redirect = $config['baseurl']."/profile.php";
    }else{
        $redirect = $config['baseurl']."/index.php";
    }
    header("location: $redirect");
    
}else{
    
     // file $submit with useful value
    (isset($_POST['login']) ? $sumbit = $_POST['login'] : $sumbit = "");
    
    // check login form
    if( $sumbit === "1"){
        // code for checking data of login form
        (isset($_POST['username']) ? $username = cleanit($_POST['username']) : $username = "");
        (isset($_POST['password']) ? $password = cleanit($_POST['password']) : $password = "");
        (isset($_POST['remember']) ? $remember = 1 : $remember = 0);
        
        //check that input is fill or not
        if ($username === "")
        {
            $error = "نام کاربری خود را وارد نکردید!";
        }
        elseif ($password === "")
        {
            $error = "پسورد خود را وارد نکردید!";
        }
        
            
            
        // convert password to md5 hash
        $encodePass = md5($password);

        // prepare var for db
        $qUsername  = $conn->qStr($username);
        $qPassword  = $conn->qStr($encodePass);
            
        //create Query
        $query      = "SELECT * FROM `users` WHERE `username`=".$qUsername." AND `pass`=".$qPassword;
            
        // execute query
        if(!$result=$conn->execute($query)){
            $error = $conn->errorMsg();
        }
        if($result->recordcount()<1){
            $error = "رمز عبور و پسورد اشتباه است. لطفا مجددا تلاش کنید.";
        }
        if($result->fields['user_status']=="0")
        {
             $error = "کاربر محترم، دسترسی شما توسط مدیریت محدود شده است.";
        }
                
         if($error == ""){

            // get username and pass from db
            $getID      = intval($result->fields['userid']);
            $getUname   = $result->fields['username'];
            $getPass    = $result->fields['pass'];
            $getAdmin   = intval($result->fields['admin']);
            $getGender  = $result->fields['gender'];
            $getFname   = $result->fields['fname'];
            $getLname   = $result->fields['lname'];
            $getEmail   = $result->fields['email'];
            $getMobile  = $result->fields['mobile'];
            $getStatus  = $result->fields['user_status'];
            $getVerified  = intval($result->fields['verified']);

            // set LatLogin to db
            $qLIP = $conn->qStr(get_last_ip());
            $query_history  = "UPDATE `users` SET `last_login`='".time()."',`last_ip`=$qLIP WHERE `username`=$qUsername";
            $conn->execute($query_history);
            //$error = $conn->errorMsg();

            $_SESSION['LOGIN'] = 1;

            $_SESSION['USR_ID'] = $getID;
            $_SESSION['USERNAME'] = $getUname;
            $_SESSION['USR_PASS'] = $encodePass;

            if($getVerified == 1){
                $_SESSION['USR_GENDER'] = $getGender;
                $_SESSION['USR_FNAME'] = $getFname;
                $_SESSION['USR_LNAME'] = $getLname;
                $_SESSION['verified'] = "1";
            }

            if($getEmail !="" ){
                $_SESSION['USR_EMAIL'] = $getEmail;
            }
            if($getMobile !="" ){
                $_SESSION['USR_MOBILE'] = $getMobile;
            }

            if($remember===1){
               // create_remember();
            }



            if(!isset($_SESSION['verified'])){
                $redirect = $config['baseurl']."/profile.php";
            }else{
                $redirect = $config['baseurl']."/index2.php";
            }
            header("location: $redirect");

         }// if not error fount
               
                
           
            
        
        
    } // END IF: check Form submit or not   
    
    
    STemplate::assign('message',$message);
    STemplate::assign('error',$error);
    
    
    STemplate::display('login.tpl');
    
}

