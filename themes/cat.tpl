{extends file="main.tpl"} 





{block name="meta"}
	
{/block}


{block name="hear"}
{insert name=ishaveChild_shop_cat value=var  catid=$catid assign=isChild}
{if !$isChild}
<li class="active">
	{insert name=get_shop_cat_parent value=var  catid=$catid assign=pntctid}
	{insert name=get_shop_cat_name value=var  catid=$pntctid}
</li>
{/if}
<li class="active">
{insert name=get_shop_cat_name value=var  catid=$catid}
</li>
{/block}


{block name="main"}



<div class="col-md-12">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-book"></i> {insert name=get_shop_cat_name value=var  catid=$catid}</div>
      <div class="panel-body">
     {insert name=get_category_product value=var  assign=products category_id=$catid status=1}

         {if $products eq null}
		محصولی وجود ندارد.
		
		{else}
		
		<div class="row">
		
		{foreach from=$products  item=prodct }
			
			<div class="col-md-4">
            <div class="product-item">
              <div class="pi-img-wrapper">
                <img src="http://keenthemes.com/assets/bootsnipp/k3.jpg" class="img-responsive" style="border-radius:2px;" alt="Berry Lace Dress">
                <div>
                  
                  <a href="{$baseurl}/product/{$prodct['proid']}" class="btn">اطلاعات محصول</a>
                </div>
              </div>
              <h3><a href="{$baseurl}/product/{$prodct['proid']}">{$prodct['pro_name']}</a></h3>
              <div class="pi-price">{$prodct['price']|number_format|farsidigit} <span style="font-size:10px;">تومان</span></div>
              <a href="#" class="btn add2cart">خرید محصول</a>
            </div>
        </div>
        
        {/foreach}
			
		</div>
		{/if}
        
         
      </div>
   </div>
</div>

{/block}