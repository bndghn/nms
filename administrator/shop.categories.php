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
    $query = "DELETE FROM `shop_category` WHERE `catid` = ".$deleteID;
    
    if($result = $conn->EXECUTE($query)){
        header("location: ".$config['adminurl']."/shop.categories.php");
        $message = " این دسته کالا با موفقیت حذف شد.";
    }
    else{
        $error= $conn->errorMsg();
    }
}




if ($submit === 1){
    (isset($_POST['catname']) ? $catname = $_POST['catname'] : $catname = "");
    (isset($_POST['cat_desc']) ? $cat_desc = $_POST['cat_desc'] : $cat_desc = "");
  //  (isset($_POST['pntid']) ? $pntid =intval($_POST['pntid']) : $pntid = 0);
  
    (isset($_POST['order']) ? $order =intval($_POST['order']) : $order = 0);
    (isset($_POST['cat_status']) ? $status = "1" : $status = "0");
    $pntid =intval($_POST['pntid']);
   //  $status =intval($_POST['cat_status']);
   
   
    
    if($catname === "" )
    {
        $error = "حتما باید نام دسته بندی کالا را وارد نمایید.";
    } 
    
    elseif($order === 0)
    {
        $error = "حتما باید شماره سری دسته بندی کالا را وارد نمایید.";
    }

    
  if($error === "" ){
        $catname    = $conn->qStr($catname);
        $cat_desc   = $conn->qStr($cat_desc);
        
        $query=' INSERT INTO `shop_category`(`cat_name`, `catdesc`, `pntid`, `cat_status` , `order`) VALUES('.$catname.','.$cat_desc.','.$pntid.','.$status.','.$order.')';
        
             echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.categories.php");
       } 
        else{
           $error=$conn->errorMsg(); 
        }

    }


}






(isset($_POST['isEdit']) ? $edit = intval($_POST['isEdit']) : $edit = 0);
(isset($_POST['isEdit']) ? $edit = intval($_POST['isEdit']) : $edit = 0);
(isset($_POST['isEdit']) ? $edit = intval($_POST['isEdit']) : $edit = 0);

if($edit===1){
  (isset($_POST['catid']) ? $catid = intval($_POST['catid']) : $catid = 0);
  (isset($_POST['order']) ? $order = intval($_POST['order']) : $order = 0);
    $query = "UPDATE `shop_category` SET `order` = $order WHERE `catid` = $catid";
            
    if($conn->EXECUTE($query)){
        header("location: ".$config['adminurl']."/shop.categories.php");
     }else{
        echo $conn->errorMsg();
    }
}






//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);


//Select active menu
STemplate::assign('section',"shop");
STemplate::assign('page',"shop_categories");


STemplate::display('administrator/header.tpl');
STemplate::display('administrator/shop.categories.tpl');
STemplate::display('administrator/footer.tpl'); /* Load form users file */
?>