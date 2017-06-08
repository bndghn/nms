<?php
/**
 * Smarty plugin
 * @package Smarty
 * @subpackage plugins
 */

/**
 * Include the {@link shared.make_timestamp.php} plugin
 */
require_once(SMARTY_PLUGINS_DIR . 'shared.make_timestamp.php');
/**
 * Include the {@link function.jstfrtime.php} plugin
 */
require_once(SMARTY_PLUGINS_DIR . 'function.jstrftime.php');
/**
 * Smarty date_format modifier plugin
 *
 * Type:     modifier<br>
 * Name:     date_format<br>
 * Purpose:  format datestamps via strftime<br>
 * Input:<br>
 *         - string: input date string
 *         - format: strftime format for output
 *         - default_date: default date if $string is empty
 * @author   Arash Hemmat <arash  #at the#  hemmat  #dot#  info>
 * @param string
 * @param string
 * @param string
 * @return string|void
 * @uses smarty_make_timestamp()
 * @uses smarty_jstrftime()
 */
function smarty_modifier_jdate_format($string, $format="%b %e, %Y", $default_date=null)
{
    if($string != '') {
        return smarty_function_jstrftime($format, smarty_make_timestamp($string));
    } elseif (isset($default_date) && $default_date != '') {
        return smarty_function_jstrftime($format, smarty_make_timestamp($default_date));
    } else {
        return;
    }
}

/* vim: set expandtab: */

?>
