<!doctype html>
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="{$lang_iso}" class="no-js">
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

        <script src="/cursos/themes/quali-cursos-h5/javascripts/modernizr-1.7.min.js"></script>
        <link rel="stylesheet" href="http://meyerweb.com/eric/tools/css/reset/reset.css" type="text/css" media="screen, projection">
        <link rel="stylesheet" href="/cursos/themes/quali-cursos-h5/stylesheets/blueprint/screen.css" type="text/css" media="screen, projection">
        <link rel="stylesheet" href="/cursos/themes/quali-cursos-h5/stylesheets/blueprint/print.css" type="text/css" media="print">
        <link rel="stylesheet" href="/cursos/themes/quali-cursos-h5/stylesheets/main.css" type="text/css" media="screen, projection">
        <link rel="stylesheet" href="/cursos/themes/quali-cursos-h5/stylesheets/dropdown.vertical.css" type="text/css" media="screen, projection">
        <!--[if lt IE 8]><link rel="stylesheet" href="/cursos/themes/quali-cursos-h5/stylesheets/blueprint/ie.css" type="text/css" media="screen, projection"><![endif]-->
        <link href='http://fonts.googleapis.com/css?family=Arimo:regular,italic,bold,bolditalic' rel='stylesheet' type='text/css'>

	<script type="text/javascript">
            $(document).ready(function() {
                $('.inscreva-se-click').click(function () {
                    window.location = $('#ver-turmas').attr('href');
                });
            });
	</script>

	</head>
	
	<body {if $page_name}id="{$page_name|escape:'htmlall':'UTF-8'}"{/if} {if $page_name == 'category'}class="blue-bkg"{/if}>


  <div class="container ">
    <header class="span-24">
      <section id="logo" class="span-8">
	    <h1>Quali Fisioterapia</h1>
	  </section>
	  <nav class="span-16 last">
	    <ul class="prepend-1 dropdown">
		  <li><a href="/cursos/">Home</a></li>
		  <li>Rio de Janeiro
			<ul>
				<li>CONTATO QUALI CLÍNICAS</li>	
				<li>Centro de Qualidade de Vida e Fisioterapia Rio de Janeiro</li>	
				<li>Av. Marechal Floriano, 22 - 2° Andar</li>	
				<li>Centro | Telefone: (21) 2516.2052</li>	
				<li>riodejaneiro@qualifisioterapia.com.br</li>	
			</ul>
		  </li>
		  <li>Belo Horizonte
			<ul class="rigth3">
				<li>CONTATO QUALI CLÍNICAS</li>	
				<li>Centro de Qualidade de Vida e Fisioterapia Belo Horizonte</li>	
				<li>Av. Brasil, 84 - Loja 10 - Edifício Brasil Center</li>	
				<li>Sta Efigênia - 40.295-140 | Telefone: (31) 3241.6167</li>	
				<li>belohorizonte@qualifisioterapia.com.br</li>	
			</ul>
		  </li>
		  <li>Vitoria
			<ul class="rigth2">
				<li>CONTATO QUALI CLÍNICAS</li>	
				<li>Centro de Qualidade de Vida e Fisioterapia Vitória</li>	
				<li>Rua Eng. Guilherme José Monjardim Varejão, 340</li>	
				<li>Enseada do Suá | Telefone: (27) 3314.2638</li>	
				<li>vitoria@qualifisioterapia.com.br</li>	
			</ul>
		  </li>
		  <li>Salvador
			<ul class="rigth1">
				<li>CONTATO QUALI CLÍNICAS</li>	
				<li>Centro de Qualidade de Vida e Fisioterapia Salvador</li>	
				<li>Av. Juracy Magalhães Jr, 2490 - Sls 505/508</li>	
				<li>C. Médico Salvador | Horto Florestal | Telefone: (71) 3018.4152</li>	
				<li>salvador@qualifisioterapia.com.br</li>	
			</ul>
		  </li>
		</ul>
	  </nav>
	</header>
