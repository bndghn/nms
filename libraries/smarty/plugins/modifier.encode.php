<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 * @author Benyamin Dehqanian
 * crypt str
 * http://www.beny.online
 */

function smarty_modifier_encode($str)
{
        $encodeStr = base64_encode("id".$str);
        return $encodeStr;
}
?>