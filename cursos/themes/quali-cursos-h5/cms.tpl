        <section class="cursos-secondary span-12">
		<h2 class="span-3">Cursos</h2>
		<ul class="dropdown vertical">
			<li class="menu">Agenda
				<ul class="submenu">
					<li><a href="">Mensual</a></li>
					<li><a href="">Regional</a></li>
					<li><a href="/cursos/content/category/2-agenda">Todos os Cursos</a></li>
				</ul>
			</li>
			<li><a href="/cursos/content/18-ministrantes">Ministrantes</a></li>
                        <li><a href="/cursos/content/19-vatagens">Vantagens</a></li>
                        <li><a href="/cursos/1-inscreva-se">Inscreva-se</a></li>
                        <li><a href="javascript:history.go(-1)">Voltar</a></li>
		</ul>   
		<p>
			Todos os nossos cursos encontram-se de acordo com a Legislação do COFFITO e do CNE.
		</p>
	</section>
                
{if $cms->id != $cgv_id}
	{include file="$tpl_dir./breadcrumb.tpl"}
{/if}
{if isset($cms) && !isset($category)}
	{if !$cms->active}
		<br />
		<div id="admin-action-cms">
			<p>{l s='This CMS page is not visible to your customers.'}
			<input type="hidden" id="admin-action-cms-id" value="{$cms->id}" />
			<input type="submit" value="{l s='Publish'}" class="exclusive" onclick="submitPublishCMS('{$base_dir}{$smarty.get.ad}', 0)"/>			
			<input type="submit" value="{l s='Back'}" class="exclusive" onclick="submitPublishCMS('{$base_dir}{$smarty.get.ad}', 1)"/>			
			</p>
			<div class="clear" ></div>
			<p id="admin-action-result"></p>
			</p>
		</div>
	{/if}
	<!--<div class="rte{if $content_only} content_only{/if}">
		{$cms->content}
	</div>-->
          <section class="cursos-info span-12 last">
		<h3>{$cms->meta_title|escape:'htmlall':'UTF-8'}</h3>
		{$cms->content}
	</section>

{elseif isset($category)}

        <section class="cursos-info span-12 last">
		<h3>Todos os Cursos</h3>
		<ul>
			{foreach from=$cms_pages item=cmspages}
		    	<li>
			    <a href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'htmlall':'UTF-8'}">{$cmspages.meta_title|escape:'htmlall':'UTF-8'}</a>
		        </li>
			{/foreach}
		</ul>
	</section>


<!--
	<div>
		<h1>{$category->name|escape:'htmlall':'UTF-8'}</h1>
		{if isset($sub_category) & !empty($sub_category)}	
			<h4>{l s='List of sub categories in '}{$category->name}{l s=':'}</h4>
			<ul class="bullet">
				{foreach from=$sub_category item=subcategory}
					<li>
						<a href="{$link->getCMSCategoryLink($subcategory.id_cms_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
					</li>
				{/foreach}
			</ul>
		{/if}
		{if isset($cms_pages) & !empty($cms_pages)}
		<h4>{l s='List of pages in '}{$category->name}{l s=':'}</h4>
			<ul class="bullet">
				{foreach from=$cms_pages item=cmspages}
					<li>
						<a href="{$link->getCMSLink($cmspages.id_cms, $cmspages.link_rewrite)|escape:'htmlall':'UTF-8'}">{$cmspages.meta_title|escape:'htmlall':'UTF-8'}</a>
					</li>
				{/foreach}
			</ul>
		{/if}
	</div>-->
{else}
	{l s='This page does not exist.'}
{/if}



