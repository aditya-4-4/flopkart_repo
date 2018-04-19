<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.iiitb.ooadvoid.AccessProperties"%>
<!DOCTYPE html>
<html>
<head>
<meta property="og:url"           content="https://localhost:8080/flopkartPrototype" />
<meta property="og:type"          content="website" />
<meta property="og:title"         content="Your Website Title" />
<meta property="og:description"   content="Your description" />
<meta property="og:image"         content="https://www.your-domain.com/path/image.jpg" />
<%@include file="metaContent.jsp"%>
<title>Item Display</title>
</head>
<style>
.buynow {
	background: #fb641b;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .2);
	border: none;
	color: #fff;
	width: 48%;
	padding: 18px 8px;
	border-radius: 2px;
}

.buynowdiv {
	padding-top: 20px;
}

.addtocart {
	background: #ff9f00;
	box-shadow: 0 1px 2px 0 rgba(0, 0, 0, .2);
	border: none;
	color: #fff;
	text-align: center;
	display: inline-block;
	width: 48%;
	padding: 18px 8px;
	border-radius: 2px;
}
</style>

<body>
<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = 'https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v2.12';
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>

	<%@include file="header.jsp"%>
	<div class="breadcrumb">
		<div class="container">
			<div class="breadcrumb-inner">
				<ul class="list-inline list-unstyled">
					<!-- 				<li><a href="#">Home</a></li> -->
					<!-- 				<li><a href="#">Clothing</a></li> -->
					<!-- 				<li class='active' id="breadcrumblast">Floral Print Buttoned Top</li> -->
				</ul>
			</div>
			<!-- /.breadcrumb-inner -->
		</div>
		<!-- /.container -->
	</div>
	<!-- /.breadcrumb -->
	<div class="body-content outer-top-xs">
		<div class='container'>
			<div class='row single-product'>
				<div class="col-md-12">
					<div class="detail-block">
						<div class="row  wow fadeInUp">

							<div class="col-xs-12 col-sm-6 col-md-5 gallery-holder">
								<div id="gallery"
									class="product-item-holder size-big single-product-gallery small-gallery">

									<!--         <div id="owl-single-product"> -->
									<!--             <div class="single-product-gallery-item" id="slide1"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p9.jpg"> -->
									<!--                     <img class="img-responsive" alt="" width="480px" src="./images/blank.gif" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide2"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p9.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p9.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide3"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p10.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p10.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide4"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p11.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p11.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide5"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p12.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p12.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide6"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p13.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p13.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide7"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p14.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p14.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide8"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p4.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p4.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--             <div class="single-product-gallery-item" id="slide9"> -->
									<!--                 <a data-lightbox="image-1" data-title="Gallery" href="./images/products/p5.jpg"> -->
									<!--                     <img class="img-responsive" alt="" src="./images/blank.gif" data-echo="./images/products/p5.jpg" /> -->
									<!--                 </a> -->
									<!--             </div>/.single-product-gallery-item -->

									<!--         </div>/.single-product-slider -->




								</div>
								<!-- /.single-product-gallery -->
								<div class="buynowdiv">
									<form action="buyNow.jsp">
										<button id="buynow" onclick="return addToCart()" class="buynow">Buy Now</button>
										<button id="buynow_incart" class="buynow">Buy Now</button>
										<a href="#" onclick="return addToCart()" onmouseover="style='color:white'" class="addtocart" id="addtocart">Add to cart </a>
										<a href="cart.jsp" onmouseover="style='color:white'" class="addtocart" id="gotocart">Go to cart </a>
										<input type="text" name="listingid"
											value='<%=request.getParameter("id")%>' hidden="hidden">
										<input type="number" id="quant" name="quant" hidden="hidden">
										<input type="text" name="listingname" id="listingname"
											hidden="hidden"> 
										<input type="number" id="listingdiscount"
											name="listingdiscount" hidden="hidden"> <input
											type="text" id="sellername" name="sellername" hidden="hidden">
										<input type="number" id="listingquant" name="listingquant"
											hidden="hidden"> <input type="text" id="itemid"
											name="itemid" hidden="hidden">
										<input type="number" id="dealid" name="dealid" hidden="hidden">
									</form>
								</div>
							</div>
							<!-- /.gallery-holder -->
							<div class='col-sm-6 col-md-7 product-info-block'>
								<div class="product-info" id="product-info">
									<h1 class='name' id='product_title'></h1>
									
									<div class="row">
						            <div class="col-sm-4" id="seller_rating" style="padding-right:0px;">
						                 <span style="font-size:14px">Seller Rating : </span>
						                 <span style="font-size:16px" class='fa fa-star'></span>
						                 <span style="font-size:16px" class='fa fa-star'></span>
						                 <span style="font-size:16px" class='fa fa-star'></span>
						                 <span style="font-size:16px" class='fa fa-star'></span>
						                 <span style="font-size:16px" class='fa fa-star'></span>
						            </div>
						            
						            <div class="col-sm-5" id="seller_rating_unavailable" style="font-size:14px" hidden="hidden">
						                 <span style=" font-size:14px;">Seller Rating : </span>
                                         <span style="color:red; font-size:14px;"> Not enough Ratings</span> 
						            </div>
						          <div class="col-sm-5" style="color:blue;"> 
						          <span id="seller_rating_total" style="font-size:14px"></span>
						            <span id="seller_rating_customers" style="font-size:14px"></span></div></div>
						            
						            <div class="row" style="padding-top:9px;">
										<div class="col-sm-2" style="padding-right:0px;">
											<span style="font-size:14px">Item id </span>
											<div class="fb-share-button" data-href="https://www.google.co.in/?gfe_rd=cr&dcr=0&ei=wFbOWtutO-2cX9OFq-AD" data-layout="button_count" data-size="small" data-mobile-iframe="false"><a target="_blank" href="https://www.facebook.com/sharer/sharer.php?u=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&amp;src=sdkpreparse" class="fb-xfbml-parse-ignore">Share</a></div>
										</div>
										<div class="col-sm-8" style="padding-left:0px;">
											<span style="font-size:14px" id='product_id'></span>
										</div>
										<div class="col-sm-4" style="padding-right:0px;"></div>
									</div>
									<div class='stock-container info-container m-t-10'>
										<div class='row'>
											<div class='col-sm-2' >
												<div class='stock-box' style="padding-left:0px">
													<span  style="font-size:14px">Availability </span>
												</div>
											</div>
											<div class='col-sm-9' style="padding-left:0px">
												<div class='stock-box' style="padding-left:0px">
													<span style="color: red; font-size: 14px" id='available'></span>
													<span hidden="hidden" id='available_quant'></span>
												</div>
											</div>
										</div>
									</div>
									<div class='description-container m-t-20'
										style="font-size: 14px " id='itemdescription'>
									</div>
									<div class='price-container info-container m-t-20'>
										<div class='row'>
											<div class='col-sm-6'>
												<div class='price-box' style="display: inline-flex;">
													<div class='price' style="margin-right: 15px">
														<i class='fa fa-rupee-sign'></i> <span
															id='discountedprice'></span>
													</div>
													<div class='price-strike'>
														<i class='fa fa-rupee-sign'></i> <span id='price-strike'></span>
													</div>
												</div>
												<div style='font-size: 14px; color: blue' id='discount'></div>
												<div style='font-size: 15px; color: purple' id='dealname'></div>
											</div>
											<div class='col-sm-6'>
												<div class='favorite-button m-t-10'>
													<a class='btn btn-primary' data-toggle='tooltip'
														data-placement='right' title='Wishlist' href='#'> <i
														class='fa fa-heart'></i>
													</a> <a class='btn btn-primary' data-toggle='tooltip'
														data-placement='right' title='E-mail' href='#'> <i
														class='fa fa-envelope'></i>
													</a>
												</div>
											</div>
										</div>
									</div>
									<div class='quantity-container info-container'>
										<div class='row'>
											<div class='col-sm-2'>
												<span class='label'>Qty :</span>
											</div>
											<div class='col-sm-2'>
												<div class='cart-quantity'>
													<div class="quant-input">
														<div class="arrows">
															<div id="quant-up" class="arrow plus gradient">
																<span><i class="icon fa fa-sort-asc"></i></span>
															</div>
															<div id="quant-down" class="arrow minus gradient">
																<span><i class="icon fa fa-sort-desc"></i></span>
															</div>
														</div>
														<input type="number" id="quantity" min="1">
													</div>
												</div>
											</div>
											<div class='col-sm-8'>
												<div id="quantwarning" class="alert alert-warning"
													hidden="hidden"></div>
											</div>
										</div>
									</div>
									<div  id="additionalDetails_div" class='col-sm-12' style ='border-style: groove;border-width: 4px;' >
										<table class="table-condensed">
											<thead>
												<tr>
													<th colspan="2" style="font-size: 120%">Additional
														Details</th>
												</tr>
											</thead>
											<tbody id="additionalDetails">
											</tbody>
										</table>
									</div>
								</div>
							</div>
						</div>
						<!-- /.row -->
					</div>
					<!-- /.quantity-container -->
				</div>
				<!-- /.product-info -->
			</div>
			<!-- /.col-sm-7 -->
		</div>
		<!-- /.row -->
	</div>
</body>

<%@include file="footer.jsp"%>

<script>
$(document).ready(function()
{
	$("#quantity").val("1");
	$("#quant").val("1");
	<%AccessProperties ap = new AccessProperties();%>
	var imgServerURL = "<%=ap.getImageServerURL()%>"; 
    var ctxPath = "<%=request.getContextPath()%>";
    var listingid = "<%=request.getParameter("id")%>";
    getDealDetails(ctxPath);
	headerFunctions(ctxPath);
		$.ajax(
		{
			type : 'GET',
			contentType : 'application/json',
			url : ctxPath + "/webapi/listings/"+listingid,
			dataType : "json", // data type of response
			success : function(listing_json){
				if(listing_json.quantity<1)
				{
					$("#available").text("Out of Stock");
					$("#buynow").hide();
					$("#addtocart").hide();
					$("#gotocart").hide();	
					$("#buynow_incart").hide();	
					
				}
				else
				{
					$("#available").text(" : In Stock "+"("+listing_json.quantity+")");
					$("#available_quant").text(listing_json.quantity);
				}
				var amount = listing_json.price - (listing_json.discount*listing_json.price/100);
				$("#product_title").text(listing_json.listingName);
				$("#product_id").text(" : " +listing_json.itemId);
				$("#itemdescription").text(listing_json.description);
				$("#discountedprice").text(amount);
				$("#price-strike").text(listing_json.price);
				$("#discount").text("Discount: "+listing_json.discount+"%");
				$("#listingquant").val(listing_json.quantity);
				$("#listingdiscount").val(listing_json.discount);
				$("#listingname").val(listing_json.listingName);
				$("#itemid").val(listing_json.itemId);
				$("#gotocart").hide();	
				$("#buynow_incart").hide();	
				if(getCookie("user_details")!="") 
				{
					getCartId(ctxPath, listing_json.itemId);
				}			
				var img_data = "<div id='owl-single-product'>"+
				"    <div class='single-product-gallery-item' id='slide1'>"+
				"        <a data-lightbox='image-1' data-title='Gallery' href='"+imgServerURL+listing_json.imgUrl+"'>"+
				"            <img class='img-responsive' alt='' style='display: block; object-fit: contain; width: 480px; height: 500px;' src='./images/blank.gif' data-echo='"+imgServerURL+listing_json.imgUrl+"' />"+
				"        </a>"+
				"    </div>"+
				"</div>";
				$("#gallery").html(img_data);
// 				alert(JSON.stringify(listing_json));
                rating(ctxPath,listing_json.sellerid);
				$.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : ctxPath + "/webapi/users/"+listing_json.sellerid,
					dataType : "json", // data type of response
					success : function(seller_json)
					{
						var sellerData = "<div id='sellerData' style='color:green; font-size:15px'>Seller name:   "+seller_json.firstName+" "+seller_json.lastName+" (id: "+seller_json.email+" )</span>";
						$("#product-info").append(sellerData);
						//alert(seller_json.firstName+" "+seller_json.lastName);
						$("#sellername").val(seller_json.firstName+" "+seller_json.lastName);
					},
					error : function(){
						//alert("error");
					}
				});
				$.ajax({
					type : 'GET',
					contentType : 'application/json',
					url : ctxPath + "/webapi/details/itemid/"+listing_json.itemId,
					dataType : "json", // data type of response
					success : function(item_details_json)
					{
						if(item_details_json.length==0)
							$("#additionalDetails_div").hide();	
						for (var i in item_details_json) 
						{
						  data = "<tr>"+
						  "<td>"+item_details_json[i].attr_name+"</td>"+
						  "<td>"+item_details_json[i].attr_val+"</td>"+
						  "</tr>";
						  $("#additionalDetails").append(data);
						}
					},
					error : function(){
						//alert("error");
					}
				});
			},
	    	error:function() {
	        	//alert("error occurred");
	    	}
		});
		
});


function getCartId(ctxPath, itemId) 
{
	var listingid = "<%=request.getParameter("id")%>";
	$.ajax(
		{
			type : 'POST',
			contentType : 'application/json',
			url : ctxPath + "/webapi/cart/user/listingid/"+listingid,
			data : itemToJSON(itemId, 0),
			success : function(cart,status,code) 
			{
				//nocontent
				cartCheck(code.status);
			},
			error: function() 
			{
				swal(JSON.stringify(err));
			}
	});
}


function cartCheck(status) 
{
	if(JSON.stringify(status)!="204" && ($("#available").text()!="Out of Stock"))
	{
		$("#addtocart").hide();
		$("#gotocart").show();
		$("#buynow_incart").show();
		$("#buynow").hide();
		
	}
}

$("#quant-up").click(function(){
	$("#quantwarning").hide();
	var value = $("#quantity").val();
	var available_quant = $("#available_quant").text();
	if(parseInt(value)<parseInt(available_quant))
	{
		value++;
		$("#quantity").val(value);
		$("#quant").val(value);
	}
	else {
		$("#quantwarning").text("Only "+available_quant+" items are available in stock");
		$("#quantwarning").show();
	}
});

$("#quantity").keyup( function() 
{
	var value = $("#quantity").val();
	var available_quant = $("#available_quant").text();
	if(parseInt(value)>parseInt(available_quant))
	{
		$("#quantity").val(available_quant);
		$("#quantwarning").text("Only "+available_quant+" items are available in stock");
		$("#quantwarning").show();
	}
	$("#quant").val($("#quantity").val());
});

$("#quant-down").click(function(){
	$("#quantwarning").hide();
	var value = $("#quantity").val();
	if(parseInt(value)>1)
	{
		value--;
		$("#quantity").val(value);
		$("#quant").val(value);
	}
});

function getDealDetails(ctxPath){
	var listingid = "<%=request.getParameter("id")%>";
	$.ajax({
		type : 'GET',
		async:false,
		url : ctxPath + "/webapi/listingDeals/listing/"+listingid,
		dataType : "json", // data type of response
		success : function(deal){
			var jsonDeal = JSON.stringify(deal);
			if(jsonDeal !="[]"){
				$("#dealid").val(deal[0].dealid);
				getDealName(ctxPath);
			}
			else {
				$("#dealid").val(0);
			}
		},
		error: function(){
			//alert("error occurred"); 
		}
	});
}

function getDealName(ctxPath){
	//alert($("#dealid").val());
	if($("#dealid").val()!=""){
		var dealid = $("#dealid").val();
		$.ajax({
			type : 'GET',
			async:false,
			url : ctxPath + "/webapi/deals/"+dealid,
			dataType : "json", // data type of response
			success : function(deal){
				$("#dealname").html("SUPER DEAL: "+deal.dealname+"!"+"&nbsp; &nbsp;");
				if(deal.dealname == "15% Cashback" || deal.dealname == "50% off"){
				}
				else {
					$("#dealname").append("<a class='btn btn-primary' href='offerZoneDeal.jsp?id="+dealid+"'> Avail Deal </a>");
				}
			},
			error: function(){
				//alert("error occurred"); 
			}
		});
	}
}

function checkLogin()
{
	if(getCookie("user_details")=="") 
	{
		swal("Please Login");
		return false;
	}
}

function itemToJSON() 
{
	var user = getCookie("user_details");
	user = JSON.parse(user);
	var userId = user.id;
	var itemId = $("#itemid").val();
	var quant = $("#quantity").val();
	var flopkartCart = JSON.stringify({
	    "userId" : userId,
	    "itemId" : itemId,
	    "quantity" : quant
	});
//	alert(flopkartCart);
	return flopkartCart;
}

function successCart(){
	swal("Item added to your cart!");
	$("#addtocart").hide();
	$("#gotocart").show();
}

function addToCart()
{
	if(getCookie("user_details")=="") 
	{
		swal("Please Login");
		return false;
	}
	var ctxPath = "<%=request.getContextPath()%>";
	$.ajax(
		{
			type : 'POST',
			contentType : 'application/json',
			url : ctxPath + "/webapi/cart/create",
			data : itemToJSON(),
			success : successCart(),
			error: function() {
				swal(JSON.stringify(err));
			}
	});
}

function rating(ctxPath,id)
{
	$.ajax({
		type : 'GET',
		url : ctxPath + "/webapi/reviews/seller/"+id,
		dataType : "json", // data type of response
		success : function(results){
			if(results.length==0)
				{
				   $("#seller_rating").hide()
				   $('#seller_rating_total').hide()
				   $('#seller_rating_customers').hide()
				   $("#seller_rating_unavailable").show()
				}
			else
				{
				   var sum=0;
				   for(var i in results)
					   sum=sum+results[i].stars
				   var data = "<span> ( </span> <span>"+sum+" stars</span>";
				   $('#seller_rating_total').append(data);
				   data = "</span><span> / </span><span>"+results.length+" customer ratings</span> <span> ) </span>";
				   $('#seller_rating_customers').append(data);
				   var val = Math.round(sum/results.length);
				   renderSeller(val);
				}
		},
		error: function(){
			//alert("error occurred"); 
		}
	});
}
function renderSeller(val)
{
	var color;
	if(val<=2)
		color = "red";
	else if(val<=4)
		color = "orange";
	else
		color = "green";
	var stars =$("#seller_rating").find("span");
	var i;
	for(i=1;i<val+1;i++)
		{
		   $(stars[i]).css('color',color);
		}
	for(;i<6;i++)
	{
	   $(stars[i]).css('color','black');
	}
}
</script>
</html>