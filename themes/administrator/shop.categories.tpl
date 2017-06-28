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
            <div class="alert alert-mini alert-success nomargin noradius noborder">
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
                                <label> نام دسته کالا *</label>
                                <input type="text" name="catname" value="" class="form-control required">
                            </div>

                        </div>
                    </div>



                <div class="row">
                    <div class="form-group">
                       <div class="col-md-6 col-sm-6">
                            <label> شماره سری دسته بندی کالا *</label>
                            <input type="text" name="pntid" value="" class="form-control required">
                       </div>
                    </div>
                    <div class="col-md-6 col-sm-6">
                        <label class="switch switch-info switch-round">
                            <span>وضعیت : </span>

                            <input name="cat_status" type="checkbox" checked="">
                            <span class="switch-label"  data-on="موجود" data-off="ناموجود"></span>

                        </label>
                    </div>
                </div>



                <div class="row">
                    <div class="form-group">
                        <div class="col-md-12 col-sm-12">
                            <label> توضیحات </label>
                            <textarea name="catdesc" rows="4" class="form-control"></textarea>
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
                        <div class="panel-body">
                        <div class="tabs nomargin">
                                <!-- tabs -->
                                <ul class="nav nav-tabs nav-justified">
                                    <li class="active">
                                        <a href="#jtab1_nobg" data-toggle="tab">
                                            <i class="fa "></i> فهرست دسته بندی های کالا
                                        </a>
                                    </li>
                                    <li class="">
                                        <a href="#jtab2_nobg" data-toggle="tab">
                                            <i class="fa "></i> فهرست کالاهای پرفروش
                                        </a>
                                    </li>
                                </ul>
                                
                               
                                <!-- tabs content -->
                                <div class="tab-content transparent">
                                    <div id="jtab1_nobg" class="tab-pane active">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                                <thead>
                                                    <tr>
                                                        
                                                        <th class=" text-center">دسته بندی کالا</th>
                                                        <th class="width-50 text-center">وضعیت</th>
                                                        <th class="width-200 text-center">عملیات</th>
                                                        
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                    {insert name=get_shop_category_list value=gvar assign=shop_cat}
                                                    {foreach from=$shop_cat_list item=shop_cat}
                                                    <tr class="odd gradeX ">
                                                        
                                                        <td class="text-center align-middle">
                                                           {$shop_cat['cat_name']}
                                                        </td>
                                                       
                                                        <td class="align-middle text-center">
                                                            {if $shop_cat['cat_status'] eq 0 }ناموجود{else}موجود{/if}
                                                        </td>
                                                        
                                                        <td class="text-center  align-middle">
                                                           
                                                           {if {$shop_cat['pntid']} eq 1 or {$shop_cat['pntid']} eq 2 or {$shop_cat['pntid']} eq 3 or {$shop_cat['pntid']} eq 4 or {$shop_cat['pntid']} eq 5 or {$shop_cat['pntid']} eq 6 or {$shop_cat['pntid']} eq 7 or {$shop_cat['pntid']} eq 8 or {$shop_cat['pntid']} eq 9}
                                                           <a href="#" class="btn btn-default btn-xs disabled"><i class="fa fa-edit white"></i> ویرایش </a>
                                                            
                                                             
                                                               <a href="#" class="btn btn-danger btn-xs disabled"><i class="fa fa-times white"></i> حذف </a>
                                                           {else}
                                                            <a href="#" data-target="#ugEdit{$group['id']}" data-toggle="modal" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> ویرایش </a>
                                                            
                                                            <a href="#" class="btn btn-danger btn-xs" onclick="{literal} return confirm('آیا از حذف این دسته بندی مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                                            {/if}

                                                        </td>

                                                    
                                                    </tr>
                                                    {/foreach}
                                                    </tbody>
                                                </table>
                                         </div>
                                    </div>
                                    <div id="jtab2_nobg" class="tab-pane">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                                <thead>
                                                    <tr>
                                                        
                                                        <th class="text-center">گروه مشتریان</th>
                                                        
                                                        <th class="width-50 text-center">وضعیت</th>
                                                        <th class="width-200 text-center">عملیات</th>
                                                        
                                                    </tr>
                                                </thead>

                                                <tbody>
                                                 <!--    
                                                    {insert name=get_shop_category_list value=gvar assign=shop_cat}
                                                    {foreach from=$shop_cat_list item=shop_cat}
                                                    <tr class="odd gradeX ">
                                                        
                                                        <td class="text-center align-middle">
                                                          
                                                           {$shop_cat['cat_name']}
                                                          
                                                        </td>
                                                       
                                                        <td class="align-middle text-center">
                                                            {if $shop_cat['cat_status'] eq 0 }ناموجود{else}موجود{/if}
                                                            
                                                        </td>
                                                        
                                                        <td class="text-center  align-middle">
                                                           
                                                             <a href="#" data-target="#ugEdit{$cGroup['id']}" data-toggle="modal" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> ویرایش </a>
                                                            <a href="#" class="btn btn-danger btn-xs" onclick="{literal} return confirm('آیا از حذف این گروه مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                                           
                                                            
                                                          


                                                        </td>

                                                    
                                                    </tr>
                                                    {/foreach}                            
                                                        -->                           
                                                </tbody>
                                                </table>
                                            </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
                </div>
            </section>
        </div>
        
        
       
      
     
    
   
  












{insert name=get_user_group_list value=gvar assign=groupListEdit}
{foreach from=$groupListEdit item=glEdit}



<div class="modal fade" id="ugEdit{$glEdit['id']}" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="text-center">
                <img src="{$assets}/images/loaders/7.gif" alt="" />
            </div>

        </div>
    </div>
</div>


{/foreach}



