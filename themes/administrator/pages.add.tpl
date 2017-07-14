{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} مدیریت صفحات{/block}
{block name = "sTitle"} برگه‌ها{/block}
{block name = "pTitle"} برگه جدید{/block}
{block name="css"}
   
{/block}
      
{block name = "main"}
          
           <div class="col-md-12 col-sm-12">
             <div class="panel panel-default">
              <div class="panel-heading">
                <span class="title elipsis">
                    <strong>مشخصات کاربر</strong> <!-- panel title -->
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
                   <form  action="{$adminurl}/pages.add.php" method="POST">
                    <fieldset>
                        <div class="col-md-12 col-sm-12 padding-20">

                          <div class="row">
                            <div class="form-group">
                              <div class="col-md-6 col-sm-6">
                                <label>عنوان </label>
                                <input type="text" name="title" value="" class="form-control" required>
                              </div>
                              <div class="col-md-6 col-sm-6">
                                <label>لینک </label>
                                <div class="row">
                                	
                                		<input type="text" name="slug" value="" placeholder="فقط حروف لاتین" class="form-control text-right col-md-offset-3 col-md-3" required>
                                		 <p class="col-md-5 text-left" dir="ltr">{$baseurl}/page/ </p>
                                </div>
                                
                              </div>
                            </div>
                          </div>
                         
                         <div class="row">
                            <div class="form-group">
                              <div class="col-md-12 col-sm-12">
                                <label>متن</label>
                                <textarea name="content" rows="4" placeholder=" متن را وارد نمایید."  data-height="300" data-lang="fa-IR" class="form-control summernote"></textarea>
                              </div>
                            </div>
                         </div>
                         
                         
                         
                         <div class="row">
                          <div class="form-group">
                           <div class="col-md-12 col-sm-12">
                             <label class="switch switch-success switch-round">
                              <span>وضعیت :</span>
                                <input name="status" type="checkbox" checked="">
                                <span class="switch-label"  data-on="فعال" data-off="غیرفعال"></span>
                             </label>
                           </div>
                          </div>
                         </div>
                         
                        </div>
                        
                        <div class="row">
                          <div class="col-md-8 col-md-offset-2">
                            <input type="hidden" name="isSubmit" value="1"/>
                            <button type="submit" class="btn btn-success btn btn-3d btn-block margin-top-30">ذخیره</button>
                          </div>
                        </div>
                        
                        
                    </fieldset>
                    </form>
             </div>
           </div>
          
{/block}
         



{block name="script"}

{/block}