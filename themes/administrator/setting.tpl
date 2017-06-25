<!-- WRAPPER -->
		<div id="wrapper" class="clearfix">

			{include file='administrator/aside.tpl'}
            
			{include file='administrator/top_head.tpl'}


			


			<!-- 
				MIDDLE 
			-->
			<section id="middle">
				<div id="content" class="dashboard padding-20">

					
                   


					



					<div class="row">

						<div class="col-md-6">

							<!-- 
								PANEL CLASSES:
									panel-default
									panel-danger
									panel-warning
									panel-info
									panel-success

								INFO: 	panel collapse - stored on user localStorage (handled by app.js _panels() function).
										All pannels should have an unique ID or the panel collapse status will not be stored!
							-->
							<div id="panel-2" class="panel panel-default">
								<div class="panel-heading">
									<span class="title elipsis">
										<strong>تنظیمات پایه</strong> <!-- panel title -->
									</span>

									


								</div>

								<!-- panel content -->
								<div class="panel-body">
                                    <p>تنظیمات پایه وب سایت در این قسمت قابل تنظیم است. با کلیک روی مقادیر می توانید مقدار پیشفرض آن را تغییر دهید. فراموش نکنید که این تنظیمات مستقیم روی وب سایت و رتبه سئو شما تاثیر گذار خواهد بود. لذا قبل از تغییر با متخصیین سئو مشورت نمایید.</p>
									<table id="setting" class="table table-bordered table-striped">
									    <tbody> 
                                            <tr>         
                                                <td width="35%">عنوان سایت</td>
                                                <td width="65%"><a href="#" id="username" data-type="text" data-pk="1" data-title="عنوان سایت">{$site_name}</a></td>
                                            </tr>
                                            <tr>         
                                                <td width="35%">توضیحات سایت</td>
                                                <td width="65%"><a href="#" id="description">{$meta_description}</a></td>
                                            </tr>
                                        </tbody>
									
                                    </table>

								</div>
								<!-- /panel content -->

							</div>
							<!-- /PANEL -->
					
						</div>

						<div class="col-md-6">

							<!-- 
								PANEL CLASSES:
									panel-default
									panel-danger
									panel-warning
									panel-info
									panel-success

								INFO: 	panel collapse - stored on user localStorage (handled by app.js _panels() function).
										All pannels should have an unique ID or the panel collapse status will not be stored!
							-->
							<div id="panel-3" class="panel panel-default">
								<div class="panel-heading">
									<span class="title elipsis">
										<strong>تنظیمات محلی</strong> <!-- panel title -->
									</span>
								</div>

								<!-- panel content -->
								<div class="panel-body">
                                    
                                    تنظیمات محلی در اینجا قرار میگیرد.
									

								</div>
								<!-- /panel content -->

								

							</div>
							<!-- /PANEL -->

						</div>

					</div>

				</div>
			</section>
			<!-- /MIDDLE -->

		</div>
        
    