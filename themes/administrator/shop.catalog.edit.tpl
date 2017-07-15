{insert name=product_list value=var proid=$proid assign=pro_edits}

{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} فروشگاه{/block}
{block name = "sTitle"}فهرست محصولات{/block}
{block name = "pTitle"}ویرایش محصول{/block}
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
                  
                  <form  action="{$adminurl}/shop.catalog.edit.php" method="POST" enctype="multipart/form-data">
                   <div class="tab-content transparent">
                      {if $error ne ""}
                        <div class="alert alert-mini alert-danger nomargin noradius noborder">
                            <button class="close" data-dismiss="alert">×</button>
                            <p><strong>خطا! </strong> {$error}</p>
                        </div>
                      {/if}
                     <p class="text-center">لطفا اطلاعات محصول را در فرم زیر به دقت وارد نمایید.</p>
                     
                        <hr/>
                         <div id="jtab1_nobg" class="tab-pane active">
                           
                            <div class="row">
                             
                             
                              <div class="col-md-4">
                               
                               <fieldset>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label> عنوان کالا  </label>
                                          <input type="text" name="pro_name" value="{if $error ne ""}{$pro_name}{else}{$pro_edits['pro_name']}{/if}" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  کد شناسایی کالا  </label>
                                          <input type="text" name="sku" value="{if $error ne ""}{$sku}{else}{$pro_edits['sku']}{/if}" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label> جنسیت مشتری </label>
                                          <select class="form-control select" name="gender" value="">
                                             <option value="0" {if $pro_edits['gender'] eq "0"} selected {/if}>هر دو</option>
                                             <option value="1" {if $pro_edits['gender'] eq "1"} selected {/if}>آقایان</option>
                                             <option value="2" {if $pro_edits['gender'] eq "2"} selected {/if}>بانوان</option>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                 
                                 

                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                         <label class="switch switch-success switch-round">
                                          <span>وضعیت کالا : </span>
                                             {if $pro_edits['pro_status'] eq "1"}
                                                <input name="pro_status" type="checkbox" checked=""> 
                                             {else}
                                                <input name="pro_status" type="checkbox" >
                                             {/if}  
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
                                             <input type="text" name="pro_count" value="{if $error ne ""}{$pro_count}{else}{$pro_edits['pro_count']}{/if}" class="form-control col-md-8">
                                             <select class="form-control select col-md-4" name="pro_count_unit" value="">
                                                <option value="0" {if $pro_edits['pro_count_unit'] eq "0"} selected {/if}>عدد</option>
                                                <option value="1" {if $pro_edits['pro_count_unit'] eq "1"} selected {/if}>جفت</option>
                                                <option value="2" {if $pro_edits['pro_count_unit'] eq "2"} selected {/if}>جین</option>
                                             </select>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  وزن کالا  </label>
                                          <input type="text" name="pro_weight" value="{if $error ne ""}{$pro_weight}{else}{$pro_edits['pro_weight']}{/if}" class="form-control required">
                                       </div>
                                    </div>
                                 </div>
                                 <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  ابعاد کالا  </label>
                                          <input type="text" name="pro_size" value="{if $error ne ""}{$pro_size}{else}{$pro_edits['pro_size']}{/if}" placeholder="ابعاد محصول را وارد نمایید. " class="form-control required">
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
                                                <option value="{$shop_cate['catid']}" class="optionGroup" {if $shop_cate['catid'] eq $pro_edits['pro_catid']} selected {/if} >{$shop_cate['cat_name']}</option>
                                                {if $ischild}
                                                 {insert name=get_shop_category_list  value=gvar assign=cats_child cat_status=1 parent_id=$shop_cate['catid'] }
                                                 
                                                 {foreach from=$cats_child  item=child }
                                                 <option value="{$child['catid']}" class="optionChild" {if $child['catid'] eq $pro_edits['pro_catid']} selected {/if}>← {$child['cat_name']}</option>
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
                                             <option value="0"{if $pro_edits['stock_status'] eq "0"} selected {/if}>عدم ثبت سفارش</option>
                                             <option value="1" {if $pro_edits['stock_status'] eq "1"} selected {/if}>فروش عادی</option>
                                             <option value="2" {if $pro_edits['stock_status'] eq "2"} selected {/if}>ثبت سفارش جهت تولید</option>
                                          </select>
                                       </div>
                                    </div>
                                 </div>
                                  
                                  <div class="row">
                                    <div class="form-group">
                                       <div class="col-md-12 col-sm-12">
                                          <label>  موعد تحویل (بر حسب روز) </label>
                                          <input type="text" name="Delivery_time" value="{if $error ne ""}{$Delivery_time}{else}{$pro_edits['Delivery_time']}{/if}" placeholder="زمان آماده شدن محصول برای تحویل" class="form-control required">
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
                                         <textarea name="pro_short_desc" rows="4" placeholder="{$pro_edits['pro_short_desc']}" class="form-control">{if $error ne ""}{$pro_short_desc}{else}{$pro_edits['pro_short_desc']}{/if}</textarea>
                                       
                                      </div>
                                    </div>
                                 </div>
                                 
                                <div class="row">
                                  <div class="form-group">
                                     <div class="col-md-12 col-sm-12">
                                        <label> کلمات کلیدی - meta Key Words</label>
                                        <input type="text" name="pro_metakey" value="{if $error ne ""}{$pro_metakey}{else}{$pro_edits['pro_metakey']}{/if}" class="form-control required">
                                     </div>
                                  </div>
                                 </div>
                                
                                 
                                 
                                 
                                
                                 
                               </fieldset>
                              </div>
                              
                              <div class="col-md-6">
                               <fieldset>
                                 
                                 {if $pro_edits['pro_pic_main'] ne "null"} 
                                  <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <label>
                                                تصویر اصلی  
                                                
                                            </label>

                                            
                                            <img src="{$imgproduct}/main/{$pro_edits['pro_pic_main']}" width="100%"/>                                        
                                            
                                        </div>
                                    
                                        
                                    </div>
                                
                                 
                                    <div class="form-group">
                                        <div class="col-md-6">
                                            <label>
                                                تصویر کوچک  
                                                
                                            </label>

                                            
                                            <img src="{$imgproduct}/thumbs/{$pro_edits['pro_pic_main']}" width="76px"/>                                        
                                            
                                        </div>
                                    
                                        
                                    </div>
                                </div>
                                {/if}
                                 
                                        
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
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
                                    
                                        
                                    </div>
                                </div>
                                 
                                 <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        <label>  مشخصات ظاهری کالا </label>
                                        <textarea name="pro_attributes" value="{$pro_edits['pro_attributes']}" rows="4" placeholder="{$pro_edits['pro_attributes']}" class="form-control">{if $error ne ""}{$pro_attributes}{else}{$pro_edits['pro_attributes']}{/if}</textarea>
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
                                      
                                        
                                        <textarea rows="7" class="form-control summernote" data-height="300" data-lang="fa-IR" name="pro_desc" value="{$pro_edits['pro_desc']}" placeholder="{$pro_edits['pro_desc']}" >{if $error ne ""}{$pro_desc}{else}{$pro_edits['pro_desc']}{/if}</textarea>
                                        
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
                                    <div class="col-md-6 col-sm-12">
                                       {insert name=get_user_group_list isCustomer="1" value=gvar assign=groupList}
                                       {if $groupList ne null}
                                       
                                        <label> گروه کاربری  </label>
                                        <select class="form-control select" name="category">
                                           <option value="0">-- انتخاب یک گروه کاربری --</option>
                                           {foreach from=$groupList item=group}
                                           <option value="{$group['id']}" class="optionGroup">{$group['category']|stripslashes}</option>
                                           {/foreach}
                                        </select>
                                        {/if}
                                    </div>
                                    <div class="col-md-6 col-sm-12">
                                    <label>قیمت</label>
                                    <input type="text" name="price" value="" class="form-control required">                                    
                                    </div>
                                 </div>
                                </div>
                              </fieldset>
                            </div>
                                <div class="col-md-6">
                                <fieldset>
                                <div class="row">
                                  <div class="form-group">                               
                                    <div class="col-md-12 col-sm-12">
                                    <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                      <thead>
                                        <tr>
                                          <th class="width-150 text-center">گروه کاربری</th>
                                          <th class="width-150 text-center">قیمت محصول</th>
                                          <th class="width-150 text-center">عملیات</th>
                                        </tr>
                                      </thead>
                                      <tbody>
                                        {insert name=get_user_group_list isCustomer="1" value=gvar assign=groupList}
                                        {foreach from=$groupList item=group}
                                        <tr>
                                          <td class="align-middle text-center">{$group['category']|stripslashes} </td>
                                          <td class="align-middle text-center"></td>
                                          <td class="text-center  align-middle">
                                             <a href="{$adminurl}/shop.catalog.edit.php?id={$['']}" data-target="#Edit{$['']}" data-toggle="modal" class="btn btn-default btn-xs "><i class="fa fa-edit white"></i> ویرایش </a>

                                             <a href="{$adminurl}/shop.catalog.php?delete={$['']}"  class="btn btn-danger btn-xs " onclick="{literal} return confirm('آیا از حذف این دسته بندی مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                          </td>
                                        </tr>
                                        {/foreach}
                                      </tbody>
                                    </table>
                                    </div>
                                  </div>
                                </div>
                        
                              </fieldset>
                            </div>
                           </div>
                        
                         
                         <hr/>
                         
                     

                    </div>
                    <div class="row">
                          <div class="col-md-4 col-md-offset-4">
                            <input type="hidden" name="isSubmit" value="1"/>
                            <input type="hidden" name="proid" value="{$pro_edits['proid']}"/>
                            <button type="submit" class="btn btn-success  btn-lg btn-block margin-top-20 ">
                              ویرایش کالا
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