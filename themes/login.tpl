<!DOCTYPE html>
<html lang="fa-IR" dir="rtl">
	<head>
		<meta charset="utf-8">
		<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<title>{$site_name}</title>
		<meta name='description' content='{block name="description"}{$meta_description}{/block}' />
		<meta name="Author" content="ben dehqan" />

		<!-- Css -->
		<link rel="stylesheet" href="font.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/animate.min.css">
		<link rel="stylesheet" type="text/css" href="css/style.css" />

		 <!-- Java Script -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/script.js"></script>
		

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body>    
      <div class="col-sm-4 col-sm-offset-4 col-xs-8 col-xs-offset-2">
       <a href="#" title="#">
       <img src="images/logo.png" alt="logo" class="img-responsive mp-logo">	
       </a>
       <div class="width-form">
          <div class="panel panel-default">
            {if $error ne ""}
             <div class="panel-body">
                <i class="fa  fa-exclamation-triangle"></i> 
                {$error}
             </div>
            {/if}
          </div>
          <form class="mp-form" method="POST" action="{$baseurl}/login.php">
             <input type="text" class="form-control" name="username" placeholder="نام کاربری خود را وارد نمایید" required> 
             <input type="password" class="form-control" name="password" placeholder="کلمه عبور خود را وارد نمایید" required>	
             <input hidden="hidden" name="login" value="1"/>				
             <button type="submit" class="btn btn-primary col-xs-12 effect" value="">ورود</button>                          
             <a href="#" title="">کلمه عبور را فراموش کرده ام.</a>
          </form>
       </div>
    </div>
    </body>
</html>