{extends file="administrator/main.tpl"}
 
        
{block name = "mTitle"} مدیریت صفحات{/block}
{block name = "sTitle"} فهرست برگه‌ها{/block}
{block name = "pTitle"} برگه جدید{/block}


{block name = "main"}
          
<div class="col-md-12 col-sm-12">
	<div class="panel panel-default">
		<div class="panel-heading">
			<span class="title elipsis">
				<strong>فهرست صفحات</strong> <!-- panel title -->
			</span>
		</div>
		<div class="panel-body">

<div class="table-responsive">
	<table class="table table-striped table-bordered table-hover" id="datatable_admin">
	<thead>
		<tr>
			<th class="text-center">عنوان صفحه</th>
			<th class="width-200 text-center">وضعیت</th>
			<th class="text-center width-300 ">{$lang38}</th>
		</tr>
		</thead>
		<tbody>
			{insert name=get_pages  assign=pages}
			{if $pages eq null}
			<tr>
			  <td colspan="3"><p class="text-center">برگه ای هنوز ایجاد نشده است.!</p></td>
            </tr>
			{else}
			{foreach from=$pages item=page}
			<tr>
				<td  class=""> برگه <a href="{$baseurl}/page/{$page['slug']}" target="_blank">{$page['title']} </a></td>
				<td  class="text-center">{if $page['pg_status'] eq "1"}منتشر شده{else}عدم انتشار{/if}</td>
				<td  class="text-center">
					<a href="{$adminurl}/pages.edit.php?id={$page['pgid']}" class="btn btn-default btn-xs" data-target="#uEdit{$employer['userid']}" data-toggle="modal"><i class="fa fa-edit white"></i> {$lang35} </a>
                    <a href="{$adminurl}/pages.php?delete={$page['pgid']}" class="btn btn-danger btn-xs"><i class="fa fa-times white" onclick="{literal} return confirm('آیا از حذف این صفحه مطمئن هستید؟!');{/literal}"></i> {$lang34} </a>
				</td>
			</tr>
			{/foreach}
			{/if}
			
		</tbody>
	</table>
</div>

		</div>
	</div>
</div>
          
{/block}