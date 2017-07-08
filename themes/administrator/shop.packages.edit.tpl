{insert name=get_pack_edit value=gvar pckid=$pckid assign=edit_pck}

 <div class="row">
  <div class="col-md-12">
    <div id="panel-2" class="panel panel-default">
      <div class="panel-heading">
        <span class="title elipsis">
          <strong>افزودن بسته بندی کالا </strong> <!-- panel title -->
        </span>
      </div>
<!-- panel content -->
    <div class="panel-body">
        <form  action="{$adminurl}/shop.packages.edit.php" method="post" >
          <fieldset>
            <!-- required [php action request] -->
            <div class="row">
              <div class="form-group">
                <div class="col-md-6 col-sm-12">
                  <label> عنوان بسته بندی  *</label>
                  <input type="text" name="pck_title" value="{$edit_pck['pck_title']}" class="form-control required">
                </div>
              </div>
            </div>

            <div class="row">
               <div class="col-md-6 col-sm-6">
                  <label class="switch switch-success switch-round"> 
                  <span>وضعیت </span>
                   {if $edit_pck['pck_status'] eq "1"}
                      <input name="pck_status" type="checkbox" checked=""> 
                   {else}
                      <input name="pck_status" type="checkbox" >
                   {/if}  
                   <span class="switch-label"  data-on="فعال" data-off="غیرفعال"> </span>
                  </label>
                </div>
            </div>

            <div class="row">
              <div class="form-group">
                <div class="col-md-12 col-sm-12">
                  <label> توضیحات </label>
                  <textarea name="pck_description" rows="4" class="form-control">{$edit_pck['pck_description']}</textarea>
                </div>
              </div>
            </div>

            </fieldset>

            <div class="row">
              <div class="col-md-12">
                <input type="hidden" name="isSubmit" value="1"/>
                <button type="submit" class="btn btn-success btn-3d  btn-xlg btn-block margin-top-30 ">
                  ویرایش بسته بندی کالا
                </button>
              </div>
            </div>
        </form>
    </div>
  </div>
 </div>
</div>