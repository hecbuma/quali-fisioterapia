<?php
/*
* 2007-2011 PrestaShop 
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2011 PrestaShop SA
*  @version  Release: $Revision: 1.4 $
*  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

class StoresControllerCore extends FrontController
{
	public function __construct()
	{
		$this->php_self = 'stores.php';
	
		parent::__construct();
	}
	
	public function preProcess()
	{
		global $smarty, $cookie;
		
		$simplifiedStoreLocator = Configuration::get('PS_STORES_SIMPLIFIED');
		$distanceUnit = Configuration::get('PS_DISTANCE_UNIT');
		if (!in_array($distanceUnit, array('km', 'mi')))
			$distanceUnit = 'km';
		
		if ($simplifiedStoreLocator)
		{
			$stores = Db::getInstance()->ExecuteS('
			SELECT s.*, cl.name country, st.iso_code state
			FROM '._DB_PREFIX_.'store s
			LEFT JOIN '._DB_PREFIX_.'country_lang cl ON (cl.id_country = s.id_country)
			LEFT JOIN '._DB_PREFIX_.'state st ON (st.id_state = s.id_state)
			WHERE s.active = 1 AND cl.id_lang = '.(int)($cookie->id_lang));
			
			foreach ($stores AS &$store)
				$store['has_picture'] = file_exists(_PS_STORE_IMG_DIR_.(int)($store['id_store']).'.jpg');
		}
		else
		{		
			if (Tools::getValue('all') == 1)
			{		
				$stores = Db::getInstance()->ExecuteS('
				SELECT s.*, cl.name country, st.iso_code state
				FROM '._DB_PREFIX_.'store s
				LEFT JOIN '._DB_PREFIX_.'country_lang cl ON (cl.id_country = s.id_country)
				LEFT JOIN '._DB_PREFIX_.'state st ON (st.id_state = s.id_state)
				WHERE s.active = 1 AND cl.id_lang = '.(int)($cookie->id_lang));
			}
			else
			{
				$distance = (int)(Tools::getValue('radius', 100));
				$multiplicator = ($distanceUnit == 'km' ? 6371 : 3959);
					
				$stores = Db::getInstance()->ExecuteS('
				SELECT s.*, cl.name country, st.iso_code state,
				('.(int)($multiplicator).' * acos(cos(radians('.(float)(Tools::getValue('latitude')).')) * cos(radians(latitude)) * cos(radians(longitude) - radians('.(float)(Tools::getValue('longitude')).')) + sin(radians('.(float)(Tools::getValue('latitude')).')) * sin(radians(latitude)))) distance
				FROM '._DB_PREFIX_.'store s
				LEFT JOIN '._DB_PREFIX_.'country_lang cl ON (cl.id_country = s.id_country)
				LEFT JOIN '._DB_PREFIX_.'state st ON (st.id_state = s.id_state)
				WHERE s.active = 1 AND cl.id_lang = '.(int)($cookie->id_lang).'
				HAVING distance < '.(int)($distance).'
				ORDER BY distance ASC
				LIMIT 0,20');
			}

			if (Tools::getValue('ajax') == 1)
			{
				$dom = new DOMDocument('1.0');
				$node = $dom->createElement('markers');
				$parnode = $dom->appendChild($node);

				$days[1] = 'Monday';
				$days[2] = 'Tuesday';
				$days[3] = 'Wenesday';
				$days[4] = 'Thursday';
				$days[5] = 'Friday';
				$days[6] = 'Saturday';
				$days[7] = 'Sunday';
				
				foreach ($stores AS $store)
				{
					$node = $dom->createElement('marker');
					$newnode = $parnode->appendChild($node);
					$newnode->setAttribute('name', $store['name']);
					$address = $store['address1'].(!empty($store['address2']) ? '<br />'.$store['address2'] : '').'<br />'.$store['postcode'].' '.$store['city'].', '.$store['state'].'<br />'.$store['country'];
					$other = '';
					if (!empty($store['hours']))
					{
						$hours = unserialize($store['hours']);
						$other .= '<br /><br /><span style="font-weight: bold; text-decoration: underline; width: 80px; height: 15px; display: block;">Hours:</span>
						<table style="font-size: 9px;">';
						for ($i = 1; $i < 8; $i++)
							$other .= '<tr><td style="width: 70px;">'.$days[$i].'</td><td>'.$hours[(int)($i) - 1].'</td></tr>';
						$other .= '
						</table>';
					}
					
					$newnode->setAttribute('addressNoHtml', strip_tags(str_replace('<br />', ' ', $address)));
					$newnode->setAttribute('address', $address);
					$newnode->setAttribute('other', $other);
					$newnode->setAttribute('phone', $store['phone']);
					$newnode->setAttribute('id_store', (int)($store['id_store']));
					$newnode->setAttribute('has_store_picture', file_exists(_PS_STORE_IMG_DIR_.(int)($store['id_store']).'.jpg'));
					$newnode->setAttribute('lat', (float)($store['latitude']));
					$newnode->setAttribute('lng', (float)($store['longitude']));
					
					if (isset($store['distance']))
						$newnode->setAttribute('distance', (int)($store['distance']));
				}
				
				header('Content-type: text/xml');
				die($dom->saveXML());
			}
			else
				$smarty->assign('hasStoreIcon', file_exists(dirname(__FILE__).'/../img/logo_stores.gif'));
		}
		
		$smarty->assign(array('distance_unit' => $distanceUnit, 'simplifiedStoresDiplay' => $simplifiedStoreLocator, 'stores' => $stores, 'mediumSize' => Image::getSize('medium')));
	}

	public function process()
	{
		parent::process();
		
		self::$smarty->assign(array(
			'defaultLat' => (float)Configuration::get('PS_STORES_CENTER_LAT'),
			'defaultLong' => (float)Configuration::get('PS_STORES_CENTER_LONG')
		));
	}

	public function setMedia()
	{
		parent::setMedia();
		Tools::addCSS(_THEME_CSS_DIR_.'stores.css');
		if (!Configuration::get('PS_STORES_SIMPLIFIED'))
			Tools::addJS(_THEME_JS_DIR_.'stores.js');
		Tools::addJS('http://maps.google.com/maps/api/js?sensor=true');
	}
	
	public function displayContent()
	{
		parent::displayContent();
		self::$smarty->display(_PS_THEME_DIR_.'stores.tpl');
	}
}
