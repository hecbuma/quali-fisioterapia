<?php

	// Init
	$sql = array();
	$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'fedex_rate_service_code`;';	
	$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'fedex_cache`;';
	$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'fedex_cache_test`;';
	$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'fedex_rate_config`;';
	$sql[] = 'DROP TABLE IF EXISTS `'._DB_PREFIX_.'fedex_rate_config_service`;';

?>
