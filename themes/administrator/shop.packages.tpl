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
                <li class="active">بسته بندی محصولات</li>
            </ol>
        </header>
        <!-- /page title -->


      <div id="content" class="padding-20">
        <div class="row">
          <div class="col-md-6">
            <div id="panel-2" class="panel panel-default">
              <div class="panel-heading">
                <span class="title elipsis">
                  <strong>افزودن بسته بندی کالا </strong> <!-- panel title -->
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
                <form  action="{$adminurl}/shop.packages.php" method="post" >
                  <fieldset>
                    <!-- required [php action request] -->
                    <div class="row">
                      <div class="form-group">
                        <div class="col-md-6 col-sm-6">
                          <label> عنوان بسته بندی  *</label>
                          <input type="text" name="pck_title" value="" class="form-control required">
                        </div>
                      
                    <span>وضعیت :  </span>
                       <div class="col-md-6 col-sm-6">
                          <label class="switch switch-success switch-round"> 
                          
                          <input name="pck_status" type="checkbox" checked="">
                          <span class="switch-label"  data-on="فعال" data-off="غیرفعال"> </span>
                          </label>
                        </div>
                      </div>
                    </div>

                    <div class="row">
                      <div class="form-group">
                        <div class="col-md-12 col-sm-12">
                          <label> توضیحات </label>
                          <textarea name="pck_description" rows="4" class="form-control"></textarea>
                        </div>
                      </div>
                    </div>

                    </fieldset>

                    <div class="row">
                      <div class="col-md-12">
                        <input type="hidden" name="isSubmit" value="1"/>
                        <button type="submit" class="btn btn-success btn-3d  btn-xlg btn-block margin-top-30 ">
                          افزودن بسته بندی کالا
                        </button>
                      </div>
                    </div>
                </form>
            </div>
          </div>
            <!-- /PANEL -->
        </div>
        <div class="col-md-6">
            <div class="panel panel-default">
               <div class="panel-heading">
                    <span class="title elipsis">
                        <strong>فهرست بسته بندی محصولات </strong> <!-- panel title -->
                    </span>
                </div>
                <div class="panel-body">
                  <div class="table-responsive">
                    <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                      <thead>
                        <tr>
                          <th class="width-180 text-center">عنوان بسته بندی ها</th>
                          <th class="width-50 text-center">وضعیت</th>
                          <th class="width-160 text-center">عملیات</th>
                        </tr>
                      </thead>
                      <tbody>
                          {insert name=get_packages value=var  assign=pack_list}
                             {if $pack_list ne Null}
                              {foreach from=$pack_list item=pack}
                              <tr>
                                <td class="text-left align-middle">
                                     <span>{$pack['pck_title']|stripslashes}</span> 
                                </td>
                                <td class="align-middle text-center">
                                    {if $pack['pck_status'] eq 0 }غیرفعال{else}فعال{/if}</td>
                                <td class="text-center  align-middle">
                                   <a href="{$adminurl}/shop.packages.edit.php?pckid={$pack['pckid']}" data-target="#Edit{$pack['pckid']}" data-toggle="modal" class="btn btn-default btn-xs "><i class="fa fa-edit white"></i> ویرایش </a>

                                   <a href="{$adminurl}/shop.packages.php?delete={$pack['pckid']}"  class="btn btn-danger btn-xs " onclick="{literal} return confirm('آیا از حذف این دسته بندی مطمئن هستید؟!');{/literal}"><i class="fa fa-times white"></i> حذف </a>
                                </td>
                              </tr>
                            {/foreach}
                           {/if}
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




{insert name=get_packages value=var assign=edit_pack}
{foreach from=$edit_pack item=pckEditor}
  <div class="modal fade" id="Edit{$pckEditor['pckid']}" role="basic" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">

          <div class="text-center">
              <img src="{$assets}/images/loaders/7.gif" alt="" />
          </div>

      </div>
    </div>
  </div>
{/foreach}