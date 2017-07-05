{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} فروشگاه{/block}
{block name = "sTitle"}فهرست محصولات{/block}
{block name = "pTitle"}افزودن محصول جدید{/block}
{block name="css"}
<link href="{$assets}/plugins/jstree/themes/default/style.min.css" rel="stylesheet" type="text/css" />     
{/block}
      
{block name = "main"}
          
           <div class="col-md-12 col-sm-12">
             <div class="panel panel-default">
               <div class="panel-body">
                 <div class="tabs nomargin">
                   <!-- tabs -->
                   <ul class="nav nav-tabs nav-justified">
                     <li class="active">
                       <a href="#jtab1_nobg" data-toggle="tab">
                           مشخصات اولیه 
                       </a>
                     </li>
                     <li class="">
                       <a href="#jtab2_nobg" data-toggle="tab">
                           توضیحات و تصاویر محصول
                       </a>
                     </li>
                      <li class="">
                       <a href="#jtab3_nobg" data-toggle="tab">
                           مدیریت قیمت 
                       </a>
                     </li>
                   </ul>
                    <form  action="{$adminurl}/shop.catalog.add.php" method="POST" enctype="multipart/form-data">
                   <div class="tab-content transparent">
                     <p class="text-center">لطفا اطلاعات محصول را در فرم زیر به دقت وارد نمایید.</p>
                       {if $error ne ""}
                          <div class="alert alert-mini alert-danger nomargin noradius noborder">
                              <button class="close" data-dismiss="alert">×</button>
                              <p><strong>خطا! </strong> {$error}</p>
                          </div>
                       {/if}
                        <hr/>
                         <div id="jtab1_nobg" class="tab-pane active">
                           
                            <div class="row">
                             
                             
                              <div class="col-md-4">
                               
                               <fieldset>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label> عنوان کالا  </label>
                                          <input type="text" name="pro_name" value="" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  کد شناسایی کالا  </label>
                                          <input type="text" name="sku" value="" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label> جنسیت مشتری </label>
                                          <select class="form-control select" name="gender" value="">
                                             <option value="0">هر دو</option>
                                             <option value="1">آقایان</option>
                                             <option value="2">بانوان</option>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 

                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                         <label class="switch switch-success switch-round">
                                          <span>وضعیت کالا : </span>
                                          <input name="pro_status" type="checkbox" checked="">
                                          <span class="switch-label"  data-on="فعال" data-off="غیرفعال"></span>
                                         </label>
                                       </div>
                                    </div>
                                 </div>
                              </fieldset>
                               
                              </div>
                              <div class="col-md-4">
                                
                                
                                <fieldset>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12">
                                          <label>  موجودی انبار  </label>
                                          <div class="">
                                             <input type="text" name="pro_count" value="0" class="form-control col-md-8">
                                             <select class="form-control select col-md-4" name="pro_count_unit" value="">
                                                <option value="0">عدد</option>
                                                <option value="1">جفت</option>
                                                <option value="2">جین</option>
                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  وزن کالا  </label>
                                          <input type="text" name="pro_weight" value="0" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  ابعاد کالا  </label>
                                          <input type="text" name="pro_size" value="" placeholder="ابعاد محصول را وارد نمایید. " class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 
                              </fieldset>
                                
                                
                              </div>
                              <div class="col-md-4">
                                <fieldset>
                                   <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                          <label>دسته بندی محصول</label>
                                          {insert name=get_shop_category_list  value=gvar assign=shop_catalog_cats cat_status=1 parent_id=0 }
                                          {if $shop_catalog_cats ne null }
                                          
                                          
                                            <select name="pro_cat" class="form-control select">
                                                <option value="0">-- انتخاب یک دسته بندی </option>
                                            {foreach from=$shop_catalog_cats  item=shop_cate }
                                                {insert name=ishaveChild_shop_cat value=var catid=$shop_cate['catid'] assign=ischild}
                                                <option value="{$shop_cate['catid']}" class="optionGroup">{$shop_cate['cat_name']}</option>
                                                {if $ischild}
                                                 {insert name=get_shop_category_list  value=gvar assign=cats_child cat_status=1 parent_id=$shop_cate['catid'] }
                                                 
                                                 {foreach from=$cats_child  item=child }
                                                 <option value="{$child['catid']}" class="optionChild">← {$child['cat_name']}</option>
                                                 {/foreach}
                                                 
                                                {/if}
                                            
                                            {/foreach}
                                            </select>
                                         
                                           {/if}            
                                          
                                          
                                       </div>                                
                                    </div>
                                   </div>
                                   
                                  
                                  <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label> وضعیت سفارش </label>
                                          <select class="form-control select" name="stock_status" value="">
                                             <option value="0">عدم ثبت سفارش</option>
                                             <option value="1">فروش عادی</option>
                                             <option value="2">ثبت سفارش جهت تولید</option>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                  
                                  <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  موعد تحویل (بر حسب روز) </label>
                                          <input type="text" name="Delivery_time" value="" placeholder="زمان آماده شدن محصول برای تحویل" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                  
                                </fieldset>
                              </div>
                            </div>
                         </div>

                         <div id="jtab2_nobg" class="tab-pane ">
                            <div class="row">
                              <div class="col-md-6">
                               <fieldset>
                                
                                 
                                <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        <label> توضیحات مختصر  - meta Description</label>  
                                         <textarea name="pro_short_desc" rows="4" placeholder="توضیحات مختصر درباره کالای مورد نظر وارد شود" class="form-control"></textarea>
                                       
                                      </div>
                                    </div>
                                 </div>
                                 
                                <div class="row">
                                  <div class="form-group">
                                     <div class="col-md-12 col-sm-12">
                                        <label> کلمات کلیدی - meta Key Words</label>
                                        <input type="text" name="pro_metakey" value="" class="form-control required">
                                     </div>
                                  </div>
                                 </div>
                                
                                 
                                 
                                 
                                
                                 
                               </fieldset>
                              </div>
                              
                              <div class="col-md-6">
                               <fieldset>
                                 
                                 
                                 
                                 
                                        
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <label>
                                                تصویر اصلی  
                                                <small class="text-muted">- اجباری</small>
                                            </label>

                                            <!-- custom file upload -->
                                            <div class="fancy-file-upload fancy-file-primary">
                                                <i class="fa fa-upload"></i>
                                                <input type="file" class="form-control" name="pro_pic_main" onchange="jQuery(this).next('input').val(this.value);" />
                                                <input type="text" class="form-control" placeholder="" readonly="" />
                                                <span class="button">انتخاب فایل</span>
                                            </div>
                                           

                                        </div>
                                    
                                
                                   
                                 
                                    
                                        <div class="col-md-6">
                                            <label>
                                                 تصویر بندانگشتی  
                                                <small class="text-muted">- اختیاری</small>
                                            </label>

                                            <!-- custom file upload -->
                                            <div class="fancy-file-upload fancy-file-primary">
                                                <i class="fa fa-upload"></i>
                                                <input type="file" class="form-control" name="pro_pic_mini" onchange="jQuery(this).next('input').val(this.value);" />
                                                <input type="text" class="form-control" placeholder="" readonly="" />
                                                <span class="button">انتخاب فایل</span>
                                            </div>
                                            

                                        </div>
                                    </div>
                                </div>
                                 
                                 <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        <label>  مشخصات ظاهری کالا </label>
                                        <textarea name="pro_attributes" rows="4" placeholder="مشخصات ظاهری کالای مورد نظر وارد شود" class="form-control"></textarea>
                                      </div>
                                    </div>
                                 </div>
                                        
                                        
                                      
                               </fieldset>
                              </div>
                              
                              <div class="col-md-12">
                                
                                 <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        <label>  توضیحات کامل </label>  
                                      
                                        
                                        <textarea rows="7" class="form-control summernote" data-height="300" data-lang="fa-IR" name="pro_desc" placeholder="توضیحات کامل درباره کالای مورد نظر وارد شود" ></textarea>
                                        
                                      </div>
                                    </div>
                                 </div>
                                
                              </div>
                         </div>
                         </div>

                         <div id="jtab3_nobg" class="tab-pane ">
                           <div class="row">
                            <div class="col-md-6">
                              <fieldset>
                       
                                <div class="row">
                                  <div class="form-group">
                                     <div class="col-md-12 col-sm-12">
                                        <label>  بهای کالا برای مشتریان طلایی </label>
                                        <input type="text" name="price" value="" placeholder="بهای کالا برای مشتریان طلایی در این قسمت وارد شود" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                
                                 <div class="row">
                                  <div class="form-group">
                                     <div class="col-md-12 col-sm-12">
                                        <label>  بهای کالا برای مشتریان نقره ای </label>
                                        <input type="text" name="price" value="" placeholder="بهای کالا برای مشتریان نقره ای در این قسمت وارد شود" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                
                                 <div class="row">
                                  <div class="form-group">
                                     <div class="col-md-12 col-sm-12">
                                        <label>  بهای کالا برای مشتریان برنزی </label>
                                        <input type="text" name="price" value="" placeholder="بهای کالا برای مشتریان برنزی در این قسمت وارد شود" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 
                                 
                              
                              
                              
                              
                              
                              </fieldset>
                            </div>
                           </div>
                         </div>
                         
                         <hr/>
                         <div class="row">
                          <div class="col-md-4 col-md-offset-4">
                            <input type="hidden" name="isSubmit" value="1"/>
                            <button type="submit" class="btn btn-success  btn-lg btn-block margin-top-20 ">
                              افزودن کالا
                            </button>
                          </div>
                        </div>
                     

                  </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
          
{/block}
         



{block name="script"}

{/block}