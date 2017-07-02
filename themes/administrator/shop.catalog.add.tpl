<!-- WRAPPER -->
<div id="wrapper" class="clearfix">
    {include file='administrator/aside.tpl'}
    {include file='administrator/top_head.tpl'}
    <section id="middle">
        <!-- page title -->
        <header id="page-header">
            <h1>فروشگاه</h1>
            <ol class="breadcrumb">
                <li><a href="#">محصولات</a></li>
                <li class="active">افزودن محصولات</li>
            </ol>
        </header>
        <!-- /page title -->
        <div id="content" class="padding-20">
         <div class="row">
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
                           توضیحات محصول
                       </a>
                     </li>
                      <li class="">
                       <a href="#jtab3_nobg" data-toggle="tab">
                           مدیریت قیمت 
                       </a>
                     </li>
                   </ul>
                    <form  action="{$adminurl}/shop.catalog.add.php" method="POST" >
                   <div class="tab-content transparent">
                      
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
                                          <label> وضعیت سفارش </label>
                                          <select class="form-control select" name="stock_status" value="">
                                             <option value="0">کالا تولید شده موجود است</option>
                                             <option value="1">انتظار برای تولید کالا</option>
                                             <option value="2">کالا موجود نیست و تولید نمی شود</option>
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
                                          <input type="text" name="pro_size" value="" placeholder="طول * عرض * ارتفاع" class="form-control required">
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
                              <div class="col-md-4">
                                <fieldset>
                                   <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                          <label>دسته بندی محصول</label>

                                          
                                          
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
                                        <label>  توضیحات مختصر  </label>  
                                        <textarea name="pro_short_desc" rows="2" placeholder="توضیحات مختصر درباره کالای مورد نظر وارد شود" class="form-control"></textarea>
                                      </div>
                                    </div>
                                 </div>
                              
                                 <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        <label>  توضیحات کامل </label>  
                                        <textarea name="pro_desc" rows="6" placeholder="توضیحات کامل درباره کالای مورد نظر وارد شود"  class="form-control"></textarea>
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
                              
                              <div class="col-md-6">
                               <fieldset>
                                 <div class="row">
                                    <div class="form-group">
                                      <div class="col-md-12 col-sm-12">
                                        
                                        <img src="https://www.w3schools.com/w3images/fjords.jpg" class="img-thumbnail" alt="Cinque Terre" width="304" height="236">
                                        
                                        </div>
                                    </div>
                                 </div>
                                        
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12">
                                            <label>
                                                تصویر کالا 
                                                <small class="text-muted">- اختیاری</small>
                                            </label>

                                            <!-- custom file upload -->
                                            <div class="fancy-file-upload fancy-file-primary">
                                                <i class="fa fa-upload"></i>
                                                <input type="file" class="form-control" name="contact[attachment]" onchange="jQuery(this).next('input').val(this.value);" />
                                                <input type="text" class="form-control" placeholder="هنوز عکسی انتخاب نشده" readonly="" />
                                                <span class="button">انتخاب فایل</span>
                                            </div>
                                            <small class="text-muted block">حداکثر حجم عکس : 10 مگابایت (jpg/png)</small>

                                        </div>
                                    </div>
                                </div>
                                        
                                        
                                      
                               </fieldset>
                              </div>
                         </div>
                         </div>

                         <div id="jtab3_nobg" class="tab-pane ">
                            3
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
          </div>
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         
         











    </section>
</div>