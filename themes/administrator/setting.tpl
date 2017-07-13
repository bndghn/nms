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
									
                                     <div class="padding-15">
                    
                        <form action="{$adminurl}/users.add.php" method="post" class="form-horizontal margin-bottom-0">   
                             <div class="form-group">
                                 
                                <div class="col-sm-12">
                                  <label>نام سایت</label>
                                  <input type="text" class="form-control" id="site_name" value="{$site_name}" placeholder="عنوان سایت" name="site_name">
                                </div>
                              </div>
                            
                             

                              
                            <div class="form-group">
                                <div class="col-md-12 col-sm-12">
                                    <label> توضیحات </label>
                                    <textarea name="meta_description" rows="4" class="form-control">{$meta_description}</textarea>
                                </div>
                            </div>
                               
                        
                              <div class="form-group">
                                 
                                <div class="col-sm-12">
                                 <label>پست الکترونیکی</label>
                                  <input type="text" class="form-control ltr"  placeholder=" پست الکترونیک" name="email">
                                </div>
                              </div> 

                              <div class="form-group margin-bottom-0">
                                <div class=" col-sm-12">
                                <input type="hidden" name="isSubmit" value="1"/>
                                  <button type="submit" class="btn btn-success btn-block">ثبت در سامانه</button>
                                </div>
                              </div>
                        </form>
                    </div>
                                    
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
        
    