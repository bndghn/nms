                <div>	
                    <div class="padding-15">
                    
                        <form action="{$adminurl}/users.add.php" method="post" class="form-horizontal margin-bottom-0">   
                             <div class="form-group">
                                 
                                <div class="col-sm-12">
                                  <label>نام کاربری</label>
                                  <input type="text" class="form-control ltr" id="username" placeholder="نام کاربری" name="username">
                                </div>
                              </div>
                            
                             <div class="form-group">
                                
                                <div class="col-sm-12">
                                <label>گروه کاربری</label>
                                 <div class="fancy-form fancy-form-select">
                                   
                                    <select class="form-control select" name="usergroup">
                                       
                                        <option value>--نوع کاربری را انتخاب کنید--</option>
                                        {if $type eq "customer"}
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
                                    <i class="fancy-arrow"></i>
                                  </div>
                                </div>
                              </div>

                             <div class="form-group">
                                
                                <div class="col-sm-12">
                                 <label>شماره همراه</label>
                                
                                  <input type="text" class="form-control ltr" id="" placeholder="شماره همراه" name="mobile">
                                </div>
                              </div>
                        
                              <div class="form-group">
                                 
                                <div class="col-sm-12">
                                 <label>پست الکترونیکی</label>
                                  <input type="text" class="form-control ltr"  placeholder=" پست الکترونیک" name="email">
                                </div>
                              </div> 

                              <div class="form-group margin-bottom-0">
                                <div class=" col-sm-12">
                                <input type="hidden" name="isSubmit" value="1"/>
                                  <button type="submit" class="btn btn-success btn-block">ثبت در سامانه</button>
                                </div>
                              </div>
                        </form>
                    </div>
                </div>
