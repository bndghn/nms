<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error = "";
$message = "";

(isset($_GET['proid']) ? $proid =intval($_GET['proid']) : $proid = 0 );

if ($proid != 0){
  if($error === "" ){
        $query="UPDATE `shop_product` SET `pro_status`=0 WHERE `proid`=$proid";
             echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.catalog.php");
       } 
        else{
            echo $conn->errorMsg(); 
        }
    }else{
        header("location: ".$config['adminurl']."/shop.catalog.php?tsError=$error");
    }
}
?>