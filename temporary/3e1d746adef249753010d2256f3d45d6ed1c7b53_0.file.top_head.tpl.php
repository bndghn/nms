<?php
/* Smarty version 3.1.30, created on 2017-06-08 18:00:47
  from "C:\xampp\htdocs\nms\themes\administrator\top_head.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_593951879bbc48_43832428',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3e1d746adef249753010d2256f3d45d6ed1c7b53' => 
    array (
      0 => 'C:\\xampp\\htdocs\\nms\\themes\\administrator\\top_head.tpl',
      1 => 1496922850,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
  ),
),false)) {
function content_593951879bbc48_43832428 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!-- HEADER -->
			<header id="header">

				<!-- Mobile Button -->
				<button id="mobileMenuBtn"></button>

				<!-- Logo -->
				<span class="logo pull-left">
					<img src="<?php echo $_smarty_tpl->tpl_vars['assets']->value;?>
/images/logo_light.png" alt="admin panel" height="35" />
				</span>

				<form method="get" action="page-search.html" class="search pull-left hidden-xs">
					<input type="text" class="form-control" name="k" placeholder="<?php echo $_smarty_tpl->tpl_vars['lang19']->value;?>
 ..." />
				</form>

				<nav>

					<!-- OPTIONS LIST -->
					<ul class="nav pull-right">

						<!-- USER OPTIONS -->
						<li class="dropdown pull-left">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
								<img class="user-avatar" alt="" src="<?php echo $_smarty_tpl->tpl_vars['assets']->value;?>
/images/noavatar.jpg" height="34" /> 
								<span class="user-name">
									<span class="hidden-xs">
										 <?php echo stripslashes($_SESSION['ADMIN_FNAME']);?>
 <?php echo stripslashes($_SESSION['ADMIN_LNAME']);?>
<i class="fa fa-angle-down"></i>
									</span>
								</span>
							</a>
							<ul class="dropdown-menu hold-on-click">
								<li><!-- my calendar -->
									<a href="calendar.html"><i class="fa fa-calendar"></i> Calendar</a>
								</li>
								<li><!-- my inbox -->
									<a href="#"><i class="fa fa-envelope"></i> Inbox
										<span class="pull-right label label-default">0</span>
									</a>
								</li>
								<li><!-- settings -->
									<a href="page-user-profile.html"><i class="fa fa-cogs"></i> Settings</a>
								</li>

								<li class="divider"></li>

								<li><!-- lockscreen -->
									<a href="page-lock.html"><i class="fa fa-lock"></i> Lock Screen</a>
								</li>
								<li><!-- logout -->
									<a href="logout.php"><i class="fa fa-power-off"></i><?php echo $_smarty_tpl->tpl_vars['lang28']->value;?>
</a>
								</li>
							</ul>
						</li>
						<!-- /USER OPTIONS -->

					</ul>
					<!-- /OPTIONS LIST -->

				</nav>

			</header>
			<!-- /HEADER -->
            <?php }
}
