{extends file="main.tpl"} 





{block name="meta"}
	
{/block}


{block name="hear"}
<li class="active">سفارشات</li>
{/block}


{block name="main"}



<div class="col-md-12">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-book"></i> سفارشات</div>
      <div class="panel-body">
     

        
         
         <div class="row">
			<div class="col-xs-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>نام محصول</th>
							<th>تعداد</th>
							<th class="text-center">قیمت هر واحد</th>
							<th class="text-center">قیمت کل</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>

						{if isset($smarty.session.cart_products) && $smarty.session.cart_products|@count gt 0}
						{$total = 0}
						{foreach from=$smarty.session.cart_products  item=product }
						<tr>
							<td class="col-sm-7 col-md-5">
							<div class="media">
								<a class="thumbnail pull-right" href="#"> <img class="media-object" src="http://icons.iconarchive.com/icons/custom-icon-design/flatastic-2/72/product-icon.png" style="width: 72px; height: 72px;"> </a>
								<div class="media-body" style="padding-top:10px;">
									<h4 class="media-heading mahsol-name"><a href="#">{$product["product_name"]}</a></h4>
									<h5 class="media-heading">
										<a href="#" style="font-size: 10px;">
											{insert name=get_shop_cat_name value=var  catid=$product["product_cat"]}
										</a>
									</h5>
									<span style="font-size: 10px;">وضعیت : </span>
										{if $product["product_status"] eq 1}
										<span class="text-success"><strong style="font-size: 10px;">
											موجود در انبار و آماده ارسال
										</strong></span>
										{elseif $product["product_status"] eq 0 }
											
										<span class="text-warning"><strong style="font-size: 10px;">
											ناموجود در انبار
										</strong></span>
										{else}
											<span class="text-success"><strong style="font-size: 10px;">
											تولید پس از ثبت سفارش
											</strong></span>
										{/if}
									
								</div>
							</div></td>
							<td class="col-sm-1 col-md-1" style="text-align: center">
								<input type="text" class="form-control" style="color: #9b9b9b;margin-top: 26px; width:70%; display:inline-block" id="exampleInputEmail1" value="{$product['product_qty']}">
								<a href="@" title="Refresh Cardt"><i class="fa  fa-refresh"></i></a>
							</td>
							<td class="col-sm-1 col-md-1 text-center">
								<span style="margin-top: 35px;display: block;font-size: 14px;">
									{$product['product_price']|number_format|farsidigit} ت
								</span>
							</td>
							<td class="col-sm-1 col-md-2 text-center">
								<span style="margin-top: 35px; display: block; font-size: 14px;">
								{$subTotal = $product['product_price'] * $product['product_qty']}
								{$subTotal|number_format|farsidigit} ت
								</span>
							</td>
							<td class="col-sm-1 col-md-1">
							<button type="button" class="btn btn-danger" style="margin-top: 30px;">
								<span class="fa fa-remove"></span> حذف
							</button></td>
						</tr>
						
						{$total = $total + $subTotal}
						{/foreach}
						


						<tr>
							<td>   </td>
							<td>   </td>
							<td>   </td>
							<td><h5>جمع اقلام</h5></td>
							<td class="text-right"><h5><strong>{$total|number_format|farsidigit} ت</strong></h5></td>
						</tr>
						<tr>
							<td>   </td>
							<td>   </td>
							<td>   </td>
							<td><h5>هزینه تحویل </h5></td>
							<td class="text-right"><h5><strong>رایگان</strong></h5></td>
						</tr>
						<tr>
							<td>   </td>
							<td>   </td>
							<td>   </td>
							<td><h3 style="font-size:14px;margin-top: 15px;">مبلغ قابل پرداخت</h3></td>
							<td class="text-right"><h3 style="font-size:14px;margin-top: 15px;"><strong>{$total|number_format|farsidigit} ت</strong></h3></td>
						</tr>
						<tr>
							<td>   </td>
							<td>   </td>
							<td>   </td>
							<td>
							<button type="button" class="btn btn-default">
								<span class="fa fa-shopping-cart"></span> ادامه خرید
							</button></td>
							<td>
							<button type="button" class="btn btn-success">
								صدور پیش‌فاکتور <span class="fa fa-file-text-o"></span>
							</button></td>
						</tr>
						{else}
						<tr>
							<td colspan="5">محصولی در سبد خرید وجود ندارد.</td>
						</tr>
						{/if}
					</tbody>
				</table>
			</div>
		</div>
        
         
      </div>
   </div>
</div>

{/block}