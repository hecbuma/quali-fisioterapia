
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}">
	<head>
		<title>{$meta_title|escape:'htmlall':'UTF-8'}</title>
{if isset($meta_description) AND $meta_description}
		<meta name="description" content="{$meta_description|escape:html:'UTF-8'}" />
{/if}
{if isset($meta_keywords) AND $meta_keywords}
		<meta name="keywords" content="{$meta_keywords|escape:html:'UTF-8'}" />
{/if}
		<meta http-equiv="Content-Type" content="application/xhtml+xml; charset=utf-8" />
		<meta name="robots" content="{if isset($nobots)}no{/if}index,follow" />
		<link rel="icon" type="image/vnd.microsoft.icon" href="{$img_ps_dir}favicon.ico?{$time}" />
		<link rel="shortcut icon" type="image/x-icon" href="{$img_ps_dir}favicon.ico?{$time}" />
		<script type="text/javascript">
			var baseDir = '{$content_dir}';
			var static_token = '{$static_token}';
			var token = '{$token}';
			var priceDisplayPrecision = {$priceDisplayPrecision*$currency->decimals};
			var priceDisplayMethod = {$priceDisplay};
			var roundMode = {$roundMode};
                </script>
{if isset($css_files)}
	{foreach from=$css_files key=css_uri item=media}
	<!--<link href="{$css_uri}" rel="stylesheet" type="text/css" media="{$media}" />-->
	{/foreach}
{/if}
{if isset($js_files)}
	{foreach from=$js_files item=js_uri}
	<script type="text/javascript" src="{$js_uri}"></script>
	{/foreach}
{/if}
		{$HOOK_HEADER}


        <link rel="stylesheet" type="text/css" href="{$base_dir_ssl}themes/quali-cursos/stylesheets/reset.css" media="all" />
        <link rel="stylesheet" type="text/css" href="{$base_dir_ssl}themes/quali-cursos/stylesheets/style.css" media="all" />
        
        <script src="{$base_dir_ssl}themes/quali-cursos/javascripts/cufon-yui.js" type="text/javascript"></script>
	<script src="{$base_dir_ssl}themes/quali-cursos/javascripts/Futura_Hv_BT_400.font.js" type="text/javascript"></script>
	<script type="text/javascript">
	    Cufon.replace('h1');
	</script>

	</head>
	
	<body {if $page_name}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if}>
	{if !$content_only}

        <div id="site">

            <div id="topo">

                <div id="login-form">
                
                </div>
<!--
                <img id="imagem-marca-dagua" src="images/logo-marca-dagua-fundo-laranja.png"/>
-->

                <ul id="menu">
                    <li>Salvador</li> 
                    <li>Vitória</li>               
                    <li>Belo Horizonte</li>
                    <li>Rio de Janeiro</li>
                    <li>Início</li>
                </ul>
               
            </div>

            <div id="meio">

	{/if}
