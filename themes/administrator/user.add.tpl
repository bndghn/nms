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
                    
                    <div class="row">

						<div class="col-md-6">
                    
					<div id="panel-2" class="panel panel-default">
						<div class="panel-heading">
							<span class="title elipsis">
								<strong>{$lang10}</strong> <!-- panel title -->
							</span>

							

						</div>

						<!-- panel content -->
						<div class="panel-body">

                                <form class="validate" action="php/contact.php" method="post" enctype="multipart/form-data" data-success="Sent! Thank you!" data-toastr-position="top-right">
                                    <fieldset>
                                        <!-- required [php action request] -->
                                        <input type="hidden" name="action" value="contact_send" />

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6">
                                                    <label>First Name *</label>
                                                    <input type="text" name="contact[first_name]" value="" class="form-control required">
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <label>Last Name *</label>
                                                    <input type="text" name="contact[last_name]" value="" class="form-control required">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6">
                                                    <label>Email *</label>
                                                    <input type="email" name="contact[email]" value="" class="form-control required">
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <label>Phone *</label>
                                                    <input type="text" name="contact[phone]" value="" class="form-control required">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <label>Position *</label>
                                                    <select name="contact[position]" class="form-control pointer required">
                                                        <option value="">--- Select ---</option>
                                                        <option value="Marketing">PR &amp; Marketing</option>
                                                        <option value="Developer">Web Developer</option>
                                                        <option value="php">PHP Programmer</option>
                                                        <option value="Javascript">Javascript Programmer</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-6 col-sm-6">
                                                    <label>Expected Salary *</label>
                                                    <input type="text" name="contact[expected_salary]" value="" class="form-control required">
                                                </div>
                                                <div class="col-md-6 col-sm-6">
                                                    <label>Start Date *</label>
                                                    <input type="text" name="contact[start_date]" value="" class="form-control datepicker required" data-format="yyyy-mm-dd" data-lang="en" data-RTL="false">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <label>Experience *</label>
                                                    <textarea name="contact[experience]" rows="4" class="form-control required"></textarea>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12 col-sm-12">
                                                    <label>
                                                        Website
                                                        <small class="text-muted">- optional</small>
                                                    </label>
                                                    <input type="text" name="contact[website]" placeholder="http://" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <div class="col-md-12">
                                                    <label>
                                                        File Attachment 
                                                        <small class="text-muted">Curriculum Vitae - optional</small>
                                                    </label>

                                                    <!-- custom file upload -->
                                                    <div class="fancy-file-upload fancy-file-primary">
                                                        <i class="fa fa-upload"></i>
                                                        <input type="file" class="form-control" name="contact[attachment]" onchange="jQuery(this).next('input').val(this.value);" />
                                                        <input type="text" class="form-control" placeholder="no file selected" readonly="" />
                                                        <span class="button">Choose File</span>
                                                    </div>
                                                    <small class="text-muted block">Max file size: 10Mb (zip/pdf/jpg/png)</small>

                                                </div>
                                            </div>
                                        </div>

                                    </fieldset>

                                    <div class="row">
                                        <div class="col-md-12">
                                            <button type="submit" class="btn btn-3d btn-teal btn-xlg btn-block margin-top-30">
                                                SEND APPLICATION
                                                <span class="block font-lato">We'll get back to you within 48 hours</span>
                                            </button>
                                        </div>
                                    </div>

                                </form>

                        </div>
						<!-- /panel content -->

						<!-- panel footer -->
						<div class="panel-footer">



						</div>
						<!-- /panel footer -->

					</div>
					<!-- /PANEL -->
                </div>
                <div class="col-md-6">
                    <div class="panel panel-default">
                        <div class="panel-body">

                            <h4>How it's working?</h4>
                            <p><em>This is a vrey unique feature because you don't need PHP programming if you want to send the form directly to email.</em></p>
                            <hr />
                            <p>
                                This form is using a validation plugin (automaticaly loaded by assets/js/app.js and a php to send files (php/contact.php)
                                You can add how many fields you want without changeing anything on Javascript or PHP
                            </p>

                        </div>
                    </div>
                </div>
            </div>
                </div>
            </section>
        </div>