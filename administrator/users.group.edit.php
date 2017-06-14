<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['id']) ? $userID = $_GET['id'] : $userID = "");


if($userID!=""){
    $userID = intval($userID);
    $query="SELECT * FROM `user_group` WHERE `id`=$userID Limit 1";
    $excuteGUser=$conn->EXECUTE($query);
    $gUser=$excuteGUser->getArray();
    STemplate::assign('gUser',$gUser['0']);
    
}


//after form submit by user
(isset($_POST['isSubmit']) ? $isSubmit = $_POST['isSubmit'] : $isSubmit = "");
if ($isSubmit === "1"){
    
    (isset($_POST['category']) ? $catname = $_POST['category'] : $catname = "");
    (isset($_POST['isCustomer']) ? $iscostum = 1 : $iscostum = 0);
    (isset($_POST['status']) ? $status = 1 : $status = 0);
    (isset($_POST['description']) ? $descript = $_POST['description'] : $descript = "");
    (isset($_POST['id']) ? $idUGroup = $_POST['id'] : $idUGroup = "");
    
    if($idUGroup !=""){
        if($idUGroup==="1" ||  $idUGroup==="2" ||  $idUGroup==="3" ){
            $error = "1"; //"شما مجاز به ویرایش گروه های اصلی نیستید!"
        }
    }else{
        $error = "2"; //"به دلیل مشکلات فنی، امکان ویرایش گروه میسر نیست!"
    }
        
    


    
    
    
    
    
    
   if($error===""){
        $idUGroup = intval($idUGroup);
        $query="UPDATE `user_group` SET `category`='$catname',`description`='$descript',`isCustomer`='$iscostum', `status`='$status' WHERE `id`=$idUGroup";
        //     echo $query;
        $conn->EXECUTE($query);
        header("location:".$config['adminurl']."/users.group.php");

    }else{

       header("location:".$config['adminurl']."/users.group.php?tsError=".$error);
    }
       
  
 
    
    
    
}




   

   
    STemplate::display('administrator/users.group.edit.tpl');
    



?>