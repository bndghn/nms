<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";



(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);

if ($submit === 1){
  
    (isset($_POST['pro_name']) ? $pro_name = $_POST['pro_name'] : $pro_name = "");
    (isset($_POST['sku']) ? $sku = $_POST['sku'] : $sku = "");
    $gender =intval($_POST['gender']);
    $pro_status =intval($_POST['pro_status']);
    (isset($_POST['pro_count']) ? $pro_count =intval($_POST['pro_count']) : $pro_count = 0);
    $p_c_unit =intval($_POST['pro_count_unit']);
    (isset($_POST['pro_weight']) ? $pro_weight =intval($_POST['pro_weight']) : $pro_weight = 0);
    (isset($_POST['pro_size']) ? $pro_size = $_POST['pro_size'] : $pro_size = "");
    (isset($_POST['Delivery_time']) ? $Delivery_time =intval($_POST['Delivery_time']) : $Delivery_time = 0);
    $stock_status =intval($_POST['stock_status']);
    (isset($_POST['pro_pic_main']) ? $p_p_main = $_POST['pro_pic_main'] : $p_p_main = "null");
    (isset($_POST['pro_pic_mini']) ? $p_p_mini = $_POST['pro_pic_mini'] : $p_p_mini = "null");
    (isset($_POST['pro_desc']) ? $pro_desc = $_POST['pro_desc'] : $pro_desc = "");
    (isset($_POST['pro_short_desc']) ? $p_s_desc = $_POST['pro_short_desc'] : $p_s_desc = "");
    (isset($_POST['pro_metakey']) ? $pro_metakey = $_POST['pro_metakey'] : $pro_metakey = "");
    (isset($_POST['pro_attributes']) ? $pro_attributes = $_POST['pro_attributes'] : $pro_attributes = "");
   
    
    if($pro_name === "" )
    {
        $error = "حتما باید نام کالا را وارد نمایید.";
    } 
    elseif($sku === "" )
    {
        $error = "حتما باید کد شناسایی کالا را وارد نمایید.";
    } 
    
    elseif($pro_weight === 0 )
    {
        $error = "حتما باید وزن کالا را وارد نمایید.";
    }
    elseif($pro_size === "" )
    {
        $error = "حتما باید ابعاد کالا را وارد نمایید.";
    }
    elseif($Delivery_time === 0 )
    {
        $error = "حتما باید موعد تحویل کالا را وارد نمایید.";
    }
    elseif($pro_count === 0 )
    {
        $error = "حتما باید وضعیت سفارش کالا را وارد نمایید.";
    }
    

    
  if($error === "" ){
     $pro_name = $conn->qStr($pro_name);
     $sku = $conn->qStr($sku);
     $p_p_mini= $conn->qStr($p_p_mini);
     $p_p_main= $conn->qStr($p_p_main);
     $pro_size = $conn->qStr($pro_size);
     $pro_desc = $conn->qStr($pro_desc);
     $p_s_desc = $conn->qStr($p_s_desc);
     $pro_metakey = $conn->qStr($pro_metakey);
     $pro_attributes = $conn->qStr($pro_attributes);
      
       
        
        $query=" INSERT INTO `shop_product`(`pro_name`, `sku`, `gender`, `pro_status` , `pro_count`, `pro_count_unit`, `pro_weight`, `pro_size`, `Delivery_time`, `stock_status`,`pro_pic_main`, `pro_pic_mini`, `pro_desc`, `pro_short_desc`, `pro_metakey`, `pro_attributes`) VALUES ($pro_name,$sku,$gender,$pro_status,$pro_count,$p_c_unit,$pro_weight,$pro_size,$Delivery_time,$stock_status,$p_p_main,$p_p_mini,$pro_desc,$p_s_desc,$pro_metakey,$pro_attributes)";
        
             echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.catalog.add.php");
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
STemplate::assign('section',"shop");
STemplate::assign('page',"shop_catalog");

STemplate::display('administrator/shop.catalog.add.tpl');
?>