{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} فروشگاه{/block}
{block name = "sTitle"} محصولات{/block}
{block name = "pTitle"} محصول جدید{/block}
{block name="css"}
   
{/block}
      
{block name = "main"}
          
           <div class="col-md-6 col-sm-12">
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
                   <form  action="{$adminurl}/pages.php" method="POST">
                    <fieldset>
                        <div class="col-md-12 col-sm-12 padding-20">

                          <div class="row">
                            <div class="form-group">
                              <div class="col-md-6 col-sm-6">
                                <label>عنوان </label>
                                <input type="text" name="title" value="" class="form-control">
                              </div>
                              <div class="col-md-6 col-sm-6">
                                <label>لینک </label>
                                <input type="text" name="slug" value="" class="form-control">
                              </div>
                            </div>
                          </div>
                         
                         <div class="row">
                            <div class="form-group">
                              <div class="col-md-12 col-sm-6">
                                <label>درباره ما</label>
                                <textarea name="content" rows="4" placeholder=" متن را وارد نمایید." class="form-control"></textarea>
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
                            <input type="hidden" name="" value=""/>
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