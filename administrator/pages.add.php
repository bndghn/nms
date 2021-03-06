
<?php

include('../core/config.php');

//check login or not
verify_login_admin();
    
// define var
$error      =   "";
$message    =   "";



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
    } elseif(!verify_slug($slug,"pages")){
		$error = "آدرس دامنه نمی تونه تکراری باشه.";
	}


    if($error === "" ){
       $title = $conn->qStr($title);
       $slug = $conn->qStr($slug);
       $content = $conn->qStr($content);

       $query="INSERT INTO `pages`(`title`, `slug`, `content`, `date`, `pg_status`) VALUES ($title,$slug,$content,'".time()."',$status)";
       if($conn->EXECUTE($query)){
           header("location: ".$config['adminurl']."/pages.php");
       } 
       else{
         $error=$conn->errorMsg(); 
       }
      

    }else{
      
      STemplate::assign('title',$title);
      STemplate::assign('slug',$slug);
      STemplate::assign('content',$content);
      STemplate::assign('status',$status);
      

    }


}
//load nessary template for loading
STemplate::assign('message',$message);
STemplate::assign('error',$error);




STemplate::assign('section',"pages_manager");
STemplate::assign('page',"new_page");


STemplate::display('administrator/pages.add.tpl');