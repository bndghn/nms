{insert name=get_user value=var userid=$userID assign=user}
<div class="container-fluid">
    <div class="row" >	
        <div class="col-md-12 col-sm-12 padding-20">
            <form  action="{$adminurl}/users.edit.php" method="post" enctype="multipart/form-data">
                <fieldset>
                    
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
                                <label>گروه کاربری</label>
                                <select class="form-control select" name="usergroup">
                                       
                                    <option value="0">--نوع کاربری را انتخاب کنید--</option>
                                    {if $user['isCustomer'] eq "1"}
                                          {insert name=get_user_group_list isCustomer="1" value=gvar assign=groupList}
                                            {foreach from=$groupList item=group}
                                                {if $group['status'] eq "0"} 
                                                    {continue} 
                                                {/if} 
                                                <option value="{$group['id']}">{$group['category']}</option>                                               
                                            {/foreach}
                                    {else}
                                        {insert name=get_user_group_list isCustomer="0" value=gvar assign=groupList}
                                        {foreach from=$groupList item=group}
                                            {if $group['status'] eq "0"} 
                                                {continue} 
                                            {/if} 
                                            <option value="{$group['id']}">{$group['category']}</option>                                               
                                        {/foreach}
                                    {/if}

                                </select>
                            </div>
                            
                            <div class="col-md-6 col-sm-6">
                            <label class="switch switch-info switch-round">
                                <span>وضعیت : </span>
                              
                                <span class="switch-label"  data-on="فعال" data-off="غیرفعال"></span>

                            </label>
                        </div>
                            
                        </div>
                    </div>
    



                </fieldset>
                  <div class="row">
                        <div class="col-md-12">
                          <input type="hidden" name="isSubmit" value="1"/>
                          <input type="hidden" name="id" value=""/>
                          <button type="submit" class="btn btn-success btn btn-3d btn-teal  btn-block margin-top-30">ویرایش کاربر</button>
                        </div>
                    </div>





            </form>
   

        </div>
    </div>
 
</div>





