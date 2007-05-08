<?php

class Bral_Util_ConvertDate {
  
  /* Convertit un datetime mysql vers un timestamp
   * @return timestamp
   */
  function get_epoch_mysql_datetime($date) {
    $break = explode(" ", $date);
    $datebreak = explode("-", $break[0]);
    $time = explode(":", $break[1]);
    $epoch = date("U", mktime($time[0],$time[1],$time[2],$datebreak[1],$datebreak[2],$datebreak[0]));
    return $epoch;
  }
  
  /* Ajoute une heure (H:m:s) a un datetime mysql et
   * retourne le resultat en timestamp
   * @return timestamp
   */
  function get_epoch_add_time_to_date($date, $add_time) {
    $break = explode(" ", $date);
    $datebreak = explode("-", $break[0]);
    $time = explode(":", $break[1]);
    $add_time = explode(":", $add_time);
    $epoch = date("U", mktime($time[0]+$add_time[0],$time[1]+$add_time[1],$time[2]+$add_time[2],
			      $datebreak[1],$datebreak[2],$datebreak[0]));
    
    return $epoch;
  }

  /* Ajoute une heure (H:m:s) a un datetime mysql et 
   * retourne le resultat en date
   * @return date
   */
  function get_date_add_time_to_date($date, $add_time) {
    return date("Y-m-d H:i:s", $this->get_epoch_add_time_to_date($date, $add_time));
  }

  function get_divise_time_to_time($time, $div) {
  	$time = explode(":", $time);
  	
  	$h = $time[0] * 3600;
  	$m = $time[1] * 60;
  	$s = $time[2] * 1;
  	$n = $h + $m + $s;
  	$n2 = $n / 2;
  	$r = $n2;
  	$h2 = intval($n2/3600);
  	$restant = $n2- ($h2 * 3600);
  	$m2 = intval($restant / 60);
  	$restant = $restant - ($m2 * 60);
  	$s2 = intval($restant);
  	$r = $h2.":".$m2.":".$s2;
  	return $r;
  }
  
  public function __construct() {
    
  }
}
