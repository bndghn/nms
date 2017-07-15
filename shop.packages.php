<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";



(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);

(isset($_GET['delete']) ? $isDelete = $_GET['delete'] : $isDelete = "");


if ($isDelete !=""){
    
    $deleteID = intval($isDelete);
    $query = "DELETE FROM `shop_packages` WHERE `pckid` = ".$deleteID;
    
    if($result = $conn->EXECUTE($query)){
        header("location: ".$config['adminurl']."/shop.packages.php");
        $message = " این بسته بندی با موفقیت حذف شد.";
    }
    else{
        $error= $conn->errorMsg();
    }
}


if ($submit === 1){
    (isset($_POST['pck_title']) ? $pckname = $_POST['pck_title'] : $pckname = "");
    (isset($_POST['pck_description']) ? $pck_description = $_POST['pck_description'] : $pck_description = "");
    (isset($_POST['pck_status']) ? $pck_status = 1 : $pck_status = 0);

    if($pckname === "" )
    {
        $error = "حتما باید نام دسته بندی کالا را وارد نمایید.";
    }     
  if($error === "" ){
        $pckname    = $conn->qStr($pckname);
        $pck_description   = $conn->qStr($pck_description);
        
        $query=' INSERT INTO `shop_packages`(`pck_title`, `pck_description`, `pck_status`) VALUES('.$pckname.','.$pck_description.','.$pck_status.')';
        
             echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.packages.php");
       } 
        else{
           $error=$conn->errorMsg(); 
        }
    }else{
        STemplate::assign('pck_description',$pck_description);
  }
  
}

/*(isset($_POST['isEdit']) ? $edit = intval($_POST['isEdit']) : $edit = 0);


if($edit===1){
  (isset($_POST['catid']) ? $catid = intval($_POST['catid']) : $catid = 0);
  (isset($_POST['order']) ? $order = intval($_POST['order']) : $order = 0);
    $query = "UPDATE `shop_category` SET `order` = $order WHERE `catid` = $catid";
            
    if($conn->EXECUTE($query)){
        header("location: ".$config['adminurl']."/shop.categories.php");
     }else{
        echo $conn->errorMsg();
    }
}*/

//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);



STemplate::assign('section',"shop");
STemplate::assign('page',"shop_package");


STemplate::display('administrator/header.tpl');
STemplate::display('administrator/shop.packages.tpl');
STemplate::display('administrator/footer.tpl'); 
?>