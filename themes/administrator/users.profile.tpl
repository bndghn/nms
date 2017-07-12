{extends file="administrator/main.tpl"}
       
{block name = "mTitle"} فهرست کاربران{/block}
{block name = "sTitle"}مدیریت کاربران{/block}
{block name = "pTitle"}پروفایل کاربر{/block}
{block name="css"}
          
{/block}
     
{insert name=get_user value=var userid=$userID assign=user}
{block name = "main"}

<div class="col-md-6 col-sm-6">
 <div class="panel panel-default">
  <div class="panel-heading">
    <span class="title elipsis">
        <strong>مشخصات کاربر</strong> <!-- panel title -->
    </span>
  </div>
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row" >
       <form  action="{$adminurl}/users.profile.php" method="POST" enctype="multipart/form-data">
        <fieldset>
            <div class="col-md-12 col-sm-12 padding-20">
          
              
              <div class="row">
                <div class="form-group">
                  <div class="col-md-6 col-sm-6">
                    <label>نام </label>
                    <input type="text" name="fname" value="{$user['fname']}" class="form-control">
                  </div>
                <div class="col-md-6 col-sm-6">
                  <label>نام خانوادگی</label>
                  <input type="text" name="lname" value="{$user['lname']}" class="form-control">
                </div>
              </div>
            </div>
           

            <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                  <label>پست الکترونیک</label>
                  <input type="email" name="email" value="{$user['email']}" class="form-control">
                </div>
                <div class="col-md-6 col-sm-12">
                  <label>تلفن همراه</label>
                  <input type="text" name="mobile" value="{$user['mobile']}" class="form-control">
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                  <label> جنسیت مشتری </label>
                  <select class="form-control select" name="gender" value="">
                     <option value="0" {if $user['gender'] eq "0"} selected {/if}>آقا</option>
                     <option value="1" {if $user['gender'] eq "1"} selected {/if}>خانم</option>
                  </select>
                </div>
                <div class="col-md-6 col-sm-12">
                  <label>تاریخ تولد</label>
                  <input type="text" name="born_date" placeholder="1300-00-00"  value="{$user['born_date']}" class="form-control">
                </div>
              </div>
            </div>
             
            <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                  <label>گروه کاربری</label>
                  <select class="form-control select" name="usergroup">
                    {insert name=get_user_group_list  value=gvar assign=groupList}
                    {foreach from=$groupList item=group}
                      {if $user['isCustomer'] eq "1"}

                          {if $group['isCustomer'] eq "0"} 
                              {continue} 
                          {/if}

                      {else}
                          {if $group['isCustomer'] eq "1"} 
                              {continue} 
                          {/if}
                      {/if}


                      {if $group['status'] eq "0"} 
                          {continue} 
                      {/if} 
                      <option value="{$group['id']}" {if $user['user_group'] eq $group['id']} selected {/if}>

                          {$group['category']}
                      </option>                                               
                    {/foreach}
                  </select>
                </div>
                <div class="col-md-6 col-sm-12">
                  <label>وضعیت کاربر</label>
                    <select class="form-control select" name="user_status">
                      <option value="1" {if $user['user_status'] eq "1"} selected {/if}>پویا</option>     
                      <option value="0" {if $user['user_status'] eq "0"} selected {/if}>مسدود</option>
                      <option value="2" {if $user['user_status'] eq "2"} selected {/if}>حذف موقت</option>    
                    </select>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                    <label> تاریخ عضویت</label>                                                                      
                    <input type='text' name='joined' value='{$user["joined"]|jdate_format:"%Y/%m/%d"|farsidigit}' class='form-control'>
                </div>
                <div class="col-md-6 col-sm-12">
                  <label>تاریخ آخرین فعالیت</label>
                  <input type='text' name='last_login' value='{$user["last_login"]|jdate_format:"%Y/%m/%d"|farsidigit}' class='form-control'>
                </div>
              </div>
            </div>
            
             <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                    <label> استان </label>
                    {insert name=get_state  value=var assign=addres}
                    
                    <select class="form-control select" name="state_id" id="state">
                     <option value="0" >استان خود را انتخاب کنید</option>
                     
                    {foreach from=$addres item=state}
                    
                    <option value="{$state['id']}" {if $state['id'] eq $user['state_id'] }selected{/if}> {$state['state_name']} </option> 
                    
                     {/foreach}
                    </select>
                    
                </div>
                <div class="col-md-6 col-sm-12">
                    <label> شهرستان </label>
                    {insert name=get_cities  value=var state_id=$user['state_id']  assign=address}
                    
                    <select class="form-control select" name="city_id" id="city">
                    <option value="0" >شهر خود را انتخاب کنید</option>
                     
                      {foreach from=$address item=city}
                      
                     <option value="{$city['id']}" {if $city['id'] eq $user['city_id']} selected {/if}>{$city['city_name']}</option> 
                     
                      {/foreach}
                    </select>
                </div>
                
              </div>
             </div>
             
             <div class="row">
                 <div class="form-group">
                     <div class="col-md-12 col-sm-12">
                        <label> آدرس کاربر </label>
                        <textarea name="user_address" rows="4" placeholder="ادامه آدرس کاربر را وارد نمایید." class="form-control">{$user['user_address']}</textarea>
                     </div>
                 </div>
             </div>
            </div>
          
          
          <div class="row">
            <div class="col-md-4 col-md-offset-4">
              <input type="hidden" name="isSubmit" value="1"/>
              <input type="hidden" name="userid" value="{$user['userid']}"/>
              <button type="submit" class="btn btn-success btn btn-3d btn-block margin-top-30">ویرایش کاربر</button>
            </div>
          </div>
          </fieldset>
        </form>
        </div>
      </div> 
    </div> 
   </div>
  </div>


<div class="col-md-6 col-sm-6">
 <div class="panel panel-default">
  <div class="panel-heading">
    <span class="title elipsis">
        <strong>علاقمندی های کاربر</strong> <!-- panel title -->
    </span>
  </div>
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row">
      <form  action="{$adminurl}/users.profile.php" method="POST">
      <fieldset>
        <div class="col-md-12 col-sm-12 padding-20">    
          <div class="row">
            <div class="form-group">
              <div class="col-md-12 col-sm-12">                           
                  {insert name=get_shop_category_list  value=gvar assign=shop_catalog_cats cat_status=1 parent_id=0 }
                  {if $shop_catalog_cats ne null } 
                  <div class="tree">         
                  <ul>
                  {foreach from=$shop_catalog_cats  item=shop_cate }
                  {insert name=ishaveChild_shop_cat value=var catid=$shop_cate['catid'] assign=ischild}
                    <li>
                      <input type="checkbox" name="fav[]" value="{$shop_cate['catid']}" {if $shop_cate['catid']|in_array:$favs_array} checked {/if}>
                      <label for="tall" class="">{$shop_cate['cat_name']}</label>
                   {if $ischild}
                   {insert name=get_shop_category_list  value=gvar assign=cats_child cat_status=1 parent_id=$shop_cate['catid'] }
                   <ul>
                     {foreach from=$cats_child  item=child }
                         <li>
                           <input type="checkbox" name="fav[]" value="{$child['catid']}" {if $child['catid']|in_array:$favs_array} checked {/if}>
                           <label for="tall-1"> {$child['cat_name']}</label>
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
                <div class="col-md-4 col-md-offset-4">
                  <input type="hidden" name="favSubmit" value="1"/>
                  <input type="hidden" name="userid" value="{$user['userid']}"/>
                  <button type="submit" class="btn btn-success btn btn-3d  btn-block margin-top-30">ذخیره سازی </button>
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
</div>


<div class="col-md-6 col-sm-6">
 <div class="panel panel-default">
  <div class="panel-heading">
    <span class="title elipsis">
        <strong>سفارشات کاربر</strong> <!-- panel title -->
    </span>
  </div>
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row">
      
        <div class="col-md-12 col-sm-12">
          <label>سفارشات کاربر</label>
            <select class="form-control select" name="">

            </select>
        </div>
      
      
       </div>
     </div>
   </div>
 </div>
</div>

<div class="col-md-6 col-sm-6">
 <div class="panel panel-default">
   <div class="panel-heading">
    <span class="title elipsis">
        <strong>رویدادهای کاربر</strong> <!-- panel title -->
    </span>
  </div>
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row">
        <div class="col-md-12 col-sm-12">
            <select class="form-control select" name="">

            </select>
        </div>
      
      </div>
     </div>
   </div>
 </div>
</div>

<div class="col-md-12 col-sm-12">
 <div class="panel panel-default">
   <div class="panel-heading">
    <span class="title elipsis">
        <strong>پیام های کاربر</strong> <!-- panel title -->
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

{literal}
<script>
  $(document).ready(function(){
     $('#state').on('change',function(){
      var stateID = $(this).val();
      if(stateID){
          $.ajax({
              type:'POST',
              url:'{/literal}{$adminurl}{literal}/ajaxCities.php',
              data:'state_id='+stateID+'&cid='+{/literal}{$user['city_id']}{literal},
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
