<?php

include ('core/config.php');
if($config['public'] === "0"){
   verify_login();
}

(isset($_SESSION['USR_ID']) ? $usrID = $_SESSION['USR_ID'] : $usrID = "");


(isset($_GET['orderid']) ? $oid = $_GET['orderid'] : $oid = "");
if($oid === ""){
	//header("location: ".$config['baseurl']);
	//echo "not fount pid in php file";
}else{
	$new_product['pid'] = $oid;
	$product_price  = get_prices($oid);
	$product_detail = get_product($oid,1);
	
	echo $product_detail['pro_name']."-".$product_price["price"];
	
	if( $product_price !=0 AND $product_detail !=0){
		
		$new_product["product_name"] = $product_detail['pro_name'];
		$new_product["product_cat"] = $product_detail['pro_catid'];
		$new_product["product_status"] = $product_detail['stock_status'];
		$new_product["product_price"] = $product_price;
		$new_product["product_qty"] = 1;
		
		if(isset($_SESSION["cart_products"])){  //if session var already exist
			if(isset($_SESSION["cart_products"][$new_product['pid']])) //check item exist in products array
			{
				$new_product["product_qty"] = $_SESSION["cart_products"][$new_product['pid']]["product_qty"]+1;
				unset($_SESSION["cart_products"][$new_product['pid']]); //unset old array item
				
			}
			
		}
		$_SESSION["cart_products"][$new_product['pid']] = $new_product; //update or create product session with new item  
		header("location: ".$config['baseurl']."/order");
		
	}else{
		unset($_SESSION["cart_products"][$new_product['pid']]); //unset old array item
		header("location: ".$config['baseurl']."/order");
	}
	
	
	
	
    
	
	
	
	
	STemplate::assign('oid',$oid);
	STemplate::assign('name',$product_detail['pro_name']);
	
}






STemplate::display('order.tpl');
?>
