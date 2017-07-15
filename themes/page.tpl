{extends file="main.tpl"} 


{insert name=get_page value=var  assign=page slug=$slug status=1}


{block name="hear"}
<li class="active">{$page['title']|stripslashes}</li>
{/block}


{block name="main"}



<div class="col-md-12">
   <div class="panel panel-default">
      <div class="panel-heading"><i class="fa fa-book"></i> {$page['title']|stripslashes}</div>
      <div class="panel-body">
        
         {$page['content']|stripslashes}
        
         
      </div>
   </div>
</div>

{/block}