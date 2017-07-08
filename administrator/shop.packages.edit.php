<?php

include('../core/config.php');

//check login or not
verify_login_admin();

// define var
$error      =   "";
$message    =   "";

(isset($_GET['pckid']) ? $pckid =intval($_GET['pckid']) : $pckid = 0 );

if($pckid > 0){
  
  STemplate::assign('pckid',$pckid);
  STemplate::display('administrator/shop.packages.edit.tpl');
  
}
//after form submit by user
(isset($_POST['isSubmit']) ? $isSubmit = $_POST['isSubmit'] : $isSubmit = "");

if ($isSubmit === "1"){
    
    (isset($_POST['pck_title']) ? $pckname = $_POST['pck_title'] : $pckname = "");
    (isset($_POST['pck_description']) ? $pck_desc = $_POST['pck_description'] : $pck_desc = "");
    (isset($_POST['pck_status']) ? $pck_status = "1" : $pck_status = "0");
    $pckID =intval($_POST['pckid']);
    if($error === ""){
        $addSQL = "";
        if($pckname !=""){
            $qcname = $conn->qStr($pckname);
            $addSQL .="  `pck_title` = $qcname";
        }
        if($pck_desc !=""){
            $qdesc = $conn->qStr($pck_desc);
            $addSQL .=" , `pck_description` = $qdesc";
        }
      
        //$quName = $conn->qStr($username);
        $query = "UPDATE `shop_packages` SET " .$addSQL. ", `pck_status` = $pck_status WHERE `pckid` = $pckID";

        if($conn->EXECUTE($query)){
            header("location: ".$config['adminurl']."/shop.packages.php");
         }else{
            echo $conn->errorMsg();
        }
    }
}

?>               