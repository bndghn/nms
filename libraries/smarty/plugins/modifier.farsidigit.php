<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 * @author ebrahim babavant
 * convert english digit to farsi digit
 * http://www.azartools.com
 */

function smarty_modifier_farsidigit($str)
{
        $fa_digits = array('۰','۱','۲','۳','۴','۵','۶','۷','۸','۹');
        $en_digits = array('0','1','2','3','4','5','6','7','8','9');
        $str = str_replace($en_digits, $fa_digits, $str);
        return $str;
}
?>