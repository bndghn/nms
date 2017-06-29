<!-- WRAPPER -->
		<div id="wrapper" class="clearfix">

			{include file='administrator/aside.tpl'}
			{include file='administrator/top_head.tpl'}
            
            <section id="middle">


				<!-- page title -->
				<header id="page-header">
					<h1>فروشگاه</h1>
					<ol class="breadcrumb">
						<li><a href="#">کالا</a></li>
						<li class="active">دسته بندی کالاها</li>
					</ol>
				</header>
				<!-- /page title -->


				<div id="content" class="padding-20">
                    
                    <div class="row">

						<div class="col-md-6">
                    
					<div id="panel-2" class="panel panel-default">
						<div class="panel-heading">
							<span class="title elipsis">
								<strong>افزودن دسته بندی کالا </strong> <!-- panel title -->
							</span>

							

						</div>
                      
                       
                        
        <!-- panel content -->
                    <div class="panel-body">

                        {if $error ne ""}
                        <div class="alert alert-mini alert-danger nomargin noradius noborder">
                            <button class="close" data-dismiss="alert">×</button>
                            <p><strong>خطا! </strong> {$error}</p>
                        </div>
                        {/if}
                        <form  action="{$adminurl}/shop.categories.php" method="post" >
                            <fieldset>
                                <!-- required [php action request] -->
                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label> نام دسته  *</label>
                                            <input type="text" name="catname" value="" class="form-control required">
                                        </div>

                                    </div>
                                </div>



                            <div class="row">
                                <div class="form-group">
                                  
                                   
                                    
                                  <div class="col-md-6 col-sm-6">
                                      <label> دسته مادر *</label>    
                                   
                                       <div class="fancy-form fancy-form-select">
                                       
                                        <select class="form-control select" name="pntid" value="{$shop_cat['catid']}">
                                          <option value="0">هیچکدام</option>
                                           {insert name=get_shop_category_list  value=gvar assign=shop_add_cats cat_status=1 parent_id=0 }
                                           {if $shop_add_cats ne null }
                                           {foreach from=$shop_add_cats  item=shop_cat_add }
                                              
                                              <option value="{$shop_cat_add['catid']}"> {$shop_cat_add['cat_name']}</option>
                                              
                                               
                                            {/foreach}
                                            
                                           {/if}                                                         
                                        </select>
                                        
                                       <i class="fancy-arrow"></i>
                                       
                                       </div>
                                       
                                  </div>

                                   
                                   <div class="col-md-6 col-sm-6">
                                        <label>ترتیب  *</label>
                                        <input type="text" name="order" value="" placeholder="ترتیب دسته بندی کالا را وارد کنید" class="form-control required">
                                   </div>


                                   
                                </div>
                           </div>

                                <div class="row">
                                   <div class="col-md-6 col-sm-6">
                                    
                                        <label class="switch switch-success switch-round"> 
                                        <span>وضعیت </span>
                                        <input name="cat_status" type="checkbox" checked="">
                                        <span class="switch-label"  data-on="فعال" data-off="غیرفعال"> </span>
                                        </label>
                                    </div>
                                </div>

                                <div class="row">
                                    <div class="form-group">
                                        <div class="col-md-12 col-sm-12">
                                            <label> توضیحات </label>
                                            <textarea name="cat_desc" rows="4" class="form-control"></textarea>
                                        </div>
                                    </div>
                                </div>



                                </fieldset>

                            <div class="row">
                                <div class="col-md-12">
                                  <input type="hidden" name="isSubmit" value="1"/>
                                  <button type="submit" class="btn btn-success btn-3d  btn-xlg btn-block margin-top-30 ">
                                    افزودن دسته بندی کالا
                                  </button>
                                </div>
                            </div>
                        </form>
                </div>
                            <!-- /panel content -->

						<!-- panel footer -->
						<div class="panel-footer">



						</div>
						<!-- /panel footer -->

					</div>
					<!-- /PANEL -->
                </div>
                        
                <div class="col-md-6">
                    <div class="panel panel-default">
                       <div class="panel-heading">
							<span class="title elipsis">
								<strong>فهرست دسته بندی محصولات </strong> <!-- panel title -->
							</span>

							

						</div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                    <thead>
                                        <tr>

                                            <th class="width-180 text-center">عنوان دسته بندی ها</th>
                                            <th class="width-50 text-center">ترتیب</th>
                                            <th class="width-50 text-center">وضعیت</th>
                                            <th class="width-160 text-center">عملیات</th>

                                        </tr>
                                    </thead>

                                    <tbody>
                                        {insert name=get_shop_category_list value=gvar assign=shop_cat_list parent_id=0}
                                        {foreach from=$shop_cat_list item=shop_cat }
                                      <tr class="odd gradeX  ">



                                            <td class="text-left align-middle">
                                                 <span>{$shop_cat['cat_name']}</span>  
                                                 {insert name=ishaveChild_shop_cat value=var catid=$shop_cat['catid'] assign=ischild}


                                            </td>

                                            <td class="text-center align-middle">
                                               <form action="{$adminurl}/shop.categories.php" class="inlineForm" method="post">
                                                 <input type="text" value="{$shop_cat['order']}" name="order" size="2"/>
                                                 <input type="hidden" name="catid" value="{$shop_cat['catid']}">
                                                 <input type="hidden" name="isEdit" value="1">
                                               </form>
                                               
                                            </td>
                                            <td class="align-middle text-center">
                                                {if $shop_cat['cat_status'] eq 0 }غیرفعال{else}فعال{/if}
                                            </td>

                                            <td class="text-center  align-middle">
                                               <a href="{$adminurl}/shop.categories.edit.php?catid={$shop_cat['catid']}" data-target="#Edit{$shop_cat['catid']}" data-toggle="modal" class="btn btn-default btn-xs  "><i class="fa fa-edit white"></i> ویرایش </a>
                                               
                                               <a href="{$adminurl}/shop.categories.php?delete={$shop_cat['catid']}"  class="btn btn-danger btn-xs disabled " onclick="{literal} return confirm('آیا از حذف این دسته بندی مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                            </td>
                                            
                                        </tr>
                                        {if $ischild}
                                        {insert name=get_shop_category_list value=gvar parent_id=$shop_cat['catid'] assign=child_list}

                                        {foreach from=$child_list item=child}
                                        <tr class="prnt{$shop_cat['catid']}">

                                          <td class="text-left align-middle">
                                               <span>&nbsp;&nbsp; &larr; {$child['cat_name']}</span> 
                                          </td>
                                          <td class="text-center align-middle">
                                               <form action="{$adminurl}/shop.categories.php" class="inlineForm" method="post">
                                                 <input type="text" value="{$child['order']}" name="order" size="2"/>
                                                 <input type="hidden" name="catid" value="{$child['catid']}">
                                                 <input type="hidden" name="isEdit" value="1">
                                               </form>
                                               
                                            </td>

                                          <td class="align-middle text-center">
                                                {if $child['cat_status'] eq 0 }غیرفعال{else}فعال{/if}</td>
                                          <td class="text-center  align-middle">
                                               <a href="{$adminurl}/shop.categories.edit.php?catid={$child['catid']}" data-target="#Edit{$child['catid']}" data-toggle="modal" class="btn btn-default btn-xs "><i class="fa fa-edit white"></i> ویرایش </a>
                                               
                                               <a href="{$adminurl}/shop.categories.php?delete={$child['catid']}"  class="btn btn-danger btn-xs " onclick="{literal} return confirm('آیا از حذف این دسته بندی مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                            </td>
                                        </tr>
                                        {/foreach}
                                        {/if}
                                        {/foreach}
                                    </tbody>
                                </table>
                             </div>
                        </div>
                                  
                              
                  </div>
              </div>
          </div>
            
                </div>
            </section>
        </div>




{insert name=get_shop_category_list value=gvar assign=edit_cat}
{foreach from=$edit_cat item=CatEditor}



<div class="modal fade" id="Edit{$CatEditor['catid']}" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="text-center">
                <img src="{$assets}/images/loaders/7.gif" alt="" />
            </div>

        </div>
    </div>
</div>


{/foreach}



