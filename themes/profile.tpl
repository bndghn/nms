{extends file="main.tpl"} 

{block name="hear"}
<li class="active">تکمیل پروفایل</li>
{/block}

{insert name=get_user value=var userid=$uid assign=user}
{insert name=get_verify_user_step value=var  assign=verify}
{block name="main"}

<div class="col-md-4 {if $verify ne "0"}hideme{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-user"></i> مشخصات فردی</div>
      <div class="panel-body">
        
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
                          <div class="col-md-12 col-sm-12">
                             <label>پست الکترونیک</label>
                             <input type="email" name="email" value="{$user['email']}" class="form-control">
                          </div>
                       </div>
                    </div>
                    <div class="row">
                       <div class="form-group">
                          <div class="col-md-12 col-sm-12">
                             <label>تلفن همراه</label>
                             <input type="text" name="mobile" value="{$user['mobile']}" class="form-control">
                          </div>
                       </div>
                    </div>
                    
                    <div class="row">
                      <div class="form-group">
                        <div class="col-md-6 col-sm-12">
                          <label> جنسیت  </label>
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
                             <label> استان </label>
                             {insert name=get_state  value=var assign=addres}
                             <select class="form-control select" name="state_id" id="state">
                                <option value="0" >انتخاب استان</option>
                                {foreach from=$addres item=state}
                                <option value="{$state['id']}" {if $state['id'] eq $user['state_id'] }selected{/if}> {$state['state_name']} </option> 
                                {/foreach}
                             </select>
                          </div>
                          <div class="col-md-6 col-sm-12">
                             <label> شهرستان </label>
                             {insert name=get_cities  value=var state_id=$user['state_id']  assign=address}
                             <select class="form-control select" name="city_id" id="city">
                                <option value="0" >انتخاب شهر</option>
                                {foreach from=$address item=city}
                                <option value="{$city['id']}" {if $city['id'] eq $user['city_id']} selected {/if}>{$city['city_name']}</option> 
                                {/foreach}
                             </select>
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

<div class="col-md-4 {if $verify ne "1"}hideme{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-heart"></i> علاقه‌مندی‌ها</div>
      <div class="panel-body">
         <p align="justify">دسته‌بندی کالاهایی که به آن علاقه‌مند هستید را انتخاب کنید تا فقط کالاهای موردعلاقه‌تان به شما ییشنهاد شود.</p>
         
         <div class="row">
          <form  action="{$adminurl}/users.profile.php" method="POST" class="margin-bottom-0">
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
                    <div class="col-md-12">
                      <input type="hidden" name="favSubmit" value="1"/>
                      <input type="hidden" name="userid" value="{$user['userid']}"/>
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

<div class="col-md-4 {if $verify ne "2"}hideme{/if}">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-bell"></i> یادآوری‌ها</div>
      <div class="panel-body">
         متن بلوک
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
              url:'{/literal}{$adminurl}{literal}/ajaxCities.php',{/literal}{if $user['city_id'] eq ""} {literal}
              data:'state_id='+stateID,{/literal}{else} {literal}
              data:'state_id='+stateID+'&cid='+{/literal}{$user['city_id']}{literal},{/literal}{/if}
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