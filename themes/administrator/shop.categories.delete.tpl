{insert name=get_shop_cat value=gvar catid=$catid assign=edit_cat }
<div class="container-fluid">
    <div class="row" >	
        <div class="col-md-12 col-sm-12 padding-20">
                <form  action="{$adminurl}/shop.categories.delete.php" method="post">
                    <fieldset>
                        <!-- required [php action request] -->
                        <div class="row">
                            <div class="form-group">
                                <div class="col-md-6 col-sm-12">
                                    <label> نام دسته  *</label>
                                    <input type="text" name="catname" value="{$edit_cat['cat_name']}" class="form-control required">
                                </div>
                            </div>
                        </div>
                     <div class="row">
                        <div class="form-group">
                          {insert name=get_shop_category_list value=gvar cat_status=1 assign=edited}
                          <div class="col-md-6 col-sm-6">
                             <label> دسته فرزند *</label>
                             {foreach from=$edited  item=shop_cat }
                                {if $edit_cat['catid'] eq $shop_cat['pntid'] }
                                  <input type="text" name="pntid" value="{$shop_cat['cat_name']}" class="form-control required">
                                {/if}
                             {/foreach}                                
                             <i class="fancy-arrow"></i>
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