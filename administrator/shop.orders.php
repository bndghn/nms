<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";
















//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);



STemplate::assign('section',"shop");
STemplate::assign('page',"shop_orders");

STemplate::display('administrator/shop.orders.tpl');

?>