<!DOCTYPE html>
<html lang="fa-IR">
	<head>
		<meta charset="utf-8">
		<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<title>{block name="title"} {$site_name} {/block}</title>
		<meta name='description' content='{block name="description"}{$meta_description}{/block}' />
		<meta name="Author" content="ben dehqan" />

		<!-- Css -->
		<link rel="stylesheet" href="font.css">
		<link rel="stylesheet" href="css/font-awesome.min.css">
		<link rel="stylesheet" href="css/animate.min.css">
		<link rel="stylesheet" href="css/jcarousel.connected-carousels.css">
		<link rel="stylesheet" href="assets/css/essentials.css">
		<link rel="stylesheet" type="text/css" href="css/style.css" />
        {block name="css"}{/block}
		 <!-- Java Script -->
		<script src="js/jquery.min.js"></script>
		<script src="js/bootstrap.min.js"></script>
		<script src="js/jquery.jcarousel.min.js"></script>
		<script src="js/jcarousel.connected-carousels.js"></script>
		<script src="js/script.js"></script>
		{block name="script"}{/block}

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body class="mp-main">
		<div class="container top-header">
		
			<div class="col-md-2 col-md-push-10 col-xs-6 s-logo">
				<a href="#" title="logo"><img src="images/header.png" alt=""></a>
			</div>
			
			<div class="col-md-8 hidden-sm hidden-xs">
				<div class="top-menu">
					<ul>
						<li class="text-right"><a href="" title="">خـــــــدمـــــــات ویـــــــــژه</a></li>
						<li><a href="" title="">حمایــت از صنـــایع دســتی گــروه هــای خـاص</a></li>
						<li class="text-left"><a href="" title="">حمــایت از گــروه ارکســتر موسیـــقی به کوش</a></li>
					</ul>
				</div>
				
				<div class="text-center ads-top">
				
				<a href="#">
				<img src="images/ads-top.png" class="gray-hover img-responsive">
				</a>
				
				
				</div>
				
				
			</div>	
			
			<div class="col-md-2 col-md-pull-10 col-xs-6 user-profile">
				<div class="per-img">
					<img src="images/user.png" alt="personal image">
				</div>
				<div class="per-name">
					نام صاحب صفحه
				</div>
				<div class="ex-se">
					<a href="#" title="setting"><img src="images/icon_setting.png" alt=""> تنضیمات</a>&nbsp;
					<a href="#" title="exit"><img src="images/icon_exit.png" alt=""> خروج</a>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="container">
			<div class="main-content" id="single_page">
			

			<div class="content-site">
			
			<!--Breadcrumb-->
			<div class="col-md-12">
				<ol class="breadcrumb">
				<li><a href="#"><i class="fa fa-home"></i> خانه</a></li>
				{block name="hear"}{/block}
				
				
				<div class="pull-left search-top-bar visible-lg visible-md hidden-xs hidden-sm">
				<form action="{$baseurl}/search.php" method="get" class="form-search">
				<input type="text" class="input-search" name="s" placeholder="جستجو در سایت ..." autocomplete="off">
				<button class="input-search-submit text-left"><i class="fa fa-search"></i></button>
				</form>
				</div>
				
			
				</ol>
			</div>
			
			<!--search box in responsive-->
			<div class="col-md-12 hidden-lg hidden-md visible-sm visible-xs">
				
				<div class="search-box-res">
				
				<div class="search-top-bar text-center">
				<form action="http://localhost/scarf" method="get" class="form-search">
				<input type="text" class="input-search" name="s" placeholder="جستجو در سایت ..." autocomplete="off">
				<button class="input-search-submit text-left"><i class="fa fa-search"></i></button>
				</form> 
				<div class="clearfix"></div>  
				</div>
				</div>
				
				</div>
			<div class="clearfix"></div>
			
			{block name="alert"}{/block}
			
			{block name="main"}{/block}
			
			<div class="clearfix"></div>
			
			
			
			
			
			
			
			
			</div>
			<div class="clearfix"></div>
			
	
	<!--footer-->
				<div class="footer">
					<div class="col-md-4 f-r text-right">
						<ul>
							<li><a href="" title="">صفحه اصلی</a></li>
							<li><a href="" title="">درباره ما</a></li>
							<li><a href="" title="">قوانین و شرایط</a></li>
							<li><a href="" title="">تماس با ما</a></li>
						</ul>
					</div>
					<div class="col-md-4 f-m">
						<div class="cr">
						کلیه حقوق مادی و معنوی این سایت محفوظ است.
						</div>
						<div class="cr-en">
						Powered by | Miraspars.com         
						</div>
					</div>
					<div class="col-md-4 f-l">
						<img src="images/footer.png" alt="">
					</div>
				</div>
			</div>			
		</div>
	</body>
</html>