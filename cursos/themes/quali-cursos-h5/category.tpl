{include file="$tpl_dir./errors.tpl"}

{if isset($category)}
	{if $category->id AND $category->active}

          	{if isset($subcategories)}
		 <div id="lista-cursos">
            <h2>INSCREVA-SE</h2>
                	<ul>
			{foreach from=$subcategories item=subcategory}

	                        <li>
					• <a href="{$link->getCategoryLink($subcategory.id_category, $subcategory.link_rewrite)|escape:'htmlall':'UTF-8'}">{$subcategory.name|escape:'htmlall':'UTF-8'}</a>
					</li>
				<li>

			{/foreach}
				</ul>

                </div>
		{/if}

		        {if $products}
				{include file="$tpl_dir./product-list.tpl" products=$products}
			{elseif !isset($subcategories)}
			            <div id="pagina-turmas">
                                        <h2>{$category->name|escape:'htmlall':'UTF-8'}</h2>
                                         <h3>{$category->description}</h3>
                                         <b>Desculpe, nenhuma turma disponível para este curso no momento.</b>
                                     </div>
			{/if}
	{elseif $category->id}
		<p class="warning">{l s='This category is currently unavailable.'}</p>
	{/if}
{/if}
