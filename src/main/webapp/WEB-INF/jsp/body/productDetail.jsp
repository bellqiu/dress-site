<!-- Only for Dress site -->
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="hb" uri="/WEB-INF/tag/HBTag.tld"%>

<!-- Add mousewheel plugin (this is optional) -->
<script type="text/javascript" src="/resources/fancybox/lib/jquery.mousewheel-3.0.6.pack.js"></script>

<!-- Add fancyBox -->
<link rel="stylesheet" href="/resources/fancybox/source/jquery.fancybox.css?v=2.1.5" type="text/css" media="screen" />
<script type="text/javascript" src="/resources/fancybox/source/jquery.fancybox.pack.js?v=2.1.5"></script>

<!-- Optionally add helpers - button, thumbnail and/or media -->
<link rel="stylesheet" href="/resources/fancybox/source/helpers/jquery.fancybox-buttons.css?v=1.0.5" type="text/css" media="screen" />
<script type="text/javascript" src="/resources/fancybox/source/helpers/jquery.fancybox-buttons.js?v=1.0.5"></script>
<script type="text/javascript" src="/resources/fancybox/source/helpers/jquery.fancybox-media.js?v=1.0.6"></script>

<link rel="stylesheet" href="/resources/fancybox/source/helpers/jquery.fancybox-thumbs.css?v=1.0.7" type="text/css" media="screen" />
<script type="text/javascript" src="/resources/fancybox/source/helpers/jquery.fancybox-thumbs.js?v=1.0.7"></script>
<style>
<!--
	.dockbar {
		position: inherit!important;
		padding-right: 20px;
	}
-->
</style>
<script type="text/javascript">
var productName = "${currentProductDetail.name}";
var productOpts = "${currentProductOptions}";
</script>
<div class="container mainContainer">
    <div class="row">
		<ol class="breadcrumb">
			<c:forEach items="${currentProductDetail.categories}"
				varStatus="status" var="category">
				<li><a href="/c/${category.name }">${category.displayName }</a></li>
			</c:forEach>
			<li class="active">${currentProductDetail.title }</li>
		</ol>
	</div>
	<div class="row">
		<div class="col-md-7 col-xs-7 padding10 ProductImageRegion">
			<div class="row">
				<div class="col-md-1 col-xs-1">
					<hb:htmltag htmlKey="PRODUCT_SHARE_BUTTONS"/>
					<!-- <div class="addthis_toolbox addthis_floating_style addthis_32x32_style" style="position: absolute;">
<a class="addthis_button_preferred_1"></a>
<a class="addthis_button_preferred_2"></a>
<a class="addthis_button_preferred_3"></a>
<a class="addthis_button_preferred_4"></a>
<a class="addthis_button_preferred_5"></a>
<a class="addthis_button_compact"></a>
</div>
<script type="text/javascript">var addthis_config = {"data_track_addressbar":true};</script>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-4f3774750525e36a"></script> -->
				</div>
				<div class="col-md-11 col-xs-11">
					<ul class="bxslider">
						<c:forEach items="${currentProductDetail.images}" var="img">
							<li class="ProductImageContainer">
							<a class="fancybox" rel="gallery1" href="${site.resourceServer}${site.webResourcesFolder }/${site.productImageResourcesFolder}/${img.noChangeUrl}" title="${img.name }">
								<img class="margin_auto"
								src="${site.resourceServer}${site.webResourcesFolder }/${site.productImageResourcesFolder}/${img.largerUrl}"
								alt="${img.name }">
								</a>
							</li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<div class="row">
				<ul id="bx-pager">
					<c:forEach items="${currentProductDetail.images}" var="img"
						varStatus="status">
						<li><a class="ProductImageController"
							data-slide-index="${status.index }"> <img
								src="${site.resourceServer}${site.webResourcesFolder }/${site.productImageResourcesFolder}/${img.iconUrl}"
								alt="${img.name }">
						</a></li>
					</c:forEach>
				</ul>
			</div>
			<script type="text/javascript">
				$('.bxslider').bxSlider({
					pagerCustom : '#bx-pager',
					controls : false
				});
				$('#bx-pager').bxSlider({
					controls : true,
					slideWidth : 50,
					pager : false,
					maxSlides : 8,
					slideMargin : 5
				});
			</script>

		</div>
		<div class="col-md-5 col-xs-5 padding10">
			<div class="row">
				<div class="col-md-12 col-xs-12">
					<span class="gray">Product Id: 
						0000${currentProductDetail.id}
					</span>
					<span class="gray marginLeftRigh">|</span>
					<span class="likeSpan" data-id="${currentProductDetail.id}">(<span id="likeNum">${likeNum}</span>)</span>
					<span class="gray marginLeftRigh">|</span>
					<span><span class="sold">${soldNum}</span><span class="gray"> Sold</span></span>
					<h3>${currentProductDetail.title}</h3>
				</div>
				<div class="col-md-12 col-xs-12">
					<div class="row priceItem">
						<div class="col-md-3 col-xs-3">
							<span>Price:</span> 
						</div>
						<div class="col-md-9 col-xs-9">
							<div class="priceDuplicate"> 
								<hb:printPrice price="${currentProductDetail.price }"/> 
								<span class="productChangedPrice">
									<c:if test="${currentProductProductChange.priceChange > 0.1 }">
										+<hb:printPrice price="${currentProductProductChange.priceChange}" withCurrency="false"/> 
									</c:if>
									<c:if test="${currentProductProductChange.priceChange < (-0.1) }">
										<hb:printPrice price="${currentProductProductChange.priceChange}" withCurrency="false"/> 
									</c:if>
								</span>
							</div>
						</div>
					</div>
					<div class="row priceItem">
						<div class="col-md-3 col-xs-3">
								<span class="priceActive">Sale:</span> 
						</div>
						<div class="col-md-9 col-xs-9">
							<span class="priceActive">
								<hb:printPrice price="${currentProductDetail.actualPrice}"/>
									<span class="productChangedPrice">
									<c:if test="${currentProductProductChange.priceChange > 0.1 }">
									+<hb:printPrice price="${currentProductProductChange.priceChange }" withCurrency="false"/> 
									</c:if>
									<c:if test="${currentProductProductChange.priceChange < (-0.1) }">
										<hb:printPrice price="${currentProductProductChange.priceChange }" withCurrency="false"/> 
									</c:if>
								</span>
							</span>
						 </div>
					 </div>
					 
					 <div class="row priceItem">
						<div class="col-md-3 col-xs-3">
								<span>You Save:</span> 
						</div>
						<div class="col-md-9 col-xs-9">
							<div class="priceSave">
								<hb:printPrice price="${currentProductDetail.price - currentProductDetail.actualPrice}"/>(
									<fmt:formatNumber maxFractionDigits="2" minFractionDigits="2" value="${(currentProductDetail.price - currentProductDetail.actualPrice)/currentProductDetail.price*100}"></fmt:formatNumber>%
								)
							</div>
						 </div>
					 </div>
					 
				</div>
			<%-- 	<div class="col-md-12 col-xs-12">
					<div class="row">
						<div class="col-md-12 col-xs-12 abstractText">
							<p>${currentProductDetail.abstractText}</p>
						</div>
					</div>
				</div>
				<div class="col-md-12 col-xs-12 ">
					<c:forEach items="${currentProductDetail.props }" var="prop">
						<div class="row padding10">
							<div class="col-md-3 col-xs-3">${prop.name }</div>
							<div class="col-md-9 col-xs-9">${prop.value}</div>
						</div>
					</c:forEach>
				</div>
				 --%>
				

				<div class="col-md-12 col-xs-12 productOptionRegion">
					<c:forEach items="${currentProductDetail.options }" var="opt">
						<c:set var="optIdString">${opt.id }</c:set>
						<c:if test="${opt.type=='SINGLE_ICON_LIST' }">
							<div class="row padding10">
								<div class="col-md-3 col-xs-3">${opt.name }:</div>
								<div class="col-md-9 col-xs-9">
									<div class="btn-group" data-toggle="buttons">
										<c:forEach items="${opt.items }" var="item">
											<c:if test="${(currentProductProductChange.selectedOptOriginal[optIdString] != null && currentProductProductChange.selectedOptOriginal[optIdString] != item.value) || (currentProductProductChange.selectedOptOriginal[optIdString] == null && item.value!=opt.defaultValue)}">
												<label class="btn  btn-info product_opts_input_wrap wantTooltip" data-toggle="tooltip" title='<c:if test="${item.priceChange > 0.1}">(+<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if><c:if test="${item.priceChange < (-0.1)}">(<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if>'> <input type="radio"
													name="${opt.id }" value="${item.value}" class="product_opts_input">
													${item.displayName}
												</label>
											</c:if>
											<c:if test="${currentProductProductChange.selectedOptOriginal[optIdString] == item.value || (currentProductProductChange.selectedOptOriginal[optIdString] == null && item.value==opt.defaultValue)}">
												<label class="btn  btn-info active product_opts_input_wrap wantTooltip" data-toggle="tooltip" title='<c:if test="${item.priceChange > 0.1}">(+<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if><c:if test="${item.priceChange < (-0.1)}">(<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if>'> <input
													type="radio" checked="checked" name="${opt.id }"
													value="${item.value}" class="product_opts_input"> ${item.displayName}
												</label>
											</c:if>
										</c:forEach>
									</div>
								</div>
							</div>
						</c:if>
						<c:if test="${opt.type=='SINGLE_TEXT_LIST' }">
							<div class="col-md-3 col-xs-3">${opt.name }:</div>
							<div class="col-md-9 col-xs-9">
								<select class="selectpicker product_opts_select" id="sizePicker" name="${opt.id }"
									data-style="btn-info" >
									<c:forEach items="${opt.items }" var="item">
										<c:if test="${(currentProductProductChange.selectedOptOriginal[optIdString] != null && currentProductProductChange.selectedOptOriginal[optIdString] != item.value) || (currentProductProductChange.selectedOptOriginal[optIdString] == null && item.value!=opt.defaultValue)}">
											<option value="${item.value}">${item.displayName}
												
												<c:if test="${item.priceChange > 0.1}">
														(+
															<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>
														)
													</c:if>
													
													<c:if test="${item.priceChange < (-0.1)}">
														(	<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>
														)
													</c:if>
											
											</option>
										</c:if>
										<c:if test="${currentProductProductChange.selectedOptOriginal[optIdString] == item.value || (currentProductProductChange.selectedOptOriginal[optIdString] == null && item.value==opt.defaultValue)}">
											<option value="${item.value}" selected="selected">${item.displayName}
											
												<c:if test="${item.priceChange > 0.1}">(+<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if><c:if test="${item.priceChange < (-0.1)}">(<hb:printPrice price="${item.priceChange}" withCurrency="false"/><hb:printCurrency/>)</c:if>
											</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</c:if>
					</c:forEach>

					<div class="row padding10">
						<div class="col-md-3 col-xs-3">Qty:</div>
						<div class="col-md-3 col-xs-3">
							<div class="input-group">
							<a href="javascript:void(0);" id="decreaseQty" class="input-group-addon">-</a>
							<input type="text" class="form-control width50" id="productAmountCustom" value="1">
							<a href="javascript:void(0);" id="increaseQty" class="input-group-addon">+</a>
							</div>
						</div>
					</div>
				</div>

				<div class="col-md-12 col-xs-12 padding10">
					<hb:htmltag htmlKey="AD_PRODUCT_DETAIL"/>
				</div>

				<div class="col-md-12 col-xs-12 padding10">
					<form action="/sp/shoppingcart/add" id="add2cartForm" method="post">
						<input name="productName" value="" type="hidden" id="productNameSubmitInput">
						<input name="productOpts" value="" type="hidden" id="productOptsSubmitInput">
						<input name="productAmount" value="" type="hidden" id="productAmountSubmitInput">
						<button type="button" data-loading-text="Processing.."
							class="btn btn-warning add_cart_btn" id="add2cartButton"><span class="glyphicon glyphicon-shopping-cart" style="font-size:16px;">&nbsp;</span>ADD TO CART</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	<div class="row">
		<c:forEach items="${currentProductDetail.relatedProducts }" var="tabedProd">
			<h2>${tabedProd.name }:</h2>
			<div class="spotlight">
			<ul class="Related_Product"  class="row">
				<c:forEach items="${tabedProd.products }" var="subProd">
					<li class="col-xs-3 padding10">
						<div class="thumbnail">
							<img src="${site.resourceServer}${site.webResourcesFolder }/${site.productImageResourcesFolder}/${subProd.imageURL}" alt="...">
							<div class="caption">
								<h3>
									<a href="/${subProd.name }" class="relatedProductLink">${subProd.title }</a>
								</h3>
								<p>
									${subProd.abstractText }
								</p>
								<%-- <p>
									<a href="/cart/add?productId=${subProd.id }" class="btn btn-primary">Add to Cart</a> 
								</p> --%>
							</div>
						</div>
					</li>
				</c:forEach>
			</ul>
			</div>
		</c:forEach>
		<script type="text/javascript">
			$(".spotlight").ready(function(){
				  $('.spotlight .Related_Product').bxSlider({
					  captions: true,
					  slideWidth: 290,
					  maxSlides: 4,
					  slideMargin: 10,
					  pager : false,
					  //top : 30%,
					});
				});
		</script>
	</div>
<script type="text/javascript">
$(document).ready(function() {
	$(".fancybox").fancybox({
		openEffect	: 'none',
		closeEffect	: 'none',
		height: 800
	});
});
</script>
<script src="/resources/js/ProductPageMain.js" type="text/javascript"></script>	
	
	<div class="row">
		<h2>Details:</h2>
		<ul id="productHTMLs" class="nav nav-tabs">
			<li class="active"><a href="#ProductDetailDESC" data-toggle="tab">Detail</a></li>
			<c:forEach items="${ currentProductDetail.manuals}" var="html">
				<li><a href="#phtml${html.value.id }" data-toggle="tab">${html.key}</a></li>
			</c:forEach>
			
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="ProductDetailDESC">
				${currentProductDetail.detail }
			</div>
			<c:forEach items="${ currentProductDetail.manuals}" var="html">
				<div class="tab-pane fade" id="phtml${html.value.id }">
						${html.value.content}
				</div>
			</c:forEach>
		</div>
	</div>
</div>
