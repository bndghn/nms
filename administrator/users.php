<?php

include('../core/config.php');

verify_login_admin();

// define var
$error      =   "";
$message    =   "";

//get error from other pages
(isset($_GET['tsError']) ? $tsErrorNumber = intval($_GET['tsError']) : $tsErrorNumber = "");
 
if ($tsErrorNumber!=""){
     
    switch($tsErrorNumber){
        case 1:
            $tsError = "حتما باید نام کاربری را وارد نمایید.";
            break;
             
        case 2:
            $tsError = "نام کاربری فقط می تواند  متشکل از کارکترهای لاتین و اعداد باشد.";
            break;
             
        case 3:
            $tsError = "این نام کاربری توسط فرد دیگری ثبت شده و قابل استفاده نمی باشد.";
            break;
            
        case 4:
            $tsError = "نام کاربری باید بیش از 4 کارکتر باشد.";
            break;
            
        case 5:
            $tsError = "نام کاربری نباید بیشتر از ۱۲ کارکتر باشد.";
            break;
        
        case 6:
            $tsError = "گروه کاربری انتخاب نشده است.";
            break;
            
        case 7:
            $tsError =  "پست الکترونیک یا موبایل مشتری حتما باید وارد شود.";
            break;
            
        case 8:
            $tsError = "پست الکترونیک به درستی وارد نشده است.";
            break;
            
        case 9:
            $tsError = "ایمیل تکراری است و کاربر قبلا ثبت شده است.";
            break;
            
        case 10:
            $tsError = "تعداد شماره های تلفن همراه باید ۱۱ رقم باشد! ";
            break;
            
          
        case 11:
            $tsError = "شماره تلفن همراه به درستی وارد نشده است.";
            break;
            
        case 12:
            $tsError ="شماره تلفن همراه تکراری است و کاربر قبلا ثبت شده است." ;
            break;
        
        
        case 13:
            $tsError = "نام و نام خانوادگی به درستی وارد نشده است . " ;
            break;
             
        case 14:
            $tsError = "مدیر اصلی نمی تواند حذف شود.";
            break;
            /* ***** for others error in other page ***** 
        case 15:
            $tsError = ;
            break;
            
        case 16:
            $tsError = ;
            break;
            
        */////////
    }
    
     
     
     if(isset($tsError)){
         STemplate::assign('tsError',$tsError);
     }
 }



//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu
STemplate::assign('section',"users_manager");
STemplate::assign('page',"users");
STemplate::display('administrator/users.tpl');
/* Load form users file */