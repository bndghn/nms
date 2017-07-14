
<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";

(isset($_REQUEST['id']) ? $pgid = intval($_REQUEST['id']) : $pgid = 0);


//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);

if($pgid != 0){
	STemplate::assign('pgid',$pgid);
}else{
	header("location: ".$config['adminurl']."/nms/pages.php");
}

(isset($_POST['isSubmit']) ? $submit = intval($_POST['isSubmit']) : $submit = 0);

if ($submit === 1){
    (isset($_POST['title']) ? $title = $_POST['title'] : $title = "");
    (isset($_POST['slug']) ? $slug = $_POST['slug'] : $slug = "");
    (isset($_POST['content']) ? $content = $_POST['content'] : $content = "");
    (isset($_POST['status']) ? $status = 1 : $status = 0);
    if($title === "" )
    {
        $error = "حتما باید عنوان را وارد نمایید.";
    } 
    elseif($content === "" )
    {
        $error = "حتما باید متن را وارد نمایید.";
    } elseif($slug === "" )
    {
        $error = "حتما باید متن را وارد نمایید.";
    } elseif(!verify_slug($slug,"pages","pgid",$pgid)){
		$error = "آدرس دامنه نمی تونه تکراری باشه.";
	}


    if($error === "" ){
       $title = $conn->qStr($title);
       $slug = $conn->qStr($slug);
       $content = $conn->qStr($content);

       $query="UPDATE `pages` SET `title` = $title, `slug`=$slug, `content` =$content,  `pg_status` = $status WHERE `pgid`=$pgid ";
       if($conn->EXECUTE($query)){
           //header("location: ".$config['adminurl']."/pages.php");
       } 
       else{
         $error=$conn->errorMsg(); 
       }
      
    }


}


STemplate::assign('section',"pages_manager");
STemplate::assign('page',"pages");
STemplate::assign('error',$error);
STemplate::assign('page',$message);


STemplate::display('administrator/pages.edit.tpl');