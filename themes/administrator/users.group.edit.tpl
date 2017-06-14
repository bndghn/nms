<div class="container-fluid">
    <div class="row" >	
        <div class="col-md-12 col-sm-12 padding-20">
            <form  action="{$adminurl}/users.group.edit.php" method="post" enctype="multipart/form-data" data-success="Sent! Thank you!" data-toastr-position="top-right">
                <fieldset>
                    <!-- required [php action request] -->
                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-sm-12">
                                <label> نام گروه *</label>
                                <input type="text" name="category" value="{$gUser['category']}" class="form-control required">
                            </div>

                        </div>
                    </div>



                <div class="row">
                    <div class="form-group">
                        <div class="col-md-6 col-sm-6">

                            <label class="switch switch-success switch-round">
                                <span> گروه مشتری؟</span>
                                {if $gUser['isCustomer'] eq "1"}
                                <input name="isCustomer" type="checkbox" checked="">
                                {else}
                                <input name="isCustomer" type="checkbox">
                                {/if}

                                <span class="switch-label" data-on="بله" data-off="خیر"></span>

                            </label>
                        </div>
                        <div class="col-md-6 col-sm-6">
                            <label class="switch switch-info switch-round">
                                <span>وضعیت : </span>
                                {if $gUser['status'] eq "1"}
                                <input name="status" type="checkbox" checked="">
                                {else}
                                <input name="status" type="checkbox">
                                {/if}

                                <span class="switch-label"  data-on="فعال" data-off="غیرفعال"></span>

                            </label>
                        </div>
                    </div>
                </div>



                    <div class="row">
                        <div class="form-group">
                            <div class="col-md-12 col-sm-12">
                                <label> توضیحات </label>
                                <textarea name="description" rows="4" class="form-control">{$gUser['description']}</textarea>
                            </div>
                        </div>
                    </div>



                </fieldset>
                  <div class="row">
                        <div class="col-md-12">
                          <input type="hidden" name="isSubmit" value="1"/>
                          <input type="hidden" name="id" value="{$gUser['id']}"/>
                          <button type="submit" class="btn btn-success btn btn-3d btn-teal  btn-block margin-top-30">ویرایش گروه کاربری</button>
                        </div>
                    </div>





            </form>
   

        </div>
    </div>
 
</div>





