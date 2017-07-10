<?php

include('../core/config.php');


(isset($_POST['state_id']) ? $stateid =intval($_POST['state_id']) : $stateid = 0 );
(isset($_POST['cid']) ? $cityId =intval($_POST['cid']) : $cityId = 0 );

if($stateid !=0){
  
  $cities = get_cities($stateid);
  
  
  STemplate::assign('cities',$cities);
  STemplate::assign('def_city',$cityId);
  STemplate::display('administrator/cities.tpl');
  
}
