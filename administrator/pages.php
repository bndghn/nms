
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

(isset($_GET['delete']) ? $dltID = intval($_GET['delete']) : $dltID = 0);
if($dltID !=0){
	$query = "DELETE FROM `pages` WHERE `pgid`=$dltID";
	if($conn->EXECUTE($query)){
		$message = "صفحه با موفقیت حذف شد.";
	} 
	else{
		$error=$conn->errorMsg(); 
	}
}

STemplate::assign('section',"pages_manager");
STemplate::assign('page',"pages");


STemplate::display('administrator/pages.tpl');