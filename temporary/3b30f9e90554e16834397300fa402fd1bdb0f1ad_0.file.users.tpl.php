<?php
/* Smarty version 3.1.30, created on 2017-06-08 19:27:40
  from "C:\xampp\htdocs\nms\themes\administrator\users.tpl" */

/* @var Smarty_Internal_Template $_smarty_tpl */
if ($_smarty_tpl->_decodeProperties($_smarty_tpl, array (
  'version' => '3.1.30',
  'unifunc' => 'content_593965e406f363_73630051',
  'has_nocache_code' => false,
  'file_dependency' => 
  array (
    '3b30f9e90554e16834397300fa402fd1bdb0f1ad' => 
    array (
      0 => 'C:\\xampp\\htdocs\\nms\\themes\\administrator\\users.tpl',
      1 => 1496933857,
      2 => 'file',
    ),
  ),
  'includes' => 
  array (
    'file:administrator/aside.tpl' => 1,
    'file:administrator/top_head.tpl' => 1,
  ),
),false)) {
function content_593965e406f363_73630051 (Smarty_Internal_Template $_smarty_tpl) {
?>
<!-- WRAPPER -->
		<div id="wrapper" class="clearfix">

			<?php $_smarty_tpl->_subTemplateRender("file:administrator/aside.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

            
			<?php $_smarty_tpl->_subTemplateRender("file:administrator/top_head.tpl", $_smarty_tpl->cache_id, $_smarty_tpl->compile_id, 0, $_smarty_tpl->cache_lifetime, array(), 0, false);
?>

            
            <section id="middle">


				<!-- page title -->
				<header id="page-header">
					<h1><?php echo $_smarty_tpl->tpl_vars['lang8']->value;?>
</h1>
					<ol class="breadcrumb">
						<li><a href="#"><?php echo $_smarty_tpl->tpl_vars['lang9']->value;?>
</a></li>
						<li class="active"><?php echo $_smarty_tpl->tpl_vars['lang6']->value;?>
</li>
					</ol>
				</header>
				<!-- /page title -->


				<div id="content" class="padding-20">
                
                    
					<div id="panel-2" class="panel panel-default">
						<div class="panel-heading">
							<span class="title elipsis">
								<strong><?php echo $_smarty_tpl->tpl_vars['lang10']->value;?>
</strong> <!-- panel title -->
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
                                        <th class="table-checkbox text-center width-20">
                                            <input type="checkbox" class="group-checkable" data-set="#datatable_sample .checkboxes"/>
                                        </th>
                                        <th class="width-30"><?php echo $_smarty_tpl->tpl_vars['lang31']->value;?>
</th>
                                        <th><?php echo $_smarty_tpl->tpl_vars['lang12']->value;?>
</th>
                                        <th><?php echo $_smarty_tpl->tpl_vars['lang30']->value;?>
</th>
                                        <th><?php echo $_smarty_tpl->tpl_vars['lang15']->value;?>
</th>
                                        <th>Joined</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>

	<tbody>
        <?php
$_from = $_smarty_tpl->smarty->ext->_foreach->init($_smarty_tpl, $_smarty_tpl->tpl_vars['users']->value, 'user');
if ($_from !== null) {
foreach ($_from as $_smarty_tpl->tpl_vars['user']->value) {
?>
        <tr class="odd gradeX">
			<td class="text-center">
				<input type="checkbox" class="checkboxes" value="1"/>
			</td>
            <td class="text-center">
                <?php if ($_smarty_tpl->tpl_vars['user']->value['gender'] == "0") {?>
                <img src="<?php echo $_smarty_tpl->tpl_vars['assets']->value;?>
/images/male.png"/>
                <?php } else { ?>
                <img src="<?php echo $_smarty_tpl->tpl_vars['assets']->value;?>
/images/female.png"/>
                <?php }?>
			</td>
			<td>
				 <?php echo $_smarty_tpl->tpl_vars['user']->value['username'];?>

			</td>
			<td>
				<?php echo $_smarty_tpl->tpl_vars['user']->value['fname'];?>
 <?php echo $_smarty_tpl->tpl_vars['user']->value['lname'];?>

			</td>
			<td>
				 <?php echo $_smarty_tpl->tpl_vars['user']->value['mobile'];?>

			</td>
			<td class="center">
				 12 Jan 2012
			</td>
			<td>
				<span class="label label-sm label-success">
				Approved </span>
			</td>
		</tr>
           
        <?php
}
}
$_smarty_tpl->smarty->ext->_foreach->restore($_smarty_tpl);
?>

		
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
        


<?php }
}
