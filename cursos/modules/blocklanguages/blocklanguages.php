<?php
/*
* 2007-2011 PrestaShop 
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*/

if (!defined('_CAN_LOAD_FILES_'))
	exit;

class BlockLanguages extends Module
{
	function __construct()
	{
		$this->name = 'blocklanguages';
		$this->tab = 'front_office_features';
		$this->version = 0.1;
		$this->author = 'PrestaShop';

		parent::__construct();

		$this->displayName = $this->l('Language block');
		$this->description = $this->l('Adds a block for selecting a language.');
	}

	function install()
	{
		return (parent::install() AND $this->registerHook('top') AND $this->registerHook('header'));
	}

	/**
	* Returns module content for header
	*
	* @param array $params Parameters
	* @return string Content
	*/
	function hookTop($params)
	{
		global $smarty;
		$languages = Language::getLanguages();
		if (!sizeof($languages))
			return '';
		$smarty->assign('languages', $languages);
		return $this->display(__FILE__, 'blocklanguages.tpl');
	}
	
	function hookHeader($params)
	{
		Tools::addCSS(($this->_path).'blocklanguages.css', 'all');
	}
}


