{extends file="administrator/main.tpl"}
       
{block name = "mTitle"} فهرست کاربران{/block}
{block name = "sTitle"}مدیریت کاربران{/block}
{block name = "pTitle"}پروفایل کاربر{/block}
{block name="css"}
<link href="{$assets}/plugins/jstree/themes/default/style.min.css" rel="stylesheet" type="text/css" />     
{/block}
     
{insert name=get_user value=var userid=$userID assign=user}
{block name = "main"}
<div class="col-md-12 col-sm-12">
 <div class="panel panel-default">
   <div class="panel-body">
     <div class="container-fluid">	
      <div class="row" >
       <form  action="{$adminurl}/users.profile.php" method="POST" enctype="multipart/form-data">
        <fieldset>
            <div class="col-md-6 col-sm-6 padding-20">
          
              {if $user['verified'] eq "1"}
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
            {/if}

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
                  <input type="text" name="born_date" value="{$user['born_date']}" class="form-control">
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
                    <select class="form-control select" name="status">
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
                    <input type="text" name="joined" value="{$user['joined']}" class="form-control">
                </div>
                <div class="col-md-6 col-sm-12">
                  <label>آخرین فعالیت</label>
                  <input type="text" name="last_login" value="{$user['last_login']}" class="form-control">
                </div>
              </div>
            </div>
            
             <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                    <label> استان </label>
                    <select class="form-control select" name="state_id">
                    </select>
                </div>
                <div class="col-md-6 col-sm-12">
                    <label> شهرستان </label>
                    <select class="form-control select" name="city_id">
                    </select>
                </div>
                <div class="col-md-12 col-sm-12">
                    <label>  آدرس کاربر </label>
                    <textarea name="" rows="4" placeholder="" class="form-control"></textarea>
                </div>
              </div>
             </div>
            </div>
            
            <div class="col-md-6 col-sm-6 padding-20">    
              <div class="row">
                <div class="form-group">
                  <div class="col-md-12 col-sm-12">
                    <label>سفارشات کاربر</label>
                      <select class="form-control select" name="">
                      
                      </select>
                  </div>

                  <div class="col-md-12 col-sm-12">
                    <label>علاقمندی ها</label>
                      <select class="form-control select" name="">

                      </select>
                  </div>
                </div>
              </div>
            </div>
          </fieldset>
          <div class="row">
            <div class="col-md-4 col-md-offset-4">
              <input type="hidden" name="isSubmit" value="1"/>
              <input type="hidden" name="userid" value="{$user['userid']}"/>
              <button type="submit" class="btn btn-success btn btn-3d btn-teal  btn-block margin-top-30">ویرایش کاربر</button>
            </div>
          </div>
      </form>  
  </div>
  </div> 
  </div> 
 </div>
</div>
{/block}

{block name="script"}

{/block}