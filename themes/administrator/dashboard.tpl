<!-- WRAPPER -->
  
		<div id="wrapper" class="clearfix">

			{include file='administrator/aside.tpl'}
            
			{include file='administrator/top_head.tpl'}


			


			<!-- 
				MIDDLE 
			-->
			<section id="middle">
				<div id="content" class="dashboard padding-20">

					
                   


					<!-- BOXES -->
					<div class="row">

						<!-- Feedback Box -->
						<div class="col-md-3 col-sm-6">

							<!-- BOX -->
							<div class="box danger"><!-- default, danger, warning, info, success -->

								<div class="box-title"><!-- add .noborder class if box-body is removed -->
									<h4><a href="#">پیام ها </a></h4>
									<h4 class="block">5</h4>
									<i class="fa fa-comments"></i>
								</div>


							</div>
							<!-- /BOX -->

						</div>

						<!-- Profit Box -->
						<div class="col-md-3 col-sm-6">

							<!-- BOX -->
							<div class="box warning"><!-- default, danger, warning, info, success -->

								<div class="box-title"><!-- add .noborder class if box-body is removed -->
									<h4>سفارش ها </h4>
									<h4 class="block">5 </h4>
									<i class="fa fa-bar-chart-o"></i>
								</div>


							</div>
							<!-- /BOX -->

						</div>

						<!-- Orders Box -->
						<div class="col-md-3 col-sm-6">
                           
							<!-- BOX -->
							<div class="box default"><!-- default, danger, warning, info, success -->
                              
								<div class="box-title"><!-- add .noborder class if box-body is removed -->
									 {insert name=get_pro_count value=var  assign=pro_counter}
                                  <h4>محصولات </h4>
									 
									<h4 class="block"> {$pro_counter|stripslashes|farsidigit} </h4>
									<i class="fa fa-shopping-cart"></i>
								</div>

								

							</div>
							<!-- /BOX -->

						</div>

						<!-- Online Box -->
						<div class="col-md-3 col-sm-6">

							<!-- BOX -->
							<div class="box success"><!-- default, danger, warning, info, success -->
                            {insert name=get_users_count value=var  customer=1 verified=1 assign=customerConutVerified}
                             
								<div class="box-title"><!-- add .noborder class if box-body is removed -->
									<h4>مشتریان  </h4>
									<h4 class="block"> {$customerConutVerified|stripslashes|farsidigit} </h4>
									<i class="fa fa-globe"></i>
								</div>
							</div>
							<!-- /BOX -->
						</div>
					</div>
					<!-- /BOXES -->



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
										<strong>آخرین اتفاقات</strong> <!-- panel title -->
									</span>

									<!-- tabs nav -->
									<ul class="nav nav-tabs pull-right">
										<li class="active"><!-- TAB 1 -->
											<a href="#ttab1_nobg" data-toggle="tab">آخرین سفارشات</a>
										</li>
										<li class=""><!-- TAB 2 -->
											<a href="#ttab2_nobg" data-toggle="tab">آخرین مشتریان</a>
										</li>
									</ul>
									<!-- /tabs nav -->


								</div>

								<!-- panel content -->
								<div class="panel-body">
									<!-- tabs content -->
									<div class="tab-content transparent">
										<div id="ttab1_nobg" class="tab-pane active"><!-- TAB 1 CONTENT -->
											<div class="table-responsive">
												<table class="table table-striped table-hover table-bordered">
													<thead>
														<tr>
															<th class="text-center align-middle">عنوان محصول</th>
															<th class="text-center align-middle">دسته محصول</th>
															<th class="text-center align-middle">تعداد</th>
															<th class="text-center align-middle">عملیات </th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td></td>
															<td></td>
															<td></td>
															<td></td>
														</tr>
													</tbody>
												</table>
											</div>
										</div><!-- /TAB 1 CONTENT -->
										
										<div id="ttab2_nobg" class="tab-pane"><!-- TAB 2 CONTENT -->
											<div class="table-responsive">
												<table class="table table-striped table-hover table-bordered">
													<thead>
														<tr>
                                                            <th class="width-100 text-center">{$lang12}</th>
                                                            <th class="width-150 text-center">ایمیل</th>
                                                            <th class="width-100 text-center">تلفن همراه</th>
                                                            <th class="text-center">{$lang38}</th>
														</tr>
													</thead>
													<tbody>
														 {insert name=get_user_list value=var order=1 customer=1 limited=10 verified=1 status=1  assign=usersListNV }
                                                        {if $usersListNV ne null}
                                                        {foreach from=$usersListNV item=usernv}
                                                        <tr class="odd gradeX {if $usernv['user_status'] eq "0"}warning{/if}">
                                                          <td class="align-middle text-center">
                                                               {$usernv['username']|stripslashes}
                                                          </td>
                                                          <td class="align-middle text-center">
                                                              {$usernv['email']|stripslashes}
                                                          </td>
                                                          <td class="align-middle text-center">
                                                              {$usernv['mobile']|farsidigit}
                                                          </td>
                                                          <td class="text-center  align-middle">
                                                              
                                                              <a href="{$adminurl}/users.profile.php?id={$usernv['userid']}" class="btn btn-3d btn-xs btn-blue"><i class="fa fa-user" aria-hidden="true"></i>پروفایل</a>
                                                          </td>
                                                        </tr>
                                                        {/foreach}
                                                        {else}
                                                        <tr>
                                                            <td colspan="6"><p class="text-center">متاسفانه کاربری یافت نشد!</p></td>
                                                        </tr>
                                                        {/if}
													</tbody>
												</table>
											</div>
										</div><!-- /TAB 1 CONTENT -->
									</div>
									<!-- /tabs content -->
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
										<strong>پیام ها</strong> <!-- panel title -->
									</span>
								</div>

								<!-- panel content -->
								<div class="panel-body">

									<ul class="list-unstyled list-hover slimscroll height-300" data-slimscroll-visible="true">
										
										<li>
											<span class="label label-danger"><i class="fa fa-bell-o size-15"></i></span>
                                        </li>

										<li>
											<span class="label label-success"><i class="fa fa-user size-15"></i></span>
										
										</li>

										<li>
											<span class="label label-warning"><i class="fa fa-comment size-15"></i></span>
										
										</li>

										<li>
											<span class="label label-default"><i class="fa fa-briefcase size-15"></i></span>
										
										</li>

										<li>
											<span class="label label-info"><i class="fa fa-shopping-cart size-15"></i></span>
											
										</li>

										<li>
											<span class="label label-success"><i class="fa fa-bar-chart-o size-15"></i></span>
											
										</li>

										<li>
											<span class="label label-success bg-black"><i class="fa fa-cogs size-15"></i></span>
											
										</li>

										<li>
											<span class="label label-warning"><i class="fa fa-file-excel-o size-15"></i></span>
											
										</li>

										
									</ul>

								</div>
								<!-- /panel content -->

								<!-- panel footer -->
                                <!-- /panel footer -->

							</div>
							<!-- /PANEL -->

						</div>

					</div>

				</div>
			</section>
			<!-- /MIDDLE -->

		</div>