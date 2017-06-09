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

							<!-- right options -->
							<ul class="options pull-right list-inline">
								<li><a href="#" class="opt panel_colapse" data-toggle="tooltip" title="Colapse" data-placement="bottom"></a></li>
								<li><a href="#" class="opt panel_fullscreen hidden-xs" data-toggle="tooltip" title="Fullscreen" data-placement="bottom"><i class="fa fa-expand"></i></a></li>
								<li><a href="#" class="opt panel_close" data-confirm-title="Confirm" data-confirm-message="Are you sure you want to remove this panel?" data-toggle="tooltip" title="Close" data-placement="bottom"><i class="fa fa-times"></i></a></li>
							</ul>
							<!-- /right options -->

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
        {foreach from=$users item=user}
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
						<div class="panel-footer">



						</div>
						<!-- /panel footer -->

					</div>
					<!-- /PANEL -->
                
                </div>
            </section>
        </div>
        


