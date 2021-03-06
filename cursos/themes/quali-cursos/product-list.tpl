
{if isset($products)}

    <div id="pagina-turmas">
        <h2>{$category->name|escape:'htmlall':'UTF-8'}</h2>
        <h3>{$category->description}</h3>
        <ul id="lista-turmas">
	{foreach from=$products item=product name=products}
		<li>
	
                  {if $product.features}
		    <h4>{$product.features.0.value}</h4>
                    <span class="turma">Turma: {$product.features.1.value}</span><span>{$product.features.2.value}</span>
		{/if}	

		</li>
	{/foreach}
	</ul>

        <div id="pagamento">
            <h4>Valor e Condição de Pagamento</h4>
            <ul>
                <li><span>À Vista</span> {convertPrice price=$products.0.price}</li>
                <li><span>Parcelado em 3x de</span> {convertPrice price=$products.0.price/3}</li>
                <li><span>Parcelado em 6x de</span> {convertPrice price=$products.0.price/6}</li>
                <li><span>Parcelado em 10x de</span> {convertPrice price=$products.0.price/10}</li>
            <ul>
        </div>

    </div>

<!--
	<!-- Products list -->
	<ul id="product_list" class="clear">
	{foreach from=$products item=product name=products}
		<li class="ajax_block_product {if $smarty.foreach.products.first}first_item{elseif $smarty.foreach.products.last}last_item{/if} {if $smarty.foreach.products.index % 2}alternate_item{else}item{/if} clearfix">
			<div class="center_block">
				<a href="{$product.link|escape:'htmlall':'UTF-8'}" class="product_img_link" title="{$product.name|escape:'htmlall':'UTF-8'}"><img src="{$link->getImageLink($product.link_rewrite, $product.id_image, 'home')}" alt="{$product.legend|escape:'htmlall':'UTF-8'}" {if isset($homeSize)} width="{$homeSize.width}" height="{$homeSize.height}"{/if} /></a>
				<h3>{if isset($product.new) && $product.new == 1}<span class="new">{l s='New'}</span>{/if}<a href="{$product.link|escape:'htmlall':'UTF-8'}"
                                title="{$product.name|escape:'htmlall':'UTF-8'}">{$product.name|truncate:35:'...'|escape:'htmlall':'UTF-8'}</a></h3>
				<p class="product_desc"><a href="{$product.link|escape:'htmlall':'UTF-8'}" title="{$product.description_short|truncate:360:'...'|strip_tags:'UTF-8'|escape:'htmlall':'UTF-8'}">{$product.description_short|truncate:360:'...'|strip_tags:'UTF-8'}</a></p>
			</div>																				 
			<div class="right_block">
				{if isset($product.on_sale) && $product.on_sale && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<span class="on_sale">{l s='On sale!'}</span>
				{elseif isset($product.reduction) && $product.reduction && isset($product.show_price) && $product.show_price && !$PS_CATALOG_MODE}<span class="discount">{l s='Reduced price!'}</span>{/if}
				{if isset($product.online_only) && $product.online_only}<span class="online_only">{l s='Online only!'}</span>{/if}
				{if (!$PS_CATALOG_MODE AND ((isset($product.show_price) && $product.show_price) || (isset($product.available_for_order) && $product.available_for_order)))}
				<div>
					{if isset($product.show_price) && $product.show_price && !isset($restricted_country_mode)}<span class="price" style="display: inline;">{if !$priceDisplay}{convertPrice price=$product.price}{else}{convertPrice price=$product.price_tax_exc}{/if}</span><br />{/if}
					{if isset($product.available_for_order) && $product.available_for_order && !isset($restricted_country_mode)}<span class="availability">{if ($product.allow_oosp || $product.quantity > 0)}{l s='Available'}{else}{l s='Out of stock'}{/if}</span>{/if}
				</div>
				{/if}
				{if ($product.id_product_attribute == 0 || (isset($add_prod_display) && ($add_prod_display == 1))) && $product.available_for_order && !isset($restricted_country_mode) && !$PS_CATALOG_MODE}
					{if ($product.allow_oosp || $product.quantity > 0) && $product.customizable != 2}
						<a class="button ajax_add_to_cart_button exclusive" rel="ajax_id_product_{$product.id_product|intval}" href="{$link->getPageLink('cart.php')}?add&amp;id_product={$product.id_product|intval}{if isset($static_token)}&amp;token={$static_token}{/if}" title="{l s='Add to cart'}">{l s='Add to cart'}</a>
					{else}
							<span class="exclusive">{l s='Add to cart'}</span>
					{/if}
				{/if}
				<a class="button" href="{$product.link|escape:'htmlall':'UTF-8'}" title="{l s='View'}">{l s='View'}</a>
				{if isset($comparator_max_item) && $comparator_max_item}
					<p class="compare"><input type="checkbox" onclick="checkForComparison({$comparator_max_item})" class="comparator" id="comparator_item_{$product.id_product}" value="{$product.id_product}" /> <label for="comparator_item_{$product.id_product}">{l s='Select to compare'}</label></p>
				{/if}				
			</div>
		</li>
	{/foreach}
	</ul>
	<!-- /Products list -->-->
{/if}
