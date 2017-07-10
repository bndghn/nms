{foreach from=$cities  item=city }

 <option value="{$city['id']}" {if $city['id'] eq $def_city} selected {/if}>{$city['city_name']}</option>
{/foreach}