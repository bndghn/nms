<!-- JAVASCRIPT FILES -->
        {literal}
		<script type="text/javascript">var plugin_path = '{/literal}{$assets}{literal}/plugins/';</script>
		<script type="text/javascript" src="{/literal}{$assets}{literal}/plugins/jquery/jquery-2.1.4.min.js"></script>
		<script type="text/javascript" src="{/literal}{$assets}{literal}/js/app.js"></script>
        {/literal}
        {if isset($tsError)}
          {literal}
           <script type="text/javascript">
               _toastr({/literal}"{$tsError}"{literal},"top-full-width","error",false);
           </script>
           {/literal}
        {/if}
        
       
	</body>
</html>