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
    $pro_cat = intval($_POST['pro_cat']);
    (isset($_POST['pro_status']) ? $pro_status = 1 : $pro_status = 0);
    (isset($_POST['pro_count']) ? $pro_count =intval($_POST['pro_count']) : $pro_count = 0);
    $p_c_unit =intval($_POST['pro_count_unit']);
    (isset($_POST['pro_weight']) ? $pro_weight =intval($_POST['pro_weight']) : $pro_weight = 0);
    (isset($_POST['pro_size']) ? $pro_size = $_POST['pro_size'] : $pro_size = "");
    (isset($_POST['Delivery_time']) ? $Delivery_time =intval($_POST['Delivery_time']) : $Delivery_time = 0);
    $stock_status =intval($_POST['stock_status']);
    (isset($_FILES['pro_pic_main']) ? $p_p_main = $_FILES['pro_pic_main'] : $p_p_main = "null");
    (isset($_FILES['pro_pic_mini']) ? $p_p_mini = $_FILES['pro_pic_mini'] : $p_p_mini = "null");
    (isset($_POST['pro_desc']) ? $pro_desc = $_POST['pro_desc'] : $pro_desc = "");
    (isset($_POST['pro_short_desc']) ? $pro_short_desc = $_POST['pro_short_desc'] : $pro_short_desc = "");
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
    
    elseif($pro_cat === 0){
        $error = "دسته بندی کالا را باید حتما مشخص کنید.";
    }
    

    
  if($error === "" ){
     $pro_name = $conn->qStr($pro_name);
     $sku = $conn->qStr($sku);
     $pro_size = $conn->qStr($pro_size);
     $pro_desc = $conn->qStr($pro_desc);
     $pro_short_desc = $conn->qStr($pro_short_desc);
     $pro_metakey = $conn->qStr($pro_metakey);
     $pro_attributes = $conn->qStr($pro_attributes);
     $pro_cat_parent = intval(get_shop_cat_parent($pro_cat));
      
       
        
        $query=" INSERT INTO `shop_product`(`pro_name`, `pro_catid`,`pro_cat_pntid`, `sku`, `gender`, `pro_status` , `pro_count`, `pro_count_unit`, `pro_weight`, `pro_size`, `Delivery_time`, `stock_status`, `pro_desc`, `pro_short_desc`, `pro_metakey`, `pro_attributes`,`date_created`) VALUES ( $pro_name , $pro_cat , $pro_cat_parent, $sku , $gender , $pro_status , $pro_count , $p_c_unit , $pro_weight , $pro_size , $Delivery_time , $stock_status  , $pro_desc , $pro_short_desc , $pro_metakey , $pro_attributes , '".time()."')";
        
            
       if($conn->EXECUTE($query)){
           $pic_error="";
           if($p_p_main!="null"){
                $pid = $conn->insert_Id();
                $gstop = "1";
               $skip="0";
                $gphoto = $_FILES['pro_pic_main']['tmp_name'];
                if($gphoto != "")
                {
                    $ext = substr(strrchr($_FILES['pro_pic_main']['name'], '.'), 1);
                    $ext2 = strtolower($ext);
                    if($ext2 == "jpeg" || $ext2 == "jpg" || $ext2 == "gif" || $ext2 == "png")
                    {
                        $theimageinfo = getimagesize($gphoto);
                        if($theimageinfo[2] != 1 && $theimageinfo[2] != 2 && $theimageinfo[2] != 3)
                        {
                            $gstop = "1";
                        }
                        else
                        {
                            $gstop = "0";	
                        }
                        
                        if($gstop == "0")
                        {
                            $thepp = "product".$conn->insert_Id();
                            if($theimageinfo[2] == 1)
                            {
                                $thepp .= ".gif";
                            }
                            elseif($theimageinfo[2] == 2)
                            {
                                $thepp .= ".jpg";
                            }
                            elseif($theimageinfo[2] == 3)
                            {
                                $thepp .= ".png";
                            }
                            else
                            {
                                $skip = "1";	
                                echo "khata dar file";
                            }
                            if($skip != "1")
                            {
                                if($pic_error === "")
                                {
                                    $myvideoimgnew=$config['imgproductdir']."/o/".$thepp;
                                    if(file_exists($myvideoimgnew))
                                    {
                                        unlink($myvideoimgnew);
                                    }
                                    move_uploaded_file($gphoto, $myvideoimgnew);
                                    $myvideoimgMain=$config['imgproductdir']."/product/main/".$thepp;
                                    do_resize_image($myvideoimgnew, "1170", "400", false, $myvideoimgMain);
                                    $myvideoimgthumbs=$config['imgproductdir']."/product/thumbs/".$thepp;
                                    do_resize_image($myvideoimgnew, "75", "75", false, $myvideoimgthumbs);
                                    if(file_exists($config['imgproductdir']."/o/".$thepp))
                                    {
                                        $query2 = "UPDATE shop_product SET pro_pic_main='$thepp' WHERE proid='$pid'";
                                        if(!$conn->execute($query2)){
                                             $error=$conn->errorMsg(); 
                                        }
                                    }
                                }
                            }
                        }
                        
                    }
                    
                    
                }
               
           }
           
          header("location: ".$config['adminurl']."/shop.catalog.edit.php?proid=".$pid."&tab=price");
       } 
        else{
           $error=$conn->errorMsg(); 
        }

    }else{
      
        STemplate::assign('pro_name',$pro_name);
        STemplate::assign('sku',$sku);
        STemplate::assign('pro_count',$pro_count);
        STemplate::assign('pro_weight',$pro_weight);
        STemplate::assign('pro_size',$pro_size);
        STemplate::assign('Delivery_time',$Delivery_time);        
        STemplate::assign('stock_status',$stock_status);
        STemplate::assign('pro_desc',$pro_desc);
        STemplate::assign('pro_short_desc',$pro_short_desc);
        STemplate::assign('pro_metakey',$pro_metakey);
        STemplate::assign('pro_attributes',$pro_attributes);
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