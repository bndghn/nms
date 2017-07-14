{extends file="main.tpl"} 

{block name="css"}
		<link rel="stylesheet" href="{$baseurl}/css/jquery.Bootstrap-PersianDateTimePicker.css" />
{/block}


{insert name=get_verify_user_step value=var  assign=verify}
{block name="hear"}
<li class="active">تکمیل پروفایل</li>
{/block}

{block name="alert"}
	{if $error ne ""}
	<div class="col-md-12">
		 <div class="alert alert-danger">
			<i class="fa  fa-exclamation-triangle"></i> 
			<strong>ای بابا!</strong> {$error}
		 </div>
	</div>
	{/if}
	{if $message ne ""}
	<div class="col-md-12">
		 <div class="alert alert-success">
			{if $verify ne '0' or $verify ne '1'}
		 	<a href="profile.php?action=verify" class="btn btn-xs btn-success pull-left">
				
				<span>تایید عضویت</span>
			</a>
		 	{/if}
			<i class="fa  fa-check-circle"></i> 
			<strong>ای ول!</strong> {$message}
		 </div>
	</div>
	{/if}
{/block}

{insert name=get_user value=var userid=$uid assign=user}
{block name="main"}




<div class="col-md-4 {if $verify ne '0'}hideme hidden-sm hidden-xs{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-user"></i> مشخصات فردی</div>
      <div class="panel-body">
        
        <div class="row" >
           <form  action="{$baseurl}/profile.php" method="POST" enctype="multipart/form-data">
              <fieldset>
                 <div class="col-md-12 col-sm-12 padding-20">
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-6 col-sm-6">
                             <label>نام </label>
                             <input type="text" name="fname" value="{if isset($fname)}{$fname}{else}{$user['fname']}{/if}" class="form-control" required>
                          </div>
                          <div class="col-md-6 col-sm-6">
                             <label>نام خانوادگی</label>
                             <input type="text" name="lname" value="{if isset($lname)}{$lname}{else}{$user['lname']}{/if}" class="form-control" required>
                          </div>
                       </div>
                    </div>
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-12 col-sm-12">
                             <label>پست الکترونیک</label>
                             <input type="email" name="email" value="{if isset($email)}{$email}{else} {$user['email']}{/if}" class="form-control ltr">
                          </div>
                       </div>
                    </div>
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-12 col-sm-12">
                             <label>تلفن همراه</label>
                             <input type="text" name="mobile" value="{if isset($mobile)}{$mobile}{else}{$user['mobile']}{/if}" class="form-control ltr" required>
                          </div>
                       </div>
                    </div>
                    
                    <div class="row">
                      <div class="form-group">
                        <div class="col-md-6 col-sm-12">
                          <label> جنسیت  </label>
                          <select class="form-control select" name="gender">
                            {if isset($gender)}
                             <option value="0" {if $gender eq "0"} selected {/if}>آقا</option>
                             <option value="1" {if $gender eq "1"} selected {/if}>خانم</option>
                             {else}
                             <option value="0" {if $user['gender'] eq "0"} selected {/if}>آقا</option>
                             <option value="1" {if $user['gender'] eq "1"} selected {/if}>خانم</option>
                             {/if}
                          </select>
                        </div>
                        <div class="col-md-6 col-sm-12">
                          <label>تاریخ تولد</label>
                          <input type='text' name='born_date' value='{if isset($brnDate)}{$brnDate}{else}{$user["born_date"]|jdate_format:"%Y/%m/%d"|farsidigit}{/if}' class='form-control' id='brndate' data-targetselector='#brndate'  data-mddatetimepicker='true'  data-placement='top' >
                        </div>
                      </div>
                    </div>
                    
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-6 col-sm-12">
                             <label> استان </label>
                             {insert name=get_state  value=var assign=addres}
                             <select class="form-control select" name="state_id" id="state">
                                <option value="0" >انتخاب استان</option>
                                
									{foreach from=$addres item=state}
										{if !isset($usrState)}
											<option value="{$state['id']}" {if $state['id'] eq $user['state_id'] }selected{/if}> {$state['state_name']} </option> 
										{else}
                              				<option value="{$state['id']}" {if $state['id'] eq $usrState }selected{/if}> {$state['state_name']} </option> 
                              			{/if}
                               		{/foreach}
                             </select>
                          </div>
                          <div class="col-md-6 col-sm-12">
                             <label> شهرستان </label>
                             {if !isset($usrState)}
                             	{insert name=get_cities  value=var state_id=$user['state_id']  assign=cities}
                             {else}
                             	{insert name=get_cities  value=var state_id=$usrState  assign=cities}
                             {/if}
                             	
                            
                             <select class="form-control select" name="city_id" id="city">
                                <option value="0" >انتخاب شهر</option>
                                {foreach from=$cities item=city}
                                {if isset($usrCity)}
                                <option value="{$city['id']}" {if $city['id'] eq $usrCity} selected {/if}>{$city['city_name']}</option>
                                {else}
                                <option value="{$city['id']}" {if $city['id'] eq $user['city_id']} selected {/if}>{$city['city_name']}</option> 
                                {/if}
                                {/foreach}
                             </select>
                          </div>
                       </div>
                    </div>
                    <div class="row">
                    <div class="col-md-12">
                      <input type="hidden" name="step1" value="1"/>
                      <button type="submit" class="btn btn-success btn  btn-block margin-top-10">ثبت مشخصات فردی </button>
                    </div>
                  </div>
                    
                    
                 </div>
              </fieldset>
           </form>
        </div>
        
      </div>
   </div>
</div>

<div class="col-md-4 {if $verify ne '1'}hideme hidden-sm hidden-xs{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-heart"></i> علاقه‌مندی‌ها</div>
      <div class="panel-body">
         <p>دسته‌بندی کالاهایی که به آن علاقه‌مند هستید را انتخاب کنید تا فقط کالاهای موردعلاقه‌تان به شما ییشنهاد شود.</p>
         
         <div class="row">
          <form  action="{$baseurl}/profile.php" method="POST" class="margin-bottom-0">
          <fieldset>
            <div class="col-md-12 col-sm-12 padding-20">    
              <div class="row">
                <div class="c">
                  <div class="col-md-12 col-sm-12">                           
                      {insert name=get_shop_category_list  value=gvar assign=shop_catalog_cats cat_status=1 parent_id=0 }
                      {if $shop_catalog_cats ne null } 
                      <div class="tree">         
                      <ul>
                      {foreach from=$shop_catalog_cats  item=shop_cate }
                      {insert name=ishaveChild_shop_cat value=var catid=$shop_cate['catid'] assign=ischild}
                        <li>
                          <input type="checkbox" name="fav[]" value="{$shop_cate['catid']}" {if $shop_cate['catid']|in_array:$favs_array} checked {/if}>
                          <label>{$shop_cate['cat_name']}</label>
                       {if $ischild}
                       {insert name=get_shop_category_list  value=gvar assign=cats_child cat_status=1 parent_id=$shop_cate['catid'] }
                       <ul>
                         {foreach from=$cats_child  item=child }
                             <li>
                               <input type="checkbox" name="fav[]" value="{$child['catid']}" {if $child['catid']|in_array:$favs_array} checked {/if}>
                               <label> {$child['cat_name']}</label>
                             </li>
                         {/foreach}
                       </ul>
                       </li>
                       {/if}
                       {/foreach}
                       </ul>
                    </div>
                     {/if}
                  </div>
                  <div class="row">
                    <div class="col-md-12">
                      <input type="hidden" name="step2" value="1"/>
                      <button type="submit" class="btn btn-success btn  btn-block margin-top-10">ثبت علاقه‌مندی‌ها </button>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            </fieldset>
            </form>
           </div>
         
      </div>
   </div>
</div>

<div class="col-md-4 {if $verify ne '2'}hideme hidden-sm hidden-xs{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-bell"></i> یادآوری‌ها</div>
      <div class="panel-body">
         
         <div class="row" >
           <form  action="{$baseurl}/profile.php" method="POST" enctype="multipart/form-data">
              <fieldset>
                 <div class="col-md-12 col-sm-12 padding-20">
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-6 col-sm-12">
							  <label> مناسبت  </label>
							  <select class="form-control select" name="type">

								 <option value="0">سالروز تولد</option>
								 <option value="1">سالگرد ازدواج </option>
								 <option value="2">مناسبت‌های دیگر</option>

							  </select>
                          </div>
                          <div class="col-md-6 col-sm-12">
                          <label>تاریخ</label>
                          <input type='text' name='date' value='{$smarty.now|jdate_format:"%Y/%m/%d"|farsidigit}' class='form-control' id='evntDate' data-targetselector='#evntDate'  data-mddatetimepicker='true'  data-placement='bottom' >
                        </div>
                       </div>
                    </div>
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-12 col-sm-12">
                             <label>موضوع مناسبت</label>
                             <input type="text" name="title" placeholder="مثلا تولد علی" autocomplete="off" class="form-control" required>
                          </div>
                       </div>
                    </div>
                    
                   
                    
                    
                    <div class="row">
                    <div class="col-md-12">
                      <input type="hidden" name="step3" value="1"/>
                      <input type="hidden" name="edit" value="0"/>
                      <input type="hidden" name="eid" value="0"/>
                      <button type="submit" class="btn btn-success btn  btn-block margin-top-10">اضافه کردن مناسبت</button>
                    </div>
                  </div>
                    
                    
                 </div>
              </fieldset>
           </form>
        </div>
        <div class="row">
        	<div class="table-responsive padding-6">
        		<table class="table table-striped table-bordered table-hover col-md-12" id="tbl_events">
					<thead>
						<tr>
							<th class="text-center">مناسبت</th>
							<th class="text-center">تاریخ</th>
							<th class="text-center">موضوع</th>
							<th class="text-center">عملیات</th>
						</tr>
					</thead>
					<tbody>
						{insert name=get_list_event value=var assign=events}
						{if $events eq null}
						<tr>
						  <td colspan="4"><p class="text-center">یه مناسبت زودتر وارد کن! چطوره با تاریخ تولد خودت شروع کنی؟!</p></td>
						</tr>
						{else}
						{foreach from=$events item=event}
						<tr class="odd gradeX">
						  <td class="align-middle text-center">
							{if $event['event_type'] eq "0"}سالروز تولد {elseif $event['event_type'] eq "1"}سالگرد ازدواج {elseif $event['event_type'] eq "2"} مناسبت‌های دیگه{/if}
						  </td>
						  <td class="align-middle text-center">
							{$event['event_date']|jdate_format:"%Y/%m/%d"|farsidigit}
						  </td>
						  <td class="align-middle text-center">
							{$event['event_title']|stripslashes}
						  </td>
						  <td class="text-center  align-middle">
							<a href="{$baseurl}/profile.php?action=delete&eid={$event['event_id']}" onclick="{literal} return confirm('آیا از حذف این مناسبت مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> حذف </a>
							
						  </td>
						</tr>
						{/foreach}
						
						
						{/if}
					</tbody>
				</table>
			</div>
        </div>
         
      </div>
   </div>
</div>





{/block}
{block name="script"}
		<script src="js/jalaali.js" type="text/javascript"></script>
		<script src="js/jquery.Bootstrap-PersianDateTimePicker.js" type="text/javascript"></script>
{literal}
<script>
  $(document).ready(function(){
     $('#state').on('change',function(){
      var stateID = $(this).val();
      if(stateID){
          $.ajax({
              type:'POST',
              url:'{/literal}{$adminurl}{literal}/ajaxCities.php',{/literal}{if $user['city_id'] eq ""} {literal}
              data:{state_id:stateID},{/literal}{else} {literal}
              data:{state_id:stateID,cid:{/literal}{$user['city_id']}{literal}},{/literal}{/if}
            {literal}
              success:function(html){
                  $('#city').html(html);
              }
          }); 
       // alert(stateID);
      }else{
         /* $('#city').html('<option value="">Select state first</option>');*/
          
      }

  });
});
</script>
{/literal}

{/block}