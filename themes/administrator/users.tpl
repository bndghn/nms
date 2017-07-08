{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} فهرست کاربران{/block}
{block name = "sTitle"}کاربران{/block}
{block name = "pTitle"}مدیریت کاربران{/block}
{block name="css"}
<link href="assets/css/layout-datatable.css" rel="stylesheet" type="text/css" />

{/block}
            {block name = "main"}
              <div id="content" class="padding-20"> 
                 <div id="panel-ui-tan-l2" class="panel panel-default">
                    <div class="panel-heading">
   
                      <span class="elipsis"><!-- panel title -->
                              <strong>فهرست مشتریان</strong>
                          </span>
                          <div class="pull-right">
                              <form method="get" action="#" class="fancy-form">
                                  <i class="fa fa-user"></i>
                                  <input type="tel" class="form-control" placeholder="{$lang45}">
                                  <!-- tooltip - optional, bootstrap tooltip can be used instead -->
                                  <span class="fancy-tooltip top-right"> <!-- positions: .top-left | .top-right -->
                                      <em> {$lang46}</em>
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
                                          <a href="#active_user" data-toggle="tab">
                                              <span class="badge badge-warning pull-right">
                                              {insert name=get_users_count value=var  customer=1 verified=1 assign=customerConutVerified}
                                              {$customerConutVerified}
                                              </span>
                                              مشتریان فعال
                                          </a>
                                      </li>
                                      <li>
                                          <a href="#deactive_user" data-toggle="tab">
                                              <span class="badge badge-warning pull-right">
                                              {insert name=get_users_count value=var  customer=1 verified=0 assign=notVerified}
                                              {$notVerified}
                                              </span>
                                              مشتریان غیرفعال
                                          </a>
                                      </li>

                                  </ul>
                              </div>
                              <!-- tabs content -->
                              <div class="col-md-10 col-sm-10 nopadding-right nopadding-left">
                                  <div class="tab-content">
                                      <div id="active_user" class="tab-pane active">
                                            <div class="table-responsive">
                                                  <table class="table table-striped table-bordered table-hover" id="activ_customer">
                                                      <thead>
                                                          <tr>
                                                              <th class="table-checkbox text-center width-20">
                                                                  <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                                              </th>
                                                              <th class="width-100 text-center">{$lang12}</th>
                                                              <th class="width-150 text-center">{$lang30}</th>
                                                              <th class="width-130 text-center">نوع مشتری</th>
                                                              <th class="text-center">{$lang38}</th>
                                                          </tr>
                                                      </thead>
                                                      <tbody>
                                                          {insert name=get_user_list value=var customer=1 verified=1 assign=usersList}
                                                          {if $usersList ne null}
                                                          {foreach from=$usersList item=user}
                                                          {if $user['user_status'] eq "2"} {continue} {/if}
                                                          <tr class="odd gradeX {if $user['user_status'] eq "0"}warning {/if}">
                                                          <td class="text-center">
                                                              <input type="checkbox" class="checkboxes" value="1"/>
                                                          </td>

                                                          <td class="align-middle text-center">
                                                               {$user['username']|stripslashes}
                                                          </td>
                                                          <td class="align-middle text-center">
                                                              {$user['fname']|stripslashes} {$user['lname']|stripslashes}
                                                          </td>
                                                          <td class="align-middle text-center">
                                                               {$user['category']|stripslashes|farsidigit}
                                                          </td>


                                                          <td class="text-center  align-middle">

                                                              <a href="{$adminurl}/users.edit.php?id={$user['userid']}" class="btn btn-default btn-xs" data-target="#uEdit{$user['userid']}" data-toggle="modal"><i class="fa fa-edit white"></i> {$lang35} </a>

                                                              <a href="{$adminurl}/users.delete.php?id={$user['userid']}" onclick="{literal} return confirm('آیا از حذف این کاربر مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>


                                                              <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$user['fname']} {$user['lname']}" data-content="<label>{$lang40}:</label> {$user['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$user['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$user['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                                                                  <i class="fa fa-user" aria-hidden="true"></i>
                                                                  پروفایل
                                                              </a>

                                                          </td>
                                                      </tr>
                                                          {/foreach}
                                                          {else}
                                                          <tr>
                                                              <td colspan="5"><p class="text-center">متاسفانه کاربری یافت نشد!</p></td>
                                                          </tr>
                                                          {/if}
                                                  </tbody>
                                              </table>
                                          </div>
                                      </div>
                                      <div id="deactive_user" class="tab-pane">
                                            <div class="table-responsive">
                                                  <table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                                      <thead>
                                                          <tr>
                                                              <th class="table-checkbox text-center width-20">
                                                                  <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                                              </th>
                                                              <th class="width-100 text-center">{$lang12}</th>
                                                              <th class="width-150 text-center">ایمیل</th>
                                                              <th class="width-100 text-center">تلفن همراه</th>
                                                              <th class="width-100 text-center">رمز عبور</th>
                                                              <th class="text-center">{$lang38}</th>
                                                          </tr>
                                                      </thead>
                                          <tbody>
                                              {insert name=get_user_list value=var customer=1 verified=0 assign=usersListNV}
                                              {if $usersListNV ne null}
                                              {foreach from=$usersListNV item=usernv}
                                              <tr class="odd gradeX {if $usernv['user_status'] eq "0"}warning{/if}">
                                                  <td class="text-center">
                                                      <input type="checkbox" class="checkboxes" value="1"/>
                                                  </td>
                                                  <td class="align-middle text-center">
                                                       {$usernv['username']|stripslashes}
                                                  </td>
                                                  <td class="align-middle text-center">
                                                      {$usernv['email']|stripslashes}
                                                  </td>
                                                  <td class="align-middle text-center">
                                                      {$usernv['mobile']|farsidigit}
                                                  </td>
                                                  <td class="align-middle text-center">
                                                       {$usernv['firstPass']|stripslashes|farsidigit}
                                                  </td>
                                                  <td class="text-center  align-middle">
                                                      <a href="{$adminurl}/users.edit.php?id={$usernv['userid']}" class="btn btn-default btn-xs" data-target="#uEdit{$usernv['userid']}" data-toggle="modal"><i class="fa fa-edit white"></i> {$lang35} </a>
                                                      <a href="{$adminurl}/users.delete.php?id={$usernv['userid']}" onclick="{literal} return confirm('آیا از حذف این کاربر مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>

                                                  </td>
                                              </tr>
                                              {/foreach}
                                              {else}
                                              <tr>
                                                  <td colspan="5"><p class="text-center">متاسفانه کاربری یافت نشد!</p></td>
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
              <a href="{$adminurl}/users.add.php?type=customer" data-target="#addCustomer" data-toggle="modal" class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom"><i class="fa fa-plus white"></i>ثبت مشتری جدید</a>
            </div>
        </div>   
                  <div class="row">
                    <!--Right -->
                    <div class="col-md-6">        
                        <div id="panel-admin" class="panel panel-default">
                            <div class="panel-heading">
                                <span class="elipsis"><!-- panel title -->
                                    <strong>{$lang42}</strong>
                                </span>
                                <!-- right options -->
                                <ul class="pagination pagination-sm pull-right">
                                    <li class="disabled"><a href="#">{$lang43}</a></li>
                                    <li class="active"><a href="#">1</a></li>
                                    <li><a href="#">2</a></li>
                                    <li><a href="#">3</a></li>
                                    <li><a href="#">{$lang44}</a></li>
                                </ul>
                                <!-- /right options -->
                            </div>
                            <!-- panel content -->
                            <div class="panel-body">
                            <div class="table-responsive">
							<table class="table table-striped table-bordered table-hover" id="datatable_admin">
                                <thead>
                                    <tr>                          
                                        <th class="width-100 text-center">{$lang12}</th>
                                        <th class="width-150 text-center">{$lang30}</th>
                                        <th class="text-center">{$lang38}</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    {insert name=get_user_list value=var user_group=1 assign=adminList}
                                    {if $adminList ne null}
                                    {foreach from=$adminList item=admin}
                                    <tr class="odd gradeX {if $admin['status'] eq "0"}warning {elseif $admin['status'] eq "2"}danger{/if}">
                                        
                                        
                                        <td class="align-middle text-center">
                                             {$admin['username']|stripslashes}
                                        </td>
                                        <td class="align-middle text-center">
                                            {$admin['fname']|stripslashes} {$admin['lname']|stripslashes}
                                        </td>

                                        <td class="text-center  align-middle">
                                            
                                            <a href="{$adminurl}/users.edit.php?id={$admin['userid']}" class="btn btn-default btn-xs" data-target="#uEdit{$admin['userid']}" data-toggle="modal"><i class="fa fa-edit white"></i> {$lang35} </a>
                                            
                                            <a href="{$adminurl}/users.delete.php?id={$admin['userid']}" onclick="{literal} return confirm('آیا از حذف این کاربر مطمئن هستید؟!');{/literal}" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>

                                            
                                            
                                            <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$admin['fname']} {$admin['lname']}" data-content="<label>{$lang40}:</label> {$admin['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$admin['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$admin['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                                                <i class="fa fa-bar-chart" aria-hidden="true"></i>
                                                {$lang39}
                                            </a>

                                        </td>
                                    </tr>



                                    {/foreach}
                                    {else}
                                    <tr>
                                        <td colspan="3"><p class="text-center">متاسفانه کاربری یافت نشد!</p></td>
                                    </tr>
                                    {/if}

                                </tbody>
                            </table>
                            </div>
                            

                            </div>
                            <!-- /panel content -->

                            <!-- panel footer -->
                            <div class="panel-footer clearfix">
                               
                                <a href="{$adminurl}/users.add.php" data-target="#addUser" data-toggle="modal" class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom"><i class="fa fa-plus white"></i>{$lang49}</a>
                                
                            </div>
                            <!-- /panel footer -->

                        </div>
                    
                    </div>
                    
                    
                    <!--Left -->
                    <div class="col-md-6">
                        
                        <div id="panel-employers" class="panel panel-default">

								<div class="panel-heading">

									<span class="elipsis"><!-- panel title -->
										<strong>{$lang47}</strong>
									</span>

									<!-- right options -->
									<ul class="options pull-right relative list-unstyled">
										
										<li class="hidden-xs">
											<a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><span class="label label-success">Status <span class="caret"></span></span></a>
											<ul class="dropdown-menu pull-right" role="menu">
												<li><a data-portlet="color_status_switch" data-action="path_to_chat.php?status=online" data-method="GET" href="#label-success"><i class="fa fa-dot-circle-o color-green"></i> Online</a></li>
												<li><a data-portlet="color_status_switch" data-action="path_to_chat.php?status=busy" data-method="GET" href="#label-danger"><i class="fa fa-dot-circle-o color-red"></i> Busy</a></li>
												<li><a data-portlet="color_status_switch" data-action="path_to_chat.php?status=away" data-method="GET" href="#label-warning"><i class="fa fa-dot-circle-o color-yellow"></i> Away</a></li>
												<li><a data-portlet="color_status_switch" data-action="path_to_chat.php?status=offline" data-method="GET" href="#label-disabled"><i class="fa fa-dot-circle-o color-gray"></i> Offline</a></li>
											</ul>
										</li>
									</ul>
									<!-- /right options -->

								</div>

								<!-- panel content -->
								<div class="panel-body">

                                    <div class="table-responsive">
                                    <table class="table table-striped table-bordered table-hover" id="datatable_admin">
                                        <thead>
                                            <tr>

                                                <th class="width-100 text-center">{$lang12}</th>
                                                <th class="width-150 text-center">گروه کاربری</th>
                                                <th class="text-center">{$lang38}</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            {insert name=get_user_list value=var user_group=0 customer=0 assign=employerList}
                                            {if $employerList ne null}
                                            {foreach from=$employerList item=employer}
                                            <tr class="odd gradeX {if $employer['status'] eq "0"}warning {elseif $employer['status'] eq "2"}danger{/if}">


                                                <td class="align-middle text-center">
                                                     {$employer['username']|stripslashes}
                                                </td>
                                                <td class="align-middle text-center">
                                                    {$employer['category']|stripslashes}
                                                </td>

                                                <td class="text-center  align-middle">
                                                    <a href="{$adminurl}/users.edit.php?id={$employer['userid']}" class="btn btn-default btn-xs" data-target="#uEdit{$employer['userid']}" data-toggle="modal"><i class="fa fa-edit white"></i> {$lang35} </a>


                                                    <a href="{$adminurl}/users.delete.php?id={$employer['userid']}" class="btn btn-danger btn-xs"><i class="fa fa-times white" onclick="{literal} return confirm('آیا از حذف این کاربر مطمئن هستید؟!');{/literal}"></i> {$lang34} </a>
                                                    <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$employer['fname']} {$employer['lname']}" data-content="<label>{$lang40}:</label> {$employer['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$employer['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$employer['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                                                        <i class="fa fa-bar-chart" aria-hidden="true"></i>
                                                        {$lang39}
                                                    </a>
                                                </td>
                                            </tr>
                                            {/foreach}
                                            {else}
                                            <tr>
                                                <td colspan="3"><p class="text-center">متاسفانه کاربری یافت نشد!</p></td>
                                            </tr>
                                            {/if}
                                        </tbody>
                                    </table>
                                    </div>
								</div>
  						<!-- /panel content -->
                                <!-- panel footer -->
                                <div class="panel-footer clearfix">
                                    <a href="{$adminurl}/users.add.php" data-target="#addUser" data-toggle="modal" class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom"><i class="fa fa-plus white"></i>{$lang50}</a>
                                </div>
                                <!-- /panel footer -->
                      </div>
              </div>                      
        </div><!--End row -->
    </div>

{/block}



<div class="modal fade" id="addCustomer" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="text-center">
                <img src="{$assets}/images/loaders/7.gif" alt="" />
            </div>

        </div>
    </div>
</div>
<div class="modal fade" id="addUser" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="text-center">
                <img src="{$assets}/images/loaders/7.gif" alt="" />
            </div>

        </div>
    </div>
</div>

{insert name=get_user_list value=var assign=usersEdit}
{foreach from=$usersEdit item=userEdit}
<div class="modal fade" id="uEdit{$userEdit['userid']}" role="basic" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">

            <div class="text-center">
                <img src="{$assets}/images/loaders/7.gif" alt="" />
            </div>

        </div>
    </div>
</div>
{/foreach}

{block name="script"}
 {literal}
 <script type="text/javascript">
    loadScript(plugin_path + "datatables/js/jquery.dataTables.min.js", function(){
	loadScript(plugin_path + "datatables/dataTables.bootstrap.js", function(){
		if (jQuery().dataTable) {
			var table = jQuery('#activ_customer');
			table.dataTable({
				"columns": [{
					"orderable": false
				}, {
					"orderable": true
				}, {
					"orderable": false
				}, {
					"orderable": false
				}, {
					"orderable": true
				}, {
					"orderable": false
				}],
				"lengthMenu": [
					[5, 15, 20, -1],
					[5, 15, 20, "All"] // change per page values here
				],
				// set the initial value
				"pageLength": 5,            
				"pagingType": "bootstrap_full_number",
				"language": {
					"lengthMenu": "  _MENU_ records",
					"paginate": {
						"previous":"Prev",
						"next": "Next",
						"last": "Last",
						"first": "First"
					}
				},
				"columnDefs": [{  // set default column settings
					'orderable': false,
					'targets': [0]
				}, {
					"searchable": false,
					"targets": [0]
				}],
				"order": [
					[1, "asc"]
				] // set first column as a default sort by asc
			});
			var tableWrapper = jQuery('#datatable_sample_wrapper');
			table.find('.group-checkable').change(function () {
				var set = jQuery(this).attr("data-set");
				var checked = jQuery(this).is(":checked");
				jQuery(set).each(function () {
					if (checked) {
						jQuery(this).attr("checked", true);
						jQuery(this).parents('tr').addClass("active");
					} else {
						jQuery(this).attr("checked", false);
						jQuery(this).parents('tr').removeClass("active");
					}
				});
				jQuery.uniform.update(set);
			});
			table.on('change', 'tbody tr .checkboxes', function () {
				jQuery(this).parents('tr').toggleClass("active");
			});
			tableWrapper.find('.dataTables_length select').addClass("form-control input-xsmall input-inline"); // modify table per page dropdown
		}
	});
});
</script>
 {/literal}
{/block}