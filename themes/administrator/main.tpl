<!doctype html>

<html lang="fa-IR">
	<head>
		<meta charset="utf-8" />
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title>{$site_name}</title>
		<meta name="description" content="" />
		<meta name="Author" content="ben dehqan" />

		<!-- mobile settings -->
		<meta name="viewport" content="width=device-width"{$basedir}/themes" maximum-scale=1, initial-scale=1, user-scalable=0" />

		<!-- WEB FONTS -->
		

		<!-- CORE CSS -->
		<link href="{$assets}/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
		
		<!-- THEME CSS -->
		<link href="{$assets}/css/essentials.css" rel="stylesheet" type="text/css" />
		<link href="{$assets}/css/layout.css" rel="stylesheet" type="text/css" />
        <link href="{$assets}/plugins/bootstrap/RTL/bootstrap-rtl.min.css" rel="stylesheet" type="text/css" />
        <link href="{$assets}/plugins/bootstrap/RTL/bootstrap-flipped.min.css" rel="stylesheet" type="text/css" />
        <link href="{$assets}/css/layout-RTL.css" rel="stylesheet" type="text/css" />
		<link href="{$assets}/css/color_scheme/green.css" rel="stylesheet" type="text/css" id="color_scheme" />
		{block "css"}{/block}

	</head>
	<!--
		.boxed = boxed version
	-->
	<body>
	
	
	
	
	
	
	
	
	<!-- WRAPPER -->
<div id="wrapper" class="clearfix">
    {include file='administrator/aside.tpl'}
    {include file='administrator/top_head.tpl'}
    
    <section id="middle">
        <!-- page title -->
        <header id="page-header">
            <h1>{block "mTitle"} فروشگاه {/block}</h1>
            <ol class="breadcrumb">
                <li><a href="#">{block "sTitle"} عنوان اول {/block}</a></li>
                <li class="active">{block "pTitle"} عنوان صفحه {/block}</li>
            </ol>
        </header>
        <!-- /page title -->


        <div id="content" class="padding-20">

            <div class="row">

            
            {block "main"}{/block}
            
      
            </div>

        </div>
    </section>
</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
<!-- JAVASCRIPT FILES -->
        {literal}
		<script type="text/javascript">var plugin_path = '{/literal}{$assets}{literal}/plugins/';</script>
		<script type="text/javascript" src="{/literal}{$assets}{literal}/plugins/jquery/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="{/literal}{$assets}{literal}/js/app.js"></script>
        {/literal}
        {if isset($tsError)}
          {literal}
           <script type="text/javascript">
               _toastr({/literal}"{$tsError}"{literal},"top-full-width","error",false);
           </script>
           {/literal}
        {/if}
        
        {block "script"}{/block}
        
       
	</body>
</html>