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
                <li class="active">فهرست محصولات</li>
            </ol>
        </header>
        <!-- /page title -->
    <div id="content" class="padding-20">

       <div id="panel-ui-tan-l2" class="panel panel-default">

          <div class="panel-heading">

              <span class="elipsis"><!-- panel title -->
                  <strong>فهرست محصولات</strong>
              </span>
              <div class="pull-right">
                  <form method="get" action="#" class="fancy-form">
                      <i class="fa fa-user"></i>

                      <input type="tel" class="form-control" placeholder="جستجوی محصول">

                      <!-- tooltip - optional, bootstrap tooltip can be used instead -->
                      <span class="fancy-tooltip top-right"> <!-- positions: .top-left | .top-right -->
                          <em> جستجو بر اساس نام محصول </em>
                      </span>
                  </form>
              </div>
          </div>

          <!-- panel content -->
          <div class="panel-body">

              <div class="row tabs nomargin">

                  <!-- tabs -->
                  <div class="col-md-2 col-sm-2 nopadding-right nopadding-left">
                      <ul class="nav nav-tabs nav-stacked">
                          <li class="active">
                              <a href="#active_pro" data-toggle="tab">
                                  <span class="badge badge-warning pull-right">
                                  {insert name=get_pro_count value=var pro_status=1 stock_status=1  assign=ProConutExcited}
                                  {$ProConutExcited}
                                  </span>
                            فروش عادی
                              </a>
                          </li>
                          <li>
                              <a href="#delay_pro" data-toggle="tab">
                                  <span class="badge badge-warning pull-right">
                                  {insert name=get_pro_count value=var pro_status=1 stock_status=2  assign=delayExcited}
                                  {$delayExcited}
                                  </span>
                                  انتظار برای تولید
                              </a>
                          </li>
                          <li>
                              <a href="#deactive_pro" data-toggle="tab">
                                  <span class="badge badge-warning pull-right">
                                  {insert name=get_pro_count value=var  pro_status=1 stock_status=0 assign=notExcited}
                                  {$notExcited}
                                  </span>
                                  عدم سفارش
                              </a>
                          </li>
                          <li>
                            <a href="#deleted_pro" data-toggle="tab">
                              <span class="badge badge-warning pull-right">
                              {insert name=get_pro_count value=var pro_status=0 assign=deactived}
                              {$deactived}
                              </span>
                              محصولات غیرفعال
                            </a>
                          </li>
                      </ul>
                  </div>

                  <!-- tabs content -->
                  <div class="col-md-10 col-sm-10 nopadding-right nopadding-left">
                      <div class="tab-content">
                        <div id="active_pro" class="tab-pane active">
                                <div class="table-responsive">
                                      <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                          <thead>
                                              <tr>
                                                  <th class="table-checkbox text-center width-20">
                                                      <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                                  </th>

                                                  <th class="width-100 text-center">عنوان محصول</th>
                                                  <th class="width-150 text-center">توضیحات مختصر</th>
                                                  <th class="width-150 text-center">نام دسته</th>
                                                  <th class="text-center">{$lang38}</th>
                                              </tr>
                                          </thead>

                                          <tbody>
                                            {insert name=get_product_list value=gvar stock_status=1 pro_status=1 assign=pro_List}
                                            {if $pro_List ne null}
                                            {insert name=get_product_cat value=var stock_status=1 pro_status=1  assign=pro_cat}
                                            {foreach from=$pro_cat item=products}

                                              <tr class="odd gradeX">
                                                <td class="text-center">
                                                    <input type="checkbox" class="checkboxes" value="1"/>
                                                </td>

                                                <td class="align-middle text-center">
                                                     {$products['pro_name']}
                                                </td>
                                                <td class="align-middle text-center">
                                                    {$products['pro_short_desc']}
                                                </td>
                                                   
                                                <td class="align-middle text-center">
                                                    {$products['cat_name']}
                                                </td>
                                                


                                                <td class="text-center  align-middle">

                                                    <a href="{$adminurl}/shop.catalog.edit.php?proid={$products['proid']}" class="btn btn-default btn-xs" ><i class="fa fa-edit white"></i> {$lang35} </a>

                                                    <a href="{$adminurl}/shop.catalog.delete.php?proid={$products['proid']}" onclick="{literal} return confirm('آیا از حذف این محصول مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>


                                                    <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} " data-content="<label>{$lang40}:</label> <br/><label>{$lang41}:</label> ">
                                                        <i class="fa fa-user" aria-hidden="true"></i>
                                                        درباره محصول
                                                    </a>
                                                </td>
                                              </tr>



                                              {/foreach}
                                              {else}
                                              <tr>
                                                  <td colspan="5"><p class="text-center">متاسفانه کالایی یافت نشد!</p></td>
                                              </tr>
                                              {/if}

                                      </tbody>
                                  </table>
                              </div>
                          </div>
          
                         <div id="delay_pro" class="tab-pane">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                    <thead>
                                        <tr>
                                            <th class="table-checkbox text-center width-20">
                                                <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                            </th>

                                           <th class="width-100 text-center">عنوان محصول</th>
                                           <th class="width-150 text-center">توضیحات مختصر</th>
                                           <th class="width-150 text-center">نام دسته</th>
                                           <th class="text-center">{$lang38}</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        {insert name=get_product_list value=gvar stock_status=2 pro_status=1 assign=pro_Lisst}
                                        {if $pro_Lisst ne null}
                                        {insert name=get_product_cat value=var stock_status=2 pro_status=1 assign=pro_cat}
                                        {foreach from=$pro_cat item=delay_pro}

                                        <tr class="odd gradeX ">
                                        <td class="text-center">
                                            <input type="checkbox" class="checkboxes" value="1"/>
                                        </td>

                                        <td class="align-middle text-center">
                                             {$delay_pro['pro_name']}
                                        </td>
                                        <td class="align-middle text-center">
                                            {$delay_pro['pro_short_desc']}
                                        </td>
                                        
                                        <td class="align-middle text-center">
                                            {$delay_pro['cat_name']}
                                        </td>
                                        

                                        <td class="text-center  align-middle">

                                            <a href="{$adminurl}/shop.catalog.edit.php?proid={$delay_pro['proid']}" class="btn btn-default btn-xs" ><i class="fa fa-edit white"></i> {$lang35} </a>

                                            <a href="{$adminurl}/shop.catalog.delete.php?proid={$delay_pro['proid']}" onclick="{literal} return confirm('آیا از حذف این محصول مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>


                                            <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} " data-content="<label>{$lang40}:</label> <br/><label>{$lang41}:</label> ">
                                                <i class="fa fa-user" aria-hidden="true"></i>
                                                درباره محصول
                                            </a>

                                        </td>
                                    </tr>
                                      {/foreach}
                                      {else}
                                      <tr>
                                          <td colspan="5"><p class="text-center">متاسفانه کالایی یافت نشد!</p></td>
                                      </tr>
                                      {/if}

                              </tbody>
                          </table>
                      </div>
                    </div>
                         
                          <div id="deactive_pro" class="tab-pane">
                            <div class="table-responsive">
                              <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                  <thead>
                                      <tr>
                                          <th class="table-checkbox text-center width-20">
                                              <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                          </th>
                                          <th class="width-100 text-center">عنوان محصول</th>
                                          <th class="width-150 text-center">توضیحات مختصر</th>
                                          <th class="width-150 text-center">نام دسته</th>
                                          <th class="text-center">{$lang38}</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      {insert name=get_product_list value=gvar stock_status=0 pro_status=1 assign=pro_Listt}
                                      {if $pro_List ne null}
                                      {insert name=get_product_cat value=var stock_status=0 pro_status=1 assign=pro_cat}
                                      {foreach from=$pro_cat item=no_pro}

                                      <tr class="odd gradeX ">
                                      <td class="text-center">
                                          <input type="checkbox" class="checkboxes" value="1"/>
                                      </td>
                                      <td class="align-middle text-center">
                                           {$no_pro['pro_name']}
                                      </td>
                                      <td class="align-middle text-center">
                                          {$no_pro['pro_short_desc']}
                                      </td>
                                      <td class="align-middle text-center">
                                         {$no_pro['cat_name']}
                                      </td>
                                      <td class="text-center  align-middle">
                                        
                                        
                                         
                                          <a href="{$adminurl}/shop.catalog.edit.php?proid={$no_pro['proid']}" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> {$lang35} </a>

                                          <a href="{$adminurl}/shop.catalog.delete.php?proid={$no_pro['proid']}" onclick="{literal} return confirm('آیا از حذف این محصول مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>


                                          <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} " data-content="<label>{$lang40}:</label> <br/><label>{$lang41}:</label> ">
                                              <i class="fa fa-user" aria-hidden="true"></i>
                                              درباره محصول
                                          </a>

                                      </td>
                                  </tr>
                                  {/foreach}
                                  {else}
                                  <tr>
                                      <td colspan="5"><p class="text-center">متاسفانه کالایی یافت نشد!</p></td>
                                  </tr>
                                  {/if}
                              </tbody>
                            </table>
                          </div>    
                        </div>
                         
                         
                         
                        <div id="deleted_pro" class="tab-pane">
                            <div class="table-responsive">
                              <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                  <thead>
                                      <tr>
                                          <th class="table-checkbox text-center width-20">
                                              <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                          </th>
                                          <th class="width-100 text-center">عنوان محصول</th>
                                          <th class="width-150 text-center">توضیحات مختصر</th>
                                          <th class="width-150 text-center">نام دسته</th>
                                          <th class="text-center">{$lang38}</th>
                                      </tr>
                                  </thead>
                                  <tbody>
                                      {insert name=get_product_list value=gvar pro_status=0 assign=del_pro_List}
                                      {if $del_pro_List ne null}
                                      {insert name=get_product_cat value=var pro_status=0 assign=del_pro_cat}
                                      {foreach from=$del_pro_cat item=del_pro}

                                      <tr class="odd gradeX ">
                                      <td class="text-center">
                                          <input type="checkbox" class="checkboxes" value="1"/>
                                      </td>
                                      <td class="align-middle text-center">
                                           {$del_pro['pro_name']}
                                      </td>
                                      <td class="align-middle text-center">
                                          {$del_pro['pro_short_desc']}
                                      </td>
                                      <td class="align-middle text-center">
                                         {$del_pro['cat_name']}
                                      </td>
                                      <td class="text-center  align-middle">
                                        
                                        
                                         
                                          <a href="{$adminurl}/shop.catalog.edit.php?proid={$del_pro['proid']}" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> {$lang35} </a>

                                          <a href="{$adminurl}/shop.catalog.active.php?proid={$del_pro['proid']}" onclick="{literal} return confirm('آیا از فعالسازی این محصول مطمئن هستید؟!');{/literal}" class="btn btn-success btn-xs"><i class="fa fa-plus white"></i> فعالسازی </a>


                                          <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} " data-content="<label>{$lang40}:</label> <br/><label>{$lang41}:</label> ">
                                              <i class="fa fa-user" aria-hidden="true"></i>
                                              درباره محصول
                                          </a>

                                      </td>
                                  </tr>
                                  {/foreach}
                                  {else}
                                  <tr>
                                      <td colspan="5"><p class="text-center">متاسفانه کالایی یافت نشد!</p></td>
                                  </tr>
                                  {/if}
                              </tbody>
                            </table>
                          </div>    
                        </div> 
                         
                         
                         


                      </div>
                  </div>

              </div>

          </div>
          <!-- /panel content -->
          <div class="panel-footer clearfix">

            <a href="{$adminurl}/shop.catalog.add.php" class="btn btn-success pull-right btn-sm nomargin-top nomargin-bottom"><i class="fa fa-plus white"></i>ثبت محصول جدید</a>

          </div>
      </div>
    </div>
    </section>
</div>








