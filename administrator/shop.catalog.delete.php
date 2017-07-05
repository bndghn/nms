<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error = "";
$message = "";


  
(isset($_GET['proid']) ? $proid =intval($_GET['proid']) : $proid = 0 );

(isset($_POST['isSubmit']) ? $isSubmit = intval($_POST['isSubmit']) : $isSubmit = 0);

if ($isSubmit === 1){
  
    $pro_status =intval($_POST['pro_status']);
    $proid =intval($_POST['proid']);

  if($error === "" ){
    
        $query="UPDATE `shop_product` SET `pro_status`=0 WHERE `proid`=$proid";
             echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.catalog.php");
       } 
        else{
           $error=$conn->errorMsg(); 
        }

    }else{
        header("location: ".$config['adminurl']."/shop.catalog.php?tsError=$error");
    }
}

      //load nessary template for loading
    STemplate::assign('message',$message);
    STemplate::assign('error',$error);

STemplate::assign('section',"shop");
STemplate::assign('page',"shop_catalog");
?>