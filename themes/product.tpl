{extends file="main.tpl"} 

 {insert name=get_product value=var  assign=product product_id=$pid status=1}
 {insert name=get_products_list_user value=var limit="4"  assign=products}

$price

{block name="meta"}
	
{/block}


{block name="hear"}
{if $product['pro_cat_pntid'] ne 0}
<li class="active">
	{insert name=get_shop_cat_name value=var  catid=$product['pro_cat_pntid']}	
</li>
{/if}
<li class="active">
	{insert name=get_shop_cat_name value=var  catid=$product['pro_catid']}	
</li>
<li class="active">{$product['pro_name']|stripslashes}</li>
{/block}


{block name="main"}

<div class="card">
	<div class="container-fliud">
		<div class="wrapper row">
			<div class="preview col-md-5">

				<div class="preview-pic tab-content text-center">
				  <div class="tab-pane active"><img id="zoom_01" src="{$baseurl}/images/small.png" data-zoom-image="{$baseurl}/images/big.jpg" class="img-responsive" style="margin-top: 19px;"></div>
				</div>


			</div>
			<div class="details col-md-7">
				<h1 class="product-title">{$product['pro_name']}</h1>

				<div class="product-description">
				{$product['pro_short_desc']|stripslashes}
				</div>
				{insert name=get_product_price value=var  product_id=$pid assign=price}
				<div class="price"> قیمت محصول : <span>{$price|number_format|farsidigit}
				 تومان</span></div>
				<div class="action">
					<button class="add-to-cart btn btn-info" type="button"><i class="fa fa-cart-arrow-down"></i> افزودن به سبد خرید</button>
					<button class="like btn btn-default" type="button"><span class="fa fa-heart"></span></button>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="clearfix"></div>
<div class="product-description-complete container-fliud">
	<div class="wrapper row">
		<div class="col-md-12 col-lg-12">
			{$product['pro_desc']|stripslashes}
		</div>
	</div>
</div>

<div class="panel panel-default">
	<div class="panel-heading"><i class="fa fa-book"></i> محصولات مرتبط</div>
	<div class="panel-body">
	
		<div class="row">
			<div class="col-md-12">
				{if $products eq null}
				<div class="hidden-sm hidden-xs c-items">
						محصول مشابه پیدا نشد.
				</div>
				{else}
				{foreach from=$products  item=prodct }
				{if $prodct['proid'] eq $product['proid']}
				{continue}
				{/if}
				<div class="col-md-3 col-sm-6">
					<span class="thumbnail">
						<img src="http://via.placeholder.com/200x150" alt="..." class="img-responsive" style="border-radius:2px;">
						<h4><s href="#" class="a-p">{$prodct['pro_name']} </a></h4>

						<hr class="line">
						<div class="row">
							<div class="col-md-6 col-sm-6">
								<p class="price">{$prodct['price']|number_format|farsidigit} تومان</p>
							</div>
							<div class="col-md-6 col-sm-6">
							 <a href="http://cookingfoodsworld.blogspot.in/" target="_blank" >	<button class="btn btn-info right" style="font-size: 10px;padding: 4px;"> افزودن سبد خرید</button></a>
							</div>

						</div>
					</span>
				</div>
				{/foreach}
				{/if}
		
				
				
			</div>
		</div>
	</div>

	
</div>
{/block}


{block name="script"}

	<script src='{$baseurl}/js/jquery.elevatezoom.js'></script>
	{literal}
	<script>
		$(document).ready(function(){
			$("#zoom_01").elevateZoom({
				zoomType: "inner",
				cursor: "crosshair",
				zoomWindowFadeIn: 500,
				zoomWindowFadeOut: 750
			});
		});
	</script>
	{/literal}
{/block}
