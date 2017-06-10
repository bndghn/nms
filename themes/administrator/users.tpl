<!-- WRAPPER -->
		<div id="wrapper" class="clearfix">

			{include file='administrator/aside.tpl'}
            
			{include file='administrator/top_head.tpl'}
            
            <section id="middle">


				<!-- page title -->
				<header id="page-header">
					<h1>{$lang8}</h1>
					<ol class="breadcrumb">
						<li><a href="#">{$lang9}</a></li>
						<li class="active">{$lang6}</li>
					</ol>
				</header>
				<!-- /page title -->


				<div id="content" class="padding-20">
                
                    
					<div id="panel-2" class="panel panel-default">
						<div class="panel-heading">
							<span class="title elipsis">
								<strong>{$lang10}</strong> <!-- panel title -->
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
                            <div class="table-responsive">
							<table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                <thead>
                                    <tr>
                                        <th class="table-checkbox text-center width-20">
                                            <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                        </th>
                                        <th class="width-30 text-center">{$lang31}</th>
                                        <th class="width-100 text-center">{$lang12}</th>
                                        <th class="width-150 text-center">{$lang30}</th>
                                        <th class="width-100 text-center">{$lang15}</th>
                                        <th class="text-center">{$lang38}</th>
                                    </tr>
                                </thead>

	<tbody>
        {insert name=get_user_list value=var assign=usersList}
        {foreach from=$usersList item=user}
        <tr class="odd gradeX {if $user['status'] eq "0"}warning {elseif $user['status'] eq "2"}danger{/if}">
			<td class="text-center">
				<input type="checkbox" class="checkboxes" value="1"/>
			</td>
            <td class="text-center align-middle">
                {if $user['gender'] eq "0"}
                <img src="{$assets}/images/male.png"/>
                {else}
                <img src="{$assets}/images/female.png"/>
                {/if}
			</td>
			<td class="align-middle text-center">
				 {$user['username']|stripslashes}
			</td>
			<td class="align-middle text-center">
				{$user['fname']|stripslashes} {$user['lname']|stripslashes}
			</td>
			<td class="align-middle text-center">
				 {$user['mobile']|stripslashes|farsidigit}
			</td>
            
			
			<td class="text-center  align-middle">
				<a href="#" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> {$lang35} </a>
				<a href="#" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>
                    
                <a class="btn btn-3d btn-xs  btn-teal" href="{$user['email']|stripslashes}">
                <i class="fa fa-envelope" aria-hidden="true"></i>
                {$lang33}</a>
                <a class="btn btn-3d btn-xs btn-aqua" href="{$adminurl}/sms.php?number={$user['mobile']|stripslashes}">
                <i class="fa fa-comments" aria-hidden="true"></i>
                {$lang37}</a>
                <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$user['fname']} {$user['lname']}" data-content="<label>{$lang40}:</label> {$user['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$user['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$user['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                    <i class="fa fa-bar-chart" aria-hidden="true"></i>
                    {$lang39}
                </a>
                
			</td>
		</tr>
        
        
        
        {/foreach}
		
	</tbody>
</table>
</div>

						</div>
						<!-- /panel content -->

						<!-- panel footer -->
						<div class="panel-footer clearfix">

                            <a class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom" href="{$adminurl}/user.add.php">{$lang48}</a>

						</div>
						<!-- /panel footer -->

					</div>
					<!-- /PANEL -->
                    
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
                                    {insert name=get_user_list value=var user_group=5 assign=adminList}
                                    {foreach from=$adminList item=admin}
                                    <tr class="odd gradeX {if $admin['status'] eq "0"}warning {elseif $admin['status'] eq "2"}danger{/if}">
                                        
                                        
                                        <td class="align-middle text-center">
                                             {$admin['username']|stripslashes}
                                        </td>
                                        <td class="align-middle text-center">
                                            {$admin['fname']|stripslashes} {$admin['lname']|stripslashes}
                                        </td>

                                        <td class="text-center  align-middle">
                                            <a href="#" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> {$lang35} </a>
                                            <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>

                                            
                                            
                                            <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$admin['fname']} {$admin['lname']}" data-content="<label>{$lang40}:</label> {$admin['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$admin['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$admin['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                                                <i class="fa fa-bar-chart" aria-hidden="true"></i>
                                                {$lang39}
                                            </a>

                                        </td>
                                    </tr>



                                    {/foreach}

                                </tbody>
                            </table>
                            </div>
                            

                            </div>
                            <!-- /panel content -->

                            <!-- panel footer -->
                            <div class="panel-footer clearfix">
                                <a class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom" href="{$adminurl}/user.add.php?ugroup=5">{$lang49}</a>
                                
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
                                                <th class="width-150 text-center">{$lang30}</th>
                                                <th class="text-center">{$lang38}</th>
                                            </tr>
                                        </thead>

                                        <tbody>
                                            {insert name=get_user_list value=var user_group=3 assign=employerList}
                                            {foreach from=$employerList item=employer}
                                            <tr class="odd gradeX {if $employer['status'] eq "0"}warning {elseif $employer['status'] eq "2"}danger{/if}">


                                                <td class="align-middle text-center">
                                                     {$employer['username']|stripslashes}
                                                </td>
                                                <td class="align-middle text-center">
                                                    {$employer['fname']|stripslashes} {$employer['lname']|stripslashes}
                                                </td>

                                                <td class="text-center  align-middle">
                                                    <a href="#" class="btn btn-default btn-xs"><i class="fa fa-edit white"></i> {$lang35} </a>
                                                    <a href="#" class="btn btn-danger btn-xs"><i class="fa fa-times white"></i> {$lang34} </a>



                                                    <a href="#" data-toggle="popover" class="btn btn-3d btn-xs btn-blue" title="{$lang39} {$employer['fname']} {$employer['lname']}" data-content="<label>{$lang40}:</label> {$employer['last_ip']|farsidigit}<br/><label>{$lang41}:</label> {$employer['last_login']|jdate_format:"%Y/%m/%d"|farsidigit}<br/><label>{$lang32}:</label> {$employer['joined']|jdate_format:"%Y/%m/%d"|farsidigit}">
                                                        <i class="fa fa-bar-chart" aria-hidden="true"></i>
                                                        {$lang39}
                                                    </a>

                                                </td>
                                            </tr>



                                            {/foreach}

                                        </tbody>
                                    </table>
                                    </div>
                                    
								</div>
								<!-- /panel content -->

                                <!-- panel footer -->
                                <div class="panel-footer clearfix">
                                    <a class="btn btn-purple pull-right btn-sm nomargin-top nomargin-bottom" href="{$adminurl}/user.add.php?ugroup=3">{$lang50}</a>

                                </div>
                                <!-- /panel footer -->

							</div>
                        
                    </div>
                    
                        
                </div><!--End row -->
                    
                
                </div>
            </section>
        </div>
        


