<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error = "";
$message = "";


STemplate::assign('section',"shop");
STemplate::assign('page',"shop_catalog");
  
(isset($_REQUEST['proid']) ? $proid =intval($_REQUEST['proid']) : $proid = 0 );

if($proid === 0){
  
   header("location: ".$config['adminurl']."/shop.catalog.php");
  //echo "wrong in revice proid";

}

(isset($_POST['isSubmit']) ? $isSubmit = intval($_POST['isSubmit']) : $isSubmit = 0);

if ($isSubmit === 1){
  
    (isset($_POST['pro_name']) ? $pro_name = $_POST['pro_name'] : $pro_name = "");
    (isset($_POST['sku']) ? $sku = $_POST['sku'] : $sku = "");
    $gender =intval($_POST['gender']);
    $pro_cat = intval($_POST['pro_cat']);
    (isset($_POST['pro_status']) ? $pro_status = 1 : $pro_status = 0);
    (isset($_POST['pro_count']) ? $pro_count =intval($_POST['pro_count']) : $pro_count = 0);
    $p_c_unit =intval($_POST['pro_count_unit']);
    (isset($_POST['pro_weight']) ? $pro_weight =intval($_POST['pro_weight']) : $pro_weight = 0);
    (isset($_POST['pro_size']) ? $pro_size = $_POST['pro_size'] : $pro_size = "");
    (isset($_POST['Delivery_time']) ? $Delivery_time =intval($_POST['Delivery_time']) : $Delivery_time = 0);
    $stock_status =intval($_POST['stock_status']);
    (isset($_POST['pro_pic_main']) ? $p_p_main = $_POST['pro_pic_main'] : $p_p_main = "");
    (isset($_POST['pro_pic_mini']) ? $p_p_mini = $_POST['pro_pic_mini'] : $p_p_mini = "");
    (isset($_POST['pro_desc']) ? $pro_desc = $_POST['pro_desc'] : $pro_desc = "");
    (isset($_POST['pro_short_desc']) ? $pro_short_desc = $_POST['pro_short_desc'] : $pro_short_desc = "");
    (isset($_POST['pro_metakey']) ? $pro_metakey = $_POST['pro_metakey'] : $pro_metakey = "");
    (isset($_POST['pro_attributes']) ? $pro_attributes = $_POST['pro_attributes'] : $pro_attributes = "");   
     $proid =intval($_POST['proid']);
  
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
    
    elseif($pro_cat === 0){
        $error = "دسته بندی کالا را باید حتما مشخص کنید.";
    }
    

    
  if($error === ""){
     $pro_name = $conn->qStr($pro_name);
     $sku = $conn->qStr($sku);
     $p_p_mini= $conn->qStr($p_p_mini);
     $p_p_main= $conn->qStr($p_p_main);
     $pro_size = $conn->qStr($pro_size);
     $pro_desc = $conn->qStr($pro_desc);
     $pro_short_desc = $conn->qStr($pro_short_desc);
     $pro_metakey = $conn->qStr($pro_metakey);
     $pro_attributes = $conn->qStr($pro_attributes);
     $pro_cat_parent = intval(get_shop_cat_parent($pro_cat));
     
	 if(!$p_p_main === ""){
		 
	 }
       
        
        $query="UPDATE `shop_product` SET `pro_name`=$pro_name, `pro_catid`=$pro_cat, `pro_cat_pntid`=$pro_cat_parent, `sku`=$sku, `gender`=$gender, `date_update`=".time().", `pro_status`=$pro_status, `pro_count`=$pro_count, `pro_count_unit`=$p_c_unit, `pro_weight`=$pro_weight, `pro_size`=$pro_size, `Delivery_time`=$Delivery_time, `stock_status`=$stock_status, `pro_pic_main`=$p_p_main, `pro_pic_mini`=$p_p_mini, `pro_desc`=$pro_desc, `pro_short_desc`=$pro_short_desc, `pro_metakey`=$pro_metakey, `pro_attributes`=$pro_attributes WHERE `proid`=$proid";
        //     echo $query;  
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/shop.catalog.php");
       } 
        else{
           $error = $conn->errorMsg(); 
        }

    }else{
      
        STemplate::assign('pro_name',$pro_name);
        STemplate::assign('sku',$sku);
        STemplate::assign('pro_count',$pro_count);
        STemplate::assign('pro_weight',$pro_weight);
        STemplate::assign('pro_size',$pro_size);
        STemplate::assign('Delivery_time',$Delivery_time);
        STemplate::assign('pro_desc',$pro_desc);
        STemplate::assign('pro_short_desc',$pro_short_desc);
        STemplate::assign('pro_metakey',$pro_metakey);
        STemplate::assign('pro_attributes',$pro_attributes);

       // header("location: ".$config['adminurl']."/shop.catalog.edit.php?tsError=$error");
    }
}


(isset($_POST['isPrice']) ? $isPrice = intval($_POST['isPrice']) : $isPrice = 0);
if($isPrice === 1){
	(isset($_POST['price']) ? $price = intval($_POST['price']) : $price = 0);
	$usrGroup = intval($_POST['category']);
	$productID = intval($_POST['proid']);
	
	/*if(!verifyUserData("number",$price)){
		$message = "فقط قیمت کالا با اعداد لاتین تایپ شود.";
	}*/
	
	if(verify_price($usrGroup, $productID)){
		$query = "INSERT INTO `shop_prodouct_price`(`ppid`,`ugid`,`price`) VALUES ($productID,$usrGroup,$price ) ";
		if($conn->EXECUTE($query)){
			header("location: ".$config['adminurl']."/shop.catalog.edit.php?proid=".$proid."&tab=price");
		}else{
			$error = $conn->errorMsg(); 
		}
	}else{
		$query="UPDATE `shop_prodouct_price` SET `price`=$price WHERE `ppid`=$productID AND `ugid`=$usrGroup ";
		if($conn->EXECUTE($query)){
			header("location: ".$config['adminurl']."/shop.catalog.edit.php?proid=".$proid."&tab=price");
		}else{
			$error = $conn->errorMsg(); 
		}
	}

	
}


//load nessary template for loading
(isset($_GET['tab']) ? $tab =$_GET['tab'] : $tab = "" );
if($tab !=""){
	STemplate::assign('tab',$tab);
}else{
	STemplate::assign('tab',"");
}

STemplate::assign('message',$message);
STemplate::assign('error',$error);
STemplate::assign('proid',$proid);
STemplate::display('administrator/shop.catalog.edit.tpl');
?>