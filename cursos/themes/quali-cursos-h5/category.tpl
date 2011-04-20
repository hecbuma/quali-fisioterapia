{include file="$tpl_dir./errors.tpl"}


	<section class="inscrever-se span-24">
		<div class="inscrever-se-img span-6 prepend-1" >
		 <a href=""><img src="/cursos/themes/quali-cursos-h5/images/inscrivase.png"/></a>
		</div>
		<article class="curso-description span-16 last">


{if isset($category)}
	{if $category->id AND $category->active}

          	{if isset($subcategories)}
                 <h2>INSCREVA-SE</h2>
                	<ul>
			{foreach from=$subcategories item=subcategory}

	                        <li>
					• <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
				</li>

			{/foreach}
				</ul>

		{else}
                        <h2>{$category->name|escape:'htmlall':'UTF-8'}</h2>
			<p class="push_bottom">{$category->description}</p>
		{/if}     
                        {if $products}
				{include file="$tpl_dir./product-list.tpl" products=$products}
			{elseif !isset($subcategories)}
			        <b>Desculpe, nenhuma turma disponível para este curso no momento.</b>
                        {/if}
	{elseif $category->id}
		<p class="warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}

		</article>
	</section>
