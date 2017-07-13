<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";


(isset($_GET['catid']) ? $catid = intval($_GET['catid']) : $catid = 0);

if ($catid > 0){
      
  STemplate::assign('catid',$catid);
  STemplate::display('administrator/shop.categories.delete.tpl');
}
(isset($_GET['isSubmit']) ? $isSubmit = intval($_GET['isSubmit']) : $isSubmit = 0);

if($isSubmit === 1){
  $deleteID = intval($catid);
  $cat = insert_get_shop_cat(array('value' => 'gvar', 'catid' =>  $deleteID ));
  if($error === ""){
        if($cat['pntid'] === "0"){
  
        }else{}
  }else{
    
  }
  
  
  
  
  
}


//  
    
   /*$cat = insert_get_shop_cat(array('value' => 'gvar', 'catid' =>  $deleteID ));
    if($error === ""){
        if($cat['pntid'] === "0"){
            $query =    "UPDATE `shop_category` SET `cat_status`=2 WHERE `catid` = ".$deleteID ;
            if($result = $conn->EXECUTE($query)){
                header("location: ".$config['adminurl']."/shop.categories.php");
              //  $message = " این دسته کالا با موفقیت حذف شد.";
            }
            else{
                $error= $conn->errorMsg();
            }
                
        }else{
            // delete category if not have children
            //$query = "DELETE FROM `shop_category` WHERE `catid` = ".$deleteID;  
           /* if($result = $conn->EXECUTE($query)){
                header("location: ".$config['adminurl']."/shop.categories.php");
              //  $message = " این دسته کالا با موفقیت حذف شد.";
            }
            else{
                $error= $conn->errorMsg();
            }
            
        }
    } else{
        header("location: ".$config['adminurl']."/shop.categories.php?tsError=$error");
    } } */ 
    
