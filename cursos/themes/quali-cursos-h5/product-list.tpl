
{if isset($products)}

        <div class="wrapper">
	{foreach from=$products item=product name=products}
		{if $product.features}
	        <div class="curso-date">
		    <p>{$product.features.0.value}</p>
		    <p><span>Turma: {$product.features.1.value}</span><span>{$product.features.2.value}</span></p>
		</div>
                {/if}
	{/foreach}
        </div>
                        <table border="0" >
			  <caption>VALORES E CONDIÇÕES DE PAGAMENTO</caption>
			  <tr>
				<td>A vista</td>
				<td>{convertPrice price=$products.0.price}</td>
			  </tr>
			  <tr>
				<td>Parcelado em 03x de</td>
				<td>{convertPrice price=$products.0.price/3}</td>
			  </tr>
			  <tr>
				<td>Parcelado em 05x de</td>
				<td>{convertPrice price=$products.0.price/6}</td>
			  </tr>
                          <tr>
				<td>Parcelado em 10x de</td>
				<td>{convertPrice price=$products.0.price/10}</td>
			  </tr>
			</table>
		<!--	<img class="cards" src="/cursos/themes/quali-cursos-h5/images/cards.png" />-->

{/if}


