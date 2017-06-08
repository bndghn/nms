<?php

/**
 * Gregorian to Jalali Convertor
 *
 * @author farsiweb.info
 * @access public
 * @param   int year
 * @param   int month
 * @param   int day
 * @return  array   converted time
 */
function smarty_function_g2j($g_y, $g_m, $g_d){
    $g_days_in_month = array(31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31);
    $j_days_in_month = array(31, 31, 31, 31, 31, 31, 30, 30, 30, 30, 30, 29);
    
    $gy = $g_y-1600;
    $gm = $g_m-1;
    $gd = $g_d-1;
    
    $g_day_no = 365*$gy+floor(($gy+3)/4)-floor(($gy+99)/100)+floor(($gy+399)/400);
    
    for ($i=0; $i < $gm; ++$i){
        $g_day_no += $g_days_in_month[$i];
    }
        
    if ($gm>1 && (($gy%4==0 && $gy%100!=0) || ($gy%400==0))){
        /* leap and after Feb */
        ++$g_day_no;
    }
        
    $g_day_no += $gd;
    $j_day_no = $g_day_no-79;
    $j_np = floor($j_day_no/12053);
    $j_day_no %= 12053;
    $jy = 979+33*$j_np+4*floor($j_day_no/1461);
    $j_day_no %= 1461;
    
    if ($j_day_no >= 366) {
        $jy += floor(($j_day_no-1)/365);
        $j_day_no = ($j_day_no-1)%365;
    }
    $j_all_days = $j_day_no+1;
    
    for ($i = 0; $i < 11 && $j_day_no >= $j_days_in_month[$i]; ++$i) {
        $j_day_no -= $j_days_in_month[$i];
    }
    
    $jm = $i+1;
    $jd = $j_day_no+1;
    
    return array($jy, $jm, $jd, $j_all_days);
}


 



?>