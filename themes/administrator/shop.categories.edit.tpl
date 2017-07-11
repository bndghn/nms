{insert name=get_shop_cat value=gvar catid=$catid assign=edit_cat }
 
<div class="container-fluid">
    <div class="row" >	
        <div class="col-md-12 col-sm-12 padding-20">
                <form  action="{$adminurl}/shop.categories.edit.php" method="post" enctype="multipart/form-data" >
                    <fieldset>
                        <!-- required [php action request] -->
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12">
                                    <label> نام دسته  *</label>
                                    <input type="text" name="catname" value="{$edit_cat['cat_name']}" class="form-control required">
                                </div>

                            </div>
                        </div>



                    <div class="row">
                        <div class="form-group">
                         

                            {insert name=get_shop_category_list value=gvar cat_status=1  parent_id=0  assign=edited}
                          <div class="col-md-6 col-sm-6">
                              <label> دسته مادر *</label>    

                               <div class="fancy-form fancy-form-select">
                                
                                <select class="form-control select" name="pntid" value="{$edited['catid']}">
                                
                                   <option value="0">هیچکدام</option>
                                   
                                    {foreach from=$edited  item=shop_cat }

                                      <option value="{$shop_cat['catid']}" {if $edit_cat['pntid'] eq $shop_cat['catid'] }selected{/if}>{$shop_cat['cat_name']}</option>

                                    {/foreach}


                                </select>

                               <i class="fancy-arrow"></i>

                               </div>

                          </div>


                           <div class="col-md-6 col-sm-6">
                                <label>ترتیب  *</label>
                                <input type="text" name="order" value="{$edit_cat['order']}" placeholder="ترتیب دسته بندی محصول را وارد کنید" class="form-control required">
                           </div>



                        </div>
                   </div>

                        <div class="row">
                           <div class="col-md-6 col-sm-6">

                                <label class="switch switch-success switch-round"> 
                                <span>وضعیت </span>
                                {if $edit_cat['cat_status'] eq "1"}
                                <input name="cat_status" type="checkbox" checked="">
                                {else}
                                <input name="cat_status" type="checkbox">
                                {/if}
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
                          <input type="hidden" name="catid" value="{$edit_cat['catid']}"/>
                          <button type="submit" class="btn btn-success btn-3d  btn-xlg btn-block margin-top-30 ">
                            ویرایش دسته بندی 
                          </button>
                        </div>
                    </div>
                </form>
        </div>
    </div>
</div>