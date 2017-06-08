<?php
/**
 * Include the {@link function.g2j.php} plugin
 * Include the {@link function.j2g.php} plugin
 */
require_once(SMARTY_PLUGINS_DIR . 'function.g2j.php');
require_once(SMARTY_PLUGINS_DIR . 'function.j2g.php');

/**
 * Format a string according to Jalali calendar
 *
 * @author  Omid Mottaghi
 * @access public
 * @param   string  Formatting string
 * @param   int     Timestamp to format
 * @return  string  Formatted local time/date according to locale settings
 */
function smarty_function_jstrftime($format, $timestamp='now') {
    if($timestamp=='now')
    	$timestamp=mktime();
    $g_d=date('j', $timestamp);
    $g_m=date('n', $timestamp);
    $g_y=date('Y', $timestamp);

    list($jy, $jm, $jd, $j_all_days) = smarty_function_g2j($g_y, $g_m, $g_d);

    $j_month_name = array('', '&#1601;&#1585;&#1608;&#1585;&#1583;&#1740;&#1606;', '&#1575;&#1585;&#1583;&#1740;&#1576;&#1607;&#1588;&#1578;', '&#1582;&#1585;&#1583;&#1575;&#1583;', '&#1578;&#1740;&#1585;',
            '&#1605;&#1585;&#1583;&#1575;&#1583;', '&#1588;&#1607;&#1585;&#1740;&#1608;&#1585;', '&#1605;&#1607;&#1585;', '&#1570;&#1576;&#1575;&#1606;', '&#1570;&#1584;&#1585;', '&#1583;&#1740;', '&#1576;&#1607;&#1605;&#1606;', '&#1575;&#1587;&#1601;&#1606;&#1583;');
    $j_week_name = array('Saturday' => '&#1588;&#1606;&#1576;&#1607;',
                        'Sunday' => '&#1740;&#1705; &#1588;&#1606;&#1576;&#1607;',
                        'Monday' => '&#1583;&#1608;&#1588;&#1606;&#1576;&#1607;',
                        'Tuesday' => '&#1587;&#1607; &#1588;&#1606;&#1576;&#1607;',
                        'Wednesday' => '&#1670;&#1607;&#1575;&#1585;&#1588;&#1606;&#1576;&#1607;',
                        'Thursday' => '&#1662;&#1606;&#1580;&#1588;&#1606;&#1576;&#1607;',
                        'Friday' => '&#1580;&#1605;&#1593;&#1607;',
                        'Sat' => '&#1588;',
                        'Sun' => '&#1740;',
                        'Mon' => '&#1583;',
                        'Tue' => '&#1587;',
                        'Wed' => '&#1670;',
                        'Thu' => '&#1662;',
                        'Fri' => '&#1580;');
    $j_week_number = array('Sat' => '1',
                           'Sun' => '2',
                           'Mon' => '3',
                           'Tue' => '4',
                           'Wed' => '5',
                           'Thu' => '6',
                           'Fri' => '7');
    
    // calculate string
    $output_str='';
    
    for ($i=0; $i<strlen($format); $i++){
        
        if($format[$i]=='%'){
            $i++;
            switch($format[$i]){
                case 'a':
                    $output_str.=$j_week_name[date('D', $timestamp)];
                    break;
                case 'A':
                    $output_str.=$j_week_name[date('l', $timestamp)];
                    break;
                case 'b':
                case 'B':
                case 'h':
                    $output_str.=$j_month_name[$jm];
                    break;
                case 'c':
                    $output_str.=smarty_function_jstrftime('%y/%m/%d %I:%M:%S', $timestamp);
                    break;
                case 'C':
                    $output_str.=floor($jy/100);
                    break;
                case 'd':
                    if($jd<10) $output_str.='0'.$jd; else $output_str.=$jd;
                    break;
                case 'D':
                    $output_str.=$jy.'/'.$jm.'/'.$jd;
                    break;
                case 'e':
                    if($jd<10) $output_str.=' '.$jd; else $output_str.=$jd;
                    break;
                case 'H':
                    $output_str.=date('H', $timestamp);
                    break;
                case 'I':
                    $output_str.=date('h', $timestamp);
                    break;
                case 'j':
                    $output_str.=sprintf("%03d", $j_all_days);
                    break;
                case 'm':
                    if($jm<10) $output_str.='0'.$jm; else $output_str.=$jm;
                    break;
                case 'M':
                    $output_str.=date('i', $timestamp);
                    break;
                case 'n':
                    $output_str.="\n";
                    break;
                case 'r':
                case 'p':
                    if(date('a',$timestamp)=='pm') $output_str.='&#1576;&#1593;&#1583; &#1575;&#1586; &#1592;&#1607;&#1585;'; else $output_str.='&#1602;&#1576;&#1604; &#1575;&#1586; &#1592;&#1607;&#1585;';
                    break;
                case 'R':
                    $output_str.=strftime('%R', $timestamp);
                    break;
                case 'S':
                    $output_str.=date('s', $timestamp);
                    break;
                case 't':
                    $output_str.="\t";
                    break;
                case 'T':
                	$output_str.=smarty_function_jstrftime('%H:%M:%S', $timestamp);
                	break;
                case 'U':
                case 'V':
                case 'W':
                    $output_str.=sprintf("%02d", floor(($j_all_days+1)/7));
                    break;
                case 'u':
                case 'w':
                    $output_str.=$j_week_number[date('D', $timestamp)];
                    break;
                case 'x':
                    $output_str.=smarty_function_jstrftime('%y/%m/%d', $timestamp);
                    break;
                case 'X':
                    $output_str.=smarty_function_jstrftime('%I:%M:%S', $timestamp);
                    break;
                case 'g':
                case 'y':
                    $output_str.=$jy-(floor($jy/100)*100);
                    break;
                case 'G':
                case 'Y':
                    $output_str.=$jy;
                    break;
                case 'z':
                case 'Z':
                    $output_str.=smarty_function_jstrftime('%z', $timestamp);
                    break;
                case '%':
                    $output_str.='%';
                    break;
            }
        }else{
            $output_str.=$format[$i];
        }
    }
    
    return $output_str;
}

?>
