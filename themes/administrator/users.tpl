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

							<table class="table table-striped table-bordered table-hover" id="datatable_sample">
                                <thead>
                                    <tr>
                                        <th class="table-checkbox">
                                            <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                        </th>
                                        <th>{$lang12}</th>
                                        <th>{$lang14}</th>
                                        <th>Points</th>
                                        <th>Joined</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

	<tbody>
		<tr class="odd gradeX">
			<td>
				<input type="checkbox" class="checkboxes" value="1"/>
			</td>
			<td>
				 shuxer
			</td>
			<td>
				<a href="mailto:shuxer@gmail.com">
				shuxer@gmail.com </a>
			</td>
			<td>
				 120
			</td>
			<td class="center">
				 12 Jan 2012
			</td>
			<td>
				<span class="label label-sm label-success">
				Approved </span>
			</td>
		</tr>
		<tr class="odd gradeX">
			<td>
				<input type="checkbox" class="checkboxes" value="1"/>
			</td>
			<td>
				 looper
			</td>
			<td>
				<a href="mailto:looper90@gmail.com">
				looper90@gmail.com </a>
			</td>
			<td>
				 120
			</td>
			<td class="center">
				 12.12.2011
			</td>
			<td>
				<span class="label label-sm label-warning">
				Suspended </span>
			</td>
		</tr>
	</tbody>
</table>

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
        


