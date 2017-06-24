<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";
//get error from other pages
(isset($_GET['tsError']) ? $tsErrorNumber = intval($_GET['tsError']) : $tsErrorNumber = "");
 if ($tsErrorNumber!=""){
     if($tsErrorNumber==1){
         $tsError = "شما مجاز به ویرایش گروه های اصلی نیستید!";
     }elseif($tsErrorNumber==2){
         $tsError = "به دلیل مشکلات فنی، امکان ویرایش گروه میسر نیست!";
     }
     if(isset($tsError)){
         STemplate::assign('tsError',$tsError);
     }
 }
 


(isset($_POST['isSubmit']) ? $submit = $_POST['isSubmit'] : $submit = "");


(isset($_GET['delete']) ? $isDelete = $_GET['delete'] : $isDelete = "");

if ($isDelete !=""){
    
    $deleteID = intval($isDelete);
    $query = "DELETE FROM `user_group` WHERE `id` = ".$deleteID;
    
    if($result = $conn->EXECUTE($query)){
        header("location: ".$config['adminurl']."/users.group.php");
        $message = " کاربر با موفقیت حذف شد.";
    }
    else{
        $error= $conn->errorMsg();
    }
}
    





if ($submit === "1"){
    (isset($_POST['category']) ? $catname = $_POST['category'] : $catname = "");
    (isset($_POST['description']) ? $descript = $_POST['description'] : $descript = "");
    (isset($_POST['iscostumer']) ? $iscostum = 1 : $iscostum = 0);
    (isset($_POST['status']) ? $status = 1 : $status = 0);
    
    if($catname==="")
    {
        $error = "حتما باید نام گروه کاربری را وارد نمایید.";
    }

    if($error===""){
        $catname    = $conn->qStr($catname);
        $descript   = $conn->qStr($descript);
        
        $query='INSERT INTO `user_group`(`category`, `description`, `isCustomer`,`status`,`date_created`) VALUES('.$catname.','.$descript.','.$iscostum.','.$status.','.time().')';
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/users.group.php");
       } 
        else{
           $error=$conn->errorMsg(); 
        }

    }


}



//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

//Select active menu
STemplate::assign('section',"users_manager");
STemplate::assign('page',"usersgroup");

STemplate::display('administrator/header.tpl');
STemplate::display('administrator/users.group.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */



?>