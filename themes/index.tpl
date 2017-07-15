<!DOCTYPE html>
<html lang="fa-IR">
	<head>
		<meta charset="utf-8">
		<!--[if IE]><meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"><![endif]-->
		<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
		<title>{block name="title"} {$site_name} {/block}</title>
		<meta name='description' content='{block name="description"}{$meta_description}{/block}' />
		<!-- Css -->
		<link rel="stylesheet" href="{$baseurl}/font.css">
		<link rel="stylesheet" href="{$baseurl}/css/font-awesome.min.css">
		<link rel="stylesheet" href="{$baseurl}/css/animate.min.css">
		<link rel="stylesheet" href="{$baseurl}/css/jcarousel.connected-carousels.css">
		<link rel="stylesheet" href="{$baseurl}/assets/css/essentials.css">
		<link rel="stylesheet" type="text/css" href="{$baseurl}/css/style.css" />

		 <!-- Java Script -->
		<script src="{$baseurl}/js/jquery.min.js"></script>
		<script src="{$baseurl}/js/bootstrap.min.js"></script>
		<script src="{$baseurl}/js/jquery.jcarousel.min.js"></script>
		<script src="{$baseurl}/js/jcarousel.connected-carousels.js"></script>
		<script src="{$baseurl}/js/script.js"></script>
		

		<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
		<!--[if lt IE 9]>
		  <script src="{$baseurl}/https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
		  <script src="{$baseurl}/https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
	</head>
	<body class="mp-main">
		<div class="container top-header">
		
			<div class="col-md-2 col-md-push-10 col-xs-6 s-logo">
				<a href="{$baseurl}" title="logo"><img src="{$baseurl}/images/header.png" alt=""></a>
			</div>
			
			<div class="col-md-8 hidden-sm hidden-xs">
				<div class="top-menu">
					<ul>
						<li class="text-right"><a href="{$baseurl}/page/services" target="_blank" title="">خـــــــدمـــــــات ویـــــــــژه</a></li>
						<li><a href="{$baseurl}/page/support_handicrafts" target="_blank" title="">حمایــت از صنـــایع دســتی گــروه هــای خـاص</a></li>
						<li class="text-left"><a href="{$baseurl}/page/support_behkosh" target="_blank">حمــایت از گــروه ارکســتر موسیـــقی به کوش</a></li>
					</ul>
				</div>
				
				{insert name=get_products_list_user value=var  assign=products}
				{if $products eq null}
				<div class="hidden-sm hidden-xs c-items">
				
				</div>
				{else}
				<div class="hidden-sm hidden-xs c-items">
					<div class="slideshow2">
						<div class="connected-carousels">
							<div class="navigation col-md-12">
								<a href="#" class="prev prev-navigation"><i class="fa fa-chevron-left"></i></a>
								<a href="#" class="next next-navigation"><i class="fa fa-chevron-right"></i></a>
								<div class="carousel carousel-navigation">
									<ul id="jc">
									{foreach from=$products  item=product }
										
										<li>
											{if $product['pro_pic_main'] eq "null"}
												<img src="{$baseurl}/images/thumb.png" alt=""><div class="arrow-down"></div>
											{else}
												<img src="{$baseurl}/images/products/product/thumbs/{$product['pro_pic_main']}" alt="">
												<div class="arrow-down"></div>
											{/if}
										</li>
										
										
									{/foreach}
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				{/if}
			</div>	
			
			<div class="col-md-2 col-md-pull-10 col-xs-6 user-profile">
				<div class="per-img">
					<img src="{$baseurl}/images/user.png" alt="personal image">
				</div>
				<div class="per-name">
					{if $smarty.session.verified eq 1}{$smarty.session.USR_FNAME} {$smarty.session.USR_LNAME}{else} کاربر تایید نشده{/if}
				</div>
				<div class="ex-se">
					<a href="{$baseurl}/setting" title="setting"><img src="{$baseurl}/images/icon_setting.png" alt=""> تنضیمات</a>&nbsp;
					<a href="{$baseurl}/logout" title="exit"><img src="{$baseurl}/images/icon_exit.png" alt=""> خروج</a>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
		
		<div class="container">
			<div class="main-content">
			{if $products eq null}
				
				
			{else}
				<div class="main-content-header">
					<div class="col-md-4 onvan">
						<span>عنوان کالا</span>&nbsp; | <span id="product_name">{$products[0]['pro_name']}</span> 
					</div>
					<div class="col-md-4 tedad">
						<span>تعداد کالا</span>&nbsp; | <span id="product_num">{$products[0]['pro_count']|farsidigit}</span> 
					</div>
					<div class="col-md-4 pishnahad">
					<span id="product_pishnahad">
					{random in=0 out=30 assign=firstRand}
						تا کنون این کالا به {$firstRand|farsidigit} نفر پیشنهاد شده
						</span>
						
					</div>
					<div class="clearfix"></div>
				</div>
			{/if}
				{if $products eq null}
				
				<p class="text-center bold size-20 padding-30">محصولی برای نمایش وجود ندارد.</p>
				
				{else}
				
				<div class="slideshow2">
					<div class="connected-carousels">
						<div class="col-xs-12 stage">
							<div class="carousel carousel-stage">
								<ul id="big_slide">
									{foreach from=$products  item=slide }
									{if $slide['pro_pic_main'] eq "null"}
									<li data-name="{$slide['pro_name']}" data-num="{$slide['pro_count']|farsidigit}" data-pishnahad="{$firstRand|farsidigit}" data-link="{$baseurl}/product/{$slide['proid']}" data-link-card="{$baseurl}/order/{$slide['proid']}"><img src="{$baseurl}/images/big.png" alt="" class="img-responsive"></li>
									{else}
									<li data-name="{$slide['pro_name']}" data-num="{$slide['pro_count']|farsidigit}" data-pishnahad="{0|rand:30|farsidigit}" data-link="{$baseurl}/product/{$slide['proid']}" data-link-card="{$baseurl}/order/{$slide['proid']}"><img src="{$baseurl}/images/products/product/main/{$slide['pro_pic_main']}" alt="" class="img-responsive"></li>
									{/if}
									{/foreach}
									
								</ul>
							</div>
						  
							<a href="#" class="prev prev-stage" id="prev_carousel_a"><i class="fa fa-chevron-left"></i></a>
							<a href="#" class="next next-stage" id="next_carousel_a"><i class="fa fa-chevron-right"></i></a>
						</div>
					</div>
				</div>	
				
				{/if}
				<div class="clearfix"></div>
				
				{if $products eq null}
				
				
				
				{else}

				<div class="main-content-footer">
					<div class="col-md-6 col-offset-md-4 col-sm-8 col-sm-offset-2 col-xs-10 col-xs-offset-1 pop animated flipInY" id="product_description">
						{foreach from=$products  item=data name=detail }
						<!--description slide 1-->
						<div data-slide="{$smarty.foreach.detail.iteration}">
							<div class="col-md-6 col-sm-6 pop-r">
								<div class="pop-item">
									<i class="fa fa-stop fa-2x"></i><span class="pop-shenas">شناسنامه کالا</span>
								</div>
								<div class="pop-item">
									<i class="fa fa-stop fa-lg"></i><span class="pop-matn">عنوان کالا&nbsp;|</span><span class="pop-matn2">
										{$data['pro_name']|stripslashes}
									</span>
								</div>
								<div class="pop-item">
									<i class="fa fa-stop fa-lg"></i><span class="pop-matn">کد شناسایی کالا&nbsp;|</span><span class="pop-matn2">{$data['sku']|stripslashes|farsidigit}</span>
								</div>
								<div class="pop-item">
									<i class="fa fa-stop fa-lg"></i><span class="pop-matn">تعداد تولید شده&nbsp;|</span><span class="pop-matn2">
									{$data['pro_count']|stripslashes|farsidigit}
									</span>
								</div>
								<div class="pop-img">
								{if $data['pro_pic_main'] eq "null"}
									<img src="{$baseurl}/images/pop.png" alt="" class="img-responsive">
								{else}
									<img src="{$baseurl}/images/products/product/thumbs/{$data['pro_pic_main']}" alt="" class="img-responsive">
								{/if}
								</div>
							</div>
							<div class="col-md-6 col-sm-6 pop-l">
								<div class="pop-detail">
									<i class="fa fa-stop fa-lg"></i><span class="pop-matn">توضیحات در مورد کالا&nbsp;</span>
									<p>
										{$data['pro_short_desc']|stripslashes}
									</p>
								</div>
							</div>
						</div>
						
						{/foreach}
						

					</div>
					<ul class="yy">
						<li class="cont hidden-sm hidden-xs" data-nowproduct="1"><span class="arrow-up"></span><a href="#" title=""><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAATCAYAAACHrr18AAACAElEQVRIib3WTagNcRjH8c+c67WukKJLurJlYcXmXLIhNSkrLxvZWpIF4jmTWJCNBcrbxsvKRrNgoSuNBaVw7chLlJWXonDRWJxRjHPORff61fSv3/83z7eZZ/5Pk5RlKcuy5diDfvSZGH3DBxyKiDtJq9Uawl5si4hXEwQFWZYN4BwONrAPWyYaChVjC/Y1MBoRb7qFk7zoS/JiMMmL/nGCv8FoA196QDfgOZ7hVZIXa8YDji+NHtCNuIwFeIkH2DhOYJO6QOfhJJLKynALv7Uky7LVOPpTtpOuRsTuMcHYiVm4jRlYVKbN012yL3FjDPC9uvEbOMmLPmzFWwzhOjYnedEq0+bXej4iHmFHD2hHderxUszFdMzEJSzGpr8t3kudXvX8ap2GgTJtnkjyYgm243w9nGXZOhzXnkzbcApTq+2bEbH1T8HDOIB7ZdocqbxdeJHkxZwybb6u5R/iDL5ipAL/OPN3O0E7gsu0+Qn7a97HJC+eYiHq4He4r922VXiMJxExooe6fdW/KMmLKRjQHiZ1pbhY8+5gRa+avQZIf7XO0u7hsTJtvq3nIuISZteulb2gtJ94cpe9wSQvlmEQF8q0OdytSES8GwtU0+Sk1WoNY31EvP/Lm/9JWZbNwJUGDuNsZfwP6FkcTqo/kLXaR2YUnyeIOxVTcCQirn0Hlyeh/fL5I8IAAAAASUVORK5CYII=" alt="" class="ma"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAATCAYAAACHrr18AAAAm0lEQVRIib2WQQ7AIAgEF+P/v0xPNsWgoAVIvBjNCLuKxMwAwKgN6hOUkoGDxa0QKhhtnlCCPyMM3oxFMyzMCztwquF6ANS7Vsi5Apsb/4YGXmXAC/jVgSxzpYWn1IS9jpbGakWsjOdNYU7XMl7peArdau/VOPxOex4Qq4lcudoyl7dzHcMHWLujWd2KAVnqis/Ay+iQjq36idADTfAfMfsOJC4AAAAASUVORK5CYII=" alt="" class="ho">شناسنامه</a></li>
						<li class="link_product hidden-lg hidden-md visible-sm visible-xs"><a href="#" title="" id="product_link"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAATCAYAAACHrr18AAACAElEQVRIib3WTagNcRjH8c+c67WukKJLurJlYcXmXLIhNSkrLxvZWpIF4jmTWJCNBcrbxsvKRrNgoSuNBaVw7chLlJWXonDRWJxRjHPORff61fSv3/83z7eZZ/5Pk5RlKcuy5diDfvSZGH3DBxyKiDtJq9Uawl5si4hXEwQFWZYN4BwONrAPWyYaChVjC/Y1MBoRb7qFk7zoS/JiMMmL/nGCv8FoA196QDfgOZ7hVZIXa8YDji+NHtCNuIwFeIkH2DhOYJO6QOfhJJLKynALv7Uky7LVOPpTtpOuRsTuMcHYiVm4jRlYVKbN012yL3FjDPC9uvEbOMmLPmzFWwzhOjYnedEq0+bXej4iHmFHD2hHderxUszFdMzEJSzGpr8t3kudXvX8ap2GgTJtnkjyYgm243w9nGXZOhzXnkzbcApTq+2bEbH1T8HDOIB7ZdocqbxdeJHkxZwybb6u5R/iDL5ipAL/OPN3O0E7gsu0+Qn7a97HJC+eYiHq4He4r922VXiMJxExooe6fdW/KMmLKRjQHiZ1pbhY8+5gRa+avQZIf7XO0u7hsTJtvq3nIuISZteulb2gtJ94cpe9wSQvlmEQF8q0OdytSES8GwtU0+Sk1WoNY31EvP/Lm/9JWZbNwJUGDuNsZfwP6FkcTqo/kLXaR2YUnyeIOxVTcCQirn0Hlyeh/fL5I8IAAAAASUVORK5CYII=" alt="" class="ma"><img src="{$baseurl}/data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB4AAAATCAYAAACHrr18AAAAm0lEQVRIib2WQQ7AIAgEF+P/v0xPNsWgoAVIvBjNCLuKxMwAwKgN6hOUkoGDxa0QKhhtnlCCPyMM3oxFMyzMCztwquF6ANS7Vsi5Apsb/4YGXmXAC/jVgSxzpYWn1IS9jpbGakWsjOdNYU7XMl7peArdau/VOPxOex4Qq4lcudoyl7dzHcMHWLujWd2KAVnqis/Ay+iQjq36idADTfAfMfsOJC4AAAAASUVORK5CYII=" alt="" class="ho">شناسنامه</a></li>
						<li><a href="{$baseurl}/order/{$products['0']['proid']}" title="" id="link_card"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAVCAYAAAC6wOViAAACHklEQVRIib3VT4hOYRTH8c8100wWLEUpf8tGJCnlJhSD7kJYsLCSZkFZWVjomceKRimlyMKflEJKvYVRCneBhfJnwWJKxEJkQjI0Hov3HV4vM/POGH6re885z/k+57nPOTfr6uqahN1o8VPPcDaEMOAfqBWf0Iu2OvtaLMf2fwHNUkq/GWOME2obWRRC6Psv0Br4BPrweBx539DTOkzANezHx3GETkHncNAedIcQ4ngRY4zzcWzI460F3cSuEMKjrFIex5oxsL5hZSry5zHG/egbrlK4gnV4lIq8cwzARm3CmglNQDvGASbGuBBvQwgvR6r0IWbHGCeFED5klbIbm0fB+oJlqcjfYAvOUx0OQyqEkGKMN7AKl1OR78GeUUDrtRErYaTjpdo668YIAjHGxXgRQnjFCJXWdB0HBl+ySnkSK5pYl7A6FXkvtuLCjxzDtUzdTm+rts6DJmCNa9vwBEtDCK9prlI4iIsxxnMY7Z+nA+cHgTRZKcQY52EpvG9rb5/8pb9/qNjPLa2tmZTaBwYG0BtCKOv9TUMhq5SzcAmT8RYbUpG/aojZh07VSXQoFfmRxjzN3N56daM7FfkcHFN3wWrAxSgwFwuwM6uUM/4WOh13as/3MK3BP1V1ZH5ORd6HpzXbL2r2Ig3qDE5nlfI0duBog/8WDmeVci8mYibuNyYZ1TeFrFKuxxLcTUV+9Q/+adiGrziVivxdY8x3pku899VWNuQAAAAASUVORK5CYII=" alt="" class="ma"><img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAB0AAAAVCAYAAAC6wOViAAAApklEQVRIicVTSRLAIAiDjv//Mj3VUVBZRJuLU6ySxIBERDAHLvbCeE5cqqHAWA01a7raMqkja5yK3+zVkGkvaU0/iwl6u6Oo5C1KxaFd3HzTzym0Kt21uHNJa8obpVh8y95qLYAvSPwCK4Q71jltR8drsSDpVbozq5Ws9U13A+RKLz84UsoJ8X8E4Wh6Z8pHpETt1MgsAxcZGQA9UMt9r1LOXvse1l6d+RxGH0usUwAAAABJRU5ErkJggg==" alt="" class="ho">سفارش</a></li>
					</ul>
					<div class="clearfix"></div>
				</div>
				{/if}
				
				<div class="footer">
					<div class="col-md-4 f-r text-right">
						<ul>
							<li><a href="{$baseurl}" title="">صفحه اصلی</a></li>
							<li><a href="{$baseurl}/page/about_us" title="">درباره ما</a></li>
							<li><a href="{$baseurl}/page/terms" title="">قوانین و شرایط</a></li>
							<li><a href="{$baseurl}/connectus" title="">تماس با ما</a></li>
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
						<img src="{$baseurl}/images/footer.png" alt="">
					</div>
				</div>
			</div>			
		</div>
	</body>
</html>