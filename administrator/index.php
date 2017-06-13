<?php

include('../core/config.php');
// get error or message from other page
(isset($_GET['error']) ? $getError = cleanit($_GET['error']) : $getError = "");
(isset($_GET['message']) ? $getMessage = cleanit($_GET['message']) : $getMessage = "");

if($getError!=""){
    $error = $lang[$getError];
}else {
    $error = "";
}

if($getMessage!=""){
    $message = $lang[$getMessage];
}else {
    $message = "";
}

// Define Varibel From Sessions
(isset($_SESSION['ADMIN_ID']) ? $adminID = $_SESSION['ADMIN_ID'] : $adminID = "");
(isset($_SESSION['ADMIN_USER']) ? $adminUN = $_SESSION['ADMIN_USER'] : $adminUN = "");
(isset($_SESSION['ADMIN_PASS']) ? $adminPSS = $_SESSION['ADMIN_PASS'] : $adminPSS = "");




//check login or not. if login redirect to dashboard.php
if ($adminID != "" && $adminUN != "" && $adminPSS != "")
{
	$redirect = $config['adminurl']."/dashboard.php";
    header("location: $redirect");
}
else
{
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
            $error = $lang['23'];
        }
        elseif ($password === "")
        {
            $error = $lang['24'];
        }
        else
        {
            //starting process for checking user and pass is true or not
            
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
            }else{
                
                // get username and pass from db
                $getID      = $result->fields['id'];
                $getUname   = $result->fields['username'];
                $getPass    = $result->fields['pass'];
                $getAdmin   = intval($result->fields['admin']);
                $getGender  = $result->fields['gender'];
                $getFname   = $result->fields['fname'];
                $getLname   = $result->fields['lname'];
                $getEmail   = $result->fields['email'];
                $getMobile  = $result->fields['mobile'];
                
                //check that user and pass is match or not
                if (is_numeric($getID) && $getUname != "" && $getPass != "" && $getUname === $username && $getPass === $encodePass)
                {
                    if($getAdmin === 0)
                    {
                        $error = $lang['25'];

                    }else
                    {
                        // set LatLogin to db
                        $qLIP = $conn->qStr(get_last_ip());
                        $query_history  = "UPDATE `users` SET `last_login`='".time()."',`last_ip`=$qLIP WHERE `username`=$qUsername";
                        $conn->execute($query_history);
                        //$error = $conn->errorMsg();
                        
                        $_SESSION['ADMIN_LOGIN'] = 1;
                        
                        
                        
                        $_SESSION['ADMIN_ID'] = $getID;
                        $_SESSION['ADMIN_USER'] = $getUname;
                        $_SESSION['USERNAME'] = $getUname;
                        $_SESSION['ADMIN_PASS'] = $encodePass;
                        $_SESSION['ADMIN_GENDER'] = $getGender;
                        $_SESSION['ADMIN_FNAME'] = $getFname;
                        $_SESSION['ADMIN_LNAME'] = $getLname;
                        $_SESSION['ADMIN_EMAIL'] = $getEmail;
                        $_SESSION['ADMIN_MOBILE'] = $getMobile;
                        $_SESSION['ISADMIN'] = 1;
                        
                        if($remember===1){
                            create_remember();
                        }

                        $redirect = $config['adminurl']."/dashboard.php";
                        header("location: $redirect");
                    }

                }
                else
                {
                    $error = $lang['26'];
                } // END IF: check that user and pass is match or not
                
            } // END IF: have error in excute db or not
            
        } // END IF: check that input is fill or not
        
    } // END IF: check Form submit or not
    
    
    
    //load nessary template for loading
    STemplate::assign('message',$message);
    STemplate::assign('error',$error);
    
    STemplate::display('administrator/header.tpl');
    STemplate::display('administrator/index.tpl');
    STemplate::display('administrator/footer.tpl');
}