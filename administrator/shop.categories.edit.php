<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['catid']) ? $cat_id =intval($_GET['catid']) : $cat_id = 0 );


if($cat_id > 0){
  
  STemplate::assign('catid',$cat_id);
  STemplate::display('administrator/shop.categories.edit.tpl');

}


   



//after form submit by user
(isset($_POST['isSubmit']) ? $isSubmit = $_POST['isSubmit'] : $isSubmit = "");

if ($isSubmit === "1"){
    
    (isset($_POST['catname']) ? $catname = $_POST['catname'] : $catname = "");
    (isset($_POST['cat_desc']) ? $cat_desc = $_POST['cat_desc'] : $cat_desc = "");
    (isset($_POST['pntid']) ? $pntid =intval($_POST['pntid']) : $pntid = 0);
    (isset($_POST['order']) ? $order =intval($_POST['order']) : $order = 0);
    (isset($_POST['cat_status']) ? $status = 1 : $status = 0);
   
    $CatID =intval($_POST['catid']);
  
    if($error === ""){

        $addSQL = "";

        if($catname !=""){
            $qcname = $conn->qStr($catname);
            $addSQL .="  `cat_name` = $qcname";
        }
        if($order !=0){
            
            $addSQL .=" , `order` = $order";
        }
      
        if($pntid !=0){
            $addSQL .=" , `pntid` = $pntid";
        }
        if($cat_desc !=""){
            $qdesc = $conn->qStr($cat_desc);
            $addSQL .=" , `catdesc` = $qdesc";
        }
        //$quName = $conn->qStr($username);
        $query = "UPDATE `shop_category` SET " .$addSQL. ", `cat_status` = $status WHERE `catid` = $CatID";

        if($conn->EXECUTE($query)){
            header("location: ".$config['adminurl']."/shop.categories.php");
         }else{
            echo $conn->errorMsg();
        }
    }else{
        header("location: ".$config['adminurl']."/shop.categories.php?tsError=$error");
    }
}
  
?>               