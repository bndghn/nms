{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} مدیریت صفحات{/block}
{block name = "sTitle"} برگه‌ها{/block}
{block name = "pTitle"} ویرایش برگه{/block}
{block name="css"}
   
{/block}
      {insert name=get_page  assign=page page_id=$pgid}
{block name = "main"}
          
           <div class="col-md-12 col-sm-12">
             <div class="panel panel-default">
              <div class="panel-heading">
                <span class="title elipsis">
                    <strong>ویرایش برگه </strong> <!-- panel title -->
                </span>
              </div>
               <div class="panel-body">
                    {if $error ne ""}
                    <div class="alert alert-mini alert-danger nomargin noradius noborder">
                        <button class="close" data-dismiss="alert">×</button>
                        <p><strong>خطا! </strong> {$error}</p>
                    </div>
                    {/if}
                 <div class="container-fluid">	
                  <div class="row" >
                   <form  action="{$adminurl}/pages.edit.php" method="POST">
                    <fieldset>
                        <div class="col-md-12 col-sm-12 padding-20">

                          <div class="row">
                            <div class="form-group">
                              <div class="col-md-6 col-sm-6">
                                <label>عنوان </label>
                                <input type="text" name="title" value="{if $error ne ""}{$title}{else}{$page['title']|stripslashes}{/if}" class="form-control">
                              </div>
                              <div class="col-md-6 col-sm-6">
                                <label>لینک </label>
                                <div class="row">
                                	
                                		<input type="text" name="slug" value="{if $error ne ""}{$slug}{else}{$page['slug']|stripslashes}{/if}" class="form-control text-right col-md-offset-2 col-md-4">
                                		 <p class="col-md-5 text-left" dir="ltr">{$baseurl}/page/ </p>
                                </div>
                                
                              </div>
                            </div>
                          </div>
                         
                         <div class="row">
                            <div class="form-group">
                              <div class="col-md-12 col-sm-6">
                                <label>متن</label>
                                <textarea name="content" rows="4" placeholder=" متن را وارد نمایید."  data-height="300" data-lang="fa-IR" class="form-control summernote">{if $error ne ""}{$content}{else}{$page['content']|stripslashes}{/if}</textarea>
                              </div>
                            </div>
                         </div>
                         
                         
                         
                         <div class="row">
                          <div class="form-group">
                           <div class="col-md-12 col-sm-12">
                             <label class="switch switch-success switch-round">
                              <span>وضعیت :</span>
                                {if $page['pg_status'] eq "1"}
                                <input name="status" type="checkbox" checked="">
                                {else}
                                <input name="status" type="checkbox">
                                {/if}
                                <span class="switch-label"  data-on="فعال" data-off="غیرفعال"></span>
                             </label>
                           </div>
                          </div>
                         </div>
                         
                        </div>
                        
                        <div class="row">
                          <div class="col-md-8 col-md-offset-2">
                            <input type="hidden" name="isSubmit" value="1"/>
                            <input type="hidden" name="id" value="{$page['pgid']}"/>
                            <button type="submit" class="btn btn-success btn btn-3d btn-block margin-top-30">اعمال تغییرات</button>
                          </div>
                        </div>
                        
                        
                    </fieldset>
                    </form>
             </div>
           </div>
          
{/block}
         



{block name="script"}

{/block}