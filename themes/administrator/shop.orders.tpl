{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} فروشگاه{/block}
{block name = "sTitle"}محصولات{/block}
{block name = "pTitle"}فهرست سفارش ها{/block}

{block name="css"}
          
{/block}
     
{insert name=get_user value=var userid=$userID assign=user}
{block name = "main"}
            
       
<div class="col-md-12 col-sm-12">
 <div class="panel panel-default">
   <div class="panel-heading">
    <span class="title elipsis">
        <strong>سفارش های کاربر</strong> <!-- panel title -->
    </span>
   </div>
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row">
        <div class="col-md-12 col-sm-12">
         
        </div>
      </div>
     </div>
   </div>
 </div>
</div>





{/block}

{block name="script"}

{/block}