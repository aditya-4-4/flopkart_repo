<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.Timestamp" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <style>
    .progress-class
    {
    	color:green;
    	text-align:center;
    }
    </style> 
	<%@include file="metaContent.jsp" %>
	<title>Place Order</title>
</head>
<body>
    <%@include file="header.jsp" %>
     
   <div class="body-content">
	<div class="container">
		<div class="checkout-box ">
			<div class="row" style="margin-top:20px">
				<div class="col-md-8">
					<div class="panel-group checkout-steps" id="accordion">
						<!-- checkout-step-01  -->
						<div  id="login_panel" class="login-class panel panel-default checkout-step-01" >
												<!-- panel-heading -->
							<div class="panel-heading">
					    	<h4 class="unicase-checkout-title">
						        <a id="collapse1" data-toggle="collapse" class="" data-parent="#accordion" href="#collapseOne">
						          <span>1</span>Login
						        </a>
						     </h4>
					    	</div>	    <!-- panel-heading -->
	
							<div id="collapseOne" class="panel-collapse collapse in">
						
								<!-- panel-body  -->
							    <div class="panel-body">
									<div class="row">		
						
										<!-- guest-login -->			
										<div class="col-md-6 col-sm-6 guest-login">
										
											<h4 class="checkout-subtitle">Register or Login</h4>
											<h4 class="checkout-subtitle outer-top-vs">Register and save time</h4>
											<p class="text title-tag-line ">Register with us for future convenience:</p>
											
											<ul class="text instruction inner-bottom-30">
												<li class="save-time-reg">- Fast and easy check out</li>
												<li>- Easy access to your order history and status</li>
											</ul>
						
											<button type="button" class="btn-upper btn btn-primary checkout-page-button checkout-continue " onclick="return buynowsignup();">Continue</button>
										</div>
										<!-- guest-login -->
						
										<!-- already-registered-login -->
										<div class="col-md-6 col-sm-6 already-registered-login">
											<h4 class="checkout-subtitle">Already registered?</h4>
											<p class="text title-tag-line">Please log in below:</p>
											  <button type="button" class="btn-upper btn btn-primary checkout-page-button" onclick="return buynowvalidation();">Login</button>
										</div>	
									<!-- already-registered-login -->		
					
								</div>			
							</div>
							<!-- panel-body  -->
					
							</div><!-- row -->
							
							
						</div>
						<!-- End checkout-step-01  -->
						
						
						<!-- checkout-step-02  -->
						<div id="address_panel" class="panel panel-default checkout-step-02">
												<!-- panel-heading -->
							<div class="panel-heading">
					    	<h4 class="unicase-checkout-title">
						        <a id="collapse2" data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseTwo">
						          <span>2</span>Shipping Address
						        </a>
						     </h4>
					    	</div>	    <!-- panel-heading -->
	
							<div id="collapseTwo" class="panel-collapse collapse">
						
								<!-- panel-body  -->
							    <div class="panel-body">
									<div class="row">		
									
						      <div class="panel-body">
							      <textarea rows="4" style="width:100%" id="shipAddress" required>
	                              </textarea>
	                              <div class="row">
		                              <div class="col-md-3"><button type="button"  
		                              class="btn btn-primary" onclick="orderSummary()">Next</button></div>
		                              
		                              <div class="col-md-3 pull-right" style="margin-top:5px;color:red" 
		                              id="addrWarning" hidden="hidden">Please enter address</div>	
		                          </div>
							  </div>
								</div>			
							</div>
							<!-- panel-body  -->
					
							</div><!-- row -->
							
							
						</div>
						<!-- End checkout-step-02  -->
						
						
						<!-- checkout-step-03  -->
						<div id="summary_panel" class="panel panel-default checkout-step-03">
												<!-- panel-heading -->
							<div class="panel-heading">
					    	<h4 class="unicase-checkout-title">
						        <a id="collapse3" data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseThree">
						          <span>3</span>Order Summary
						        </a>
						     </h4>
					    	</div>	    <!-- panel-heading -->
	
							<div id="collapseThree" class="panel-collapse collapse">
						
								<!-- panel-body  -->
							    <div class="panel-body">
									<div class="row">
									                                                                 
								  <div class="table-responsive">          
									  <table id="order_table" class="table">
									  <thead>
								    	<tr align="center">
								    		<th>Item Name</th>
								    		<th>Quantity</th>
								    		<th>Marked Price</th>
								    		<th>Discount</th>
								    		<th>Discounted Price</th>
								    		<th style="color:green">Seller Name</th>
										</tr>
								    	</thead>
								    	<tbody id="orderSummary_body">
								    	<tr>
								    		<th>Delivery Charges: </th>
								    		<td id="calc">0</td>
								    		<td></td>
								    		<th>Total Price:</th>
								    		<th id="total_th">0</th>
								    	</tr>
								    	</tbody>
								    </table>
							    </div>                       
							   
	                              <div class="row">
		                            <div class="col-md-3">
		                              <button id="confirmOrder" type="button" class="btn btn-success" style='margin:0px 10px 10px 10px'
		                              onclick="return insertOrders()">Confirm Order</button>
									</div>
		                            <div class="col-md-3 pull-right" style="margin-top:5px;color:red" 
		                              id="orderWarning" hidden="hidden">Please Confirm the order</div>	
		                          </div>
                            </div>					
							</div>
							<!-- panel-body  -->
					
							</div><!-- row -->
							
							
						</div>
						<!-- End checkout-step-03  -->
						
						
						<!-- checkout-step-04  -->
						<div id="payment_panel" class="panel panel-default checkout-step-04">
												<!-- panel-heading -->
							<div class="panel-heading">
					    	<h4 class="unicase-checkout-title">
						        <a id="collapse4" data-toggle="collapse" class="collapsed" data-parent="#accordion" href="#collapseFour">
						          <span>4</span>Payment Options
						        </a>
						     </h4>
					    	</div>	    <!-- panel-heading -->
	
							<div id="collapseFour" class="panel-collapse collapse">
						
								<!-- panel-body  -->
							    <div class="panel-body">
									<div class="row" style="margin-top:10px">
									
      <div class="col-md-3 sidebar"> 
        <div class="sidebar-module-container">
          <div class="sidebar-filter"> 
        <!-- /.side-menu -->  
        <div class="side-menu outer-bottom-xs">
			<div class="sidebar-widget">
              <div class="sidebar-widget-body">
                <ul class="list">
                  <li><h5><a onclick='flopkartBank()'>Flopkart Bank</a>
<!--                   <input type="radio" name="paymenttype" value="flopkartBank" checked> -->
                  </h5></li>
                </ul>
              </div>
              <!-- /.sidebar-widget-body --> 
            </div>
            <!-- /.sidebar-widget --> 
          <!-- /.megamenu-horizontal --> 
        </div>
        <!-- /.side-menu --> 
          </div>
          <!-- /.sidebar-filter --> 
        </div>
        <!-- /.sidebar-module-container --> 
      </div>
      			<div class="col-md-9">
      			<div class="row">
			      <div class="col-md-6 sidebar"> 
			      		<label>Account Number</label>
		              <input type="number" class="form-control input-lg"  name="accountno" id="accountno" required>
		          </div>
			      <div class="col-md-6 sidebar"> 
			      		<label>Pin</label>
		              <input type="password" maxlength="4" class="form-control input-lg"  name="pin"  id="pin" required>
		          	</div>
		         </div>
      			<div class="row">
		               <div style="margin-top:5px;margin-left:15px;color:red" hidden="hidden"
		                              id="accWarning">Please enter account no. and pin</div>	
		         </div>
		                          </div>
  				<input type="submit" class="btn btn-primary" value="Proceed to pay" id="proceed"
  									onclick="proceedToPay()">
									</div>
							</div>
							<!-- panel-body  -->
					
							</div><!-- row -->
							
							
						</div>
						<!-- End checkout-step-04  -->
					</div><!-- /.checkout-steps -->
					
				
					
				</div>
				
				
				<div class="col-md-4">
					<!-- checkout-progress-sidebar -->
					<div class="checkout-progress-sidebar ">
						<div class="panel-group">
							<div class="panel panel-default">
								<div class="panel-heading">
							    	<h4 class="unicase-checkout-title">Your Checkout Progress</h4>
							    </div>
							    <div class="">
									<ul id="orderProgress" class="nav nav-checkout-progress list-unstyled">
										<li><a href="#" class="progress-class"><b>Order In Progress</b></a></li>
										<li hidden="hidden" id="arrow_order" ><a href="#" class="progress-class glyphicon glyphicon-arrow-down"></a></li>
										<li hidden="hidden" id="orderStatus"><a href="#" class="orderPlaced progress-class"><b>Order Placed</b></a></li>
										<li><a href="#" hidden="hidden" id="arrow" class="progress-class glyphicon glyphicon-arrow-down"></a></li>
										<li><a href="#" hidden="hidden" id="payStatus" class="progress-class"><b id="paymentStatus"></b></a></li>
									</ul>		
								</div>
							</div>
						</div>
					</div> 
					<!-- checkout-progress-sidebar -->				
				</div>
			</div>
		</div>
	</div>
     
     </div>
  
     
    <%@include file="footer.jsp" %>
     
</body>
<script>
$(document).ready(function()
{
	checklogin();
	$("#arrow_order").hide();
	$("#orderStatus").hide();
    var ctxPath = "<%=request.getContextPath()%>";
    var listingid = "<%=request.getParameter("listingid")%>";
	headerFunctions(ctxPath);    
	var user = getCookie("user_details");
    if (user == "") 
    {
    	swal("Please Login");
    	document.location.href="index.jsp";
    }
	show_Welcome();
	if(listingid!="0")
	{
		displayOrderSummary(listingid);
	}
	else
	{
		fetchCart();
	}
})


function fetchCart()
{
	var ctxPath = "<%=request.getContextPath()%>";
	var user = getCookie("user_details");
	user = JSON.parse(user);
	var userId = user.id;
	$.ajax(
	{
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/cart/user/"+userId,
				success : function(cart_json)
				{
					for(i = 0; i< cart_json.length; i++)
					{
						dispOrders(cart_json[i],i);
					}
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
}

function dispOrders(cart_json,i)
{
	var ctxPath = "<%=request.getContextPath()%>";
	var user = getCookie("user_details");
	user = JSON.parse(user);
	var userId = user.id;
	$.ajax(
			{
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/listings/item/"+cart_json.itemId,
				success : function(listing_json)
				{
					if(listing_json.quantity>0)
					{
							var actualPrice = listing_json.price - (listing_json.discount*listing_json.price/100);
							$.ajax(
							{
								type : 'GET',
								contentType : 'application/json',
								url : ctxPath + "/webapi/users/"+listing_json.sellerid,
								success : function(seller_json)
								{
									var total = parseInt($("#total_th").text());
									var newQuant = listing_json.quantity - cart_json.quantity;
									var table_data =  	"<tr id='"+i+"' style='text-align: left'>"+
							    	"	<td>"+listing_json.listingName+
							    	"<input type='number' id='listingid"+i+"' value='"+listing_json.id+"' hidden='hidden'>"+
							    	"<input type='text' id='itemid"+i+"' value='"+listing_json.itemId+"' hidden='hidden'>"+
							    	"<input type='number' id='new_quant"+i+"' value='"+newQuant+"' hidden='hidden'>"+
							    	"<input type='number' id='cartid"+i+"'  value='"+cart_json.id+"' hidden='hidden'>"+
							    	"</td>"+
							    	"	<td id='quant"+i+"'>"+cart_json.quantity+"</td>"+
							    	"	<td>"+listing_json.price+"</td>"+
							    	"	<td>"+listing_json.discount+"%</td>"+
							    	"	<td id='price"+i+"' class='classPrice'>"+actualPrice+"</td>"+
							    	"	<td class='pull-right' style='text-align: right;color:green'>"+
							    	seller_json.firstName+" "+seller_json.lastName+"</td>"+
							    	"</tr>";
							    	$("#orderSummary_body").prepend(table_data);
							    	total = total + (actualPrice*cart_json.quantity);
							    	$("#total_th").html(total);
							    	if(total < 1000){
							    		$("#calc").html("50");
							    		total += 50;
							    		//alert(total)
							    		$("#total_th").html(total);
							    	}
								},
								error: function(err) 
								{
									swal(JSON.stringify(err));
								}
							});
					}
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
}

function displayOrderSummary(id)
{
	var ctxPath = "<%=request.getContextPath()%>";
	var total = parseInt($("#total_th").text());
	var user = getCookie("user_details");
	user = JSON.parse(user);
	var userId = user.id;
	$.ajax(
			{
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/listings/"+id,
				success : function(listing_json)
				{
					var actualPrice = listing_json.price - (listing_json.discount*listing_json.price/100);
					$.ajax(
							{
								type : 'GET',
								contentType : 'application/json',
								url : ctxPath + "/webapi/users/"+listing_json.sellerid,
								success : function(seller_json)
								{
							    	//alert("Listing quant: "+ listing_json.quantity);
									var table_data =  	"<tr id='0' style='text-align: left'>"+
							    	"	<td>"+listing_json.listingName+
							    	"<input type='number' id='listingid0' value='"+listing_json.id+"' hidden='hidden'>"+
							    	"<input type='text' id='itemid0' value='"+listing_json.itemId+"' hidden='hidden'>"+
							    	"<input type='number' id='new_quant0' value='"+listing_json.quantity+"' hidden='hidden'>"+
							    	"<input type='number' id='cartid0' hidden='hidden'>"+
							    	"</td>"+
							    	"	<td id='quant0'></td>"+
							    	"	<td>"+listing_json.price+"</td>"+
							    	"	<td>"+listing_json.discount+"%</td>"+
							    	"	<td id='price0' class='classPrice'>"+actualPrice+"</td>"+
							    	"	<td class='pull-right' style='text-align: right;color:green'>"+
							    	seller_json.firstName+" "+seller_json.lastName+"</td>"+
							    	"</tr>";
							    	$("#orderSummary_body").prepend(table_data);
								},
								error: function(err) 
								{
									swal(JSON.stringify(err));
								}
						});
					$.ajax(
							{
								type : 'POST',
								contentType : 'application/json',
								url : ctxPath + "/webapi/cart/user/listingid/"+id,
								data: JSON.stringify(
										{
											"userId":userId
										}
										),
								success : function(cart_json)
								{
									var curr_quant = $("#new_quant0").val();
							    	//alert("Curr quant: "+ $("#new_quant0").val());
							    	$("#quant0").html(cart_json.quantity);
							    	total = total + (actualPrice*cart_json.quantity);
							    	$("#new_quant0").val(curr_quant - cart_json.quantity);
							    	//alert("New quant: "+ $("#new_quant0").val());
							    	$("#cartid0").val(cart_json.id)
							    	$("#total_th").html(total);
							    	if(total < 1000){
							    		$("#calc").html("50");
							    		total += 50;
							    		//alert(total)
							    		$("#total_th").html(total);
							    	}
								},
								error: function(err) 
								{
									swal(JSON.stringify(err));
								}
						});
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
	
}



function buynowvalidation() 
{
	$('#loginModal').modal('toggle');
    checkCookie();
    show_Welcome();
}

function buynowsignup()
{
	$('#loginModal').modal('toggle');
	show_signup();
}

$(window).on('hidden.bs.modal', function() { 
    $('#loginModal').modal('hide');
    show_Welcome();
});

function show_Welcome()
{

    var user = getCookie("user_details");
    if (user != "") 
    {
    	data = "<div class='panel-heading'>"+
		    	"<h4 class='unicase-checkout-title'>"+
			    	"<a data-toggle='collapse' class='collapsed' data-parent='#accordion' href='#collapseOne'>"+
			    		"<span>1</span>Welcome, "+(JSON.parse(user)).firstName+
			    	"</a>"+
		    	"</h4>"+
	    	"</div>"
    	$("#login_panel").html(data);
    	$("#login_panel").removeClass("login-class");
    	$("#shipAddress").val((JSON.parse(user)).address);
    	showAddress();
    } 
}

function showAddress()
{
	$("#collapse2").removeClass("collapsed");
	$("#collapse2").attr("aria-expanded",true);
	$("#collapseTwo").addClass("in");
	$("#collapseTwo").attr("aria-expanded",true);
	$("#collapseTwo").attr("style","");
}

function hideAddress()
{
	$("#collapse2").addClass("collapsed");
	$("#collapse2").attr("aria-expanded",false);
	$("#collapseTwo").removeClass("in");
	$("#collapseTwo").attr("aria-expanded",false);
	$("#collapseTwo").attr("style","height:0px");
}

function hideOrder()
{
	$("#collapse3").addClass("collapsed");
	$("#collapseThree").removeClass("in");
	$("#collapse2").attr("aria-expanded",false);
	$("#collapseThree").attr("aria-expanded",false);
	$("#collapseThree").attr("style","height:0px");
}

function showOrder()
{
	$("#collapse3").removeClass("collapsed");
	$("#collapseThree").addClass("in");
	$("#collapse2").attr("aria-expanded",true);
	$("#collapseThree").attr("aria-expanded",true);
	$("#collapseThree").attr("style","");
}

function showPayment()
{
	$("#collapse4").removeClass("collapsed");
	$("#collapseFour").addClass("in");
	$("#collapse4").attr("aria-expanded",true);
	$("#collapseFour").attr("aria-expanded",true);
	$("#collapseFour").attr("style","");
}

function hidePayment()
{
	$("#collapse4").addClass("collapsed");
	$("#collapseFour").removeClass("in");
	$("#collapse4").attr("aria-expanded",false);
	$("#collapseFour").attr("aria-expanded",false);
	$("#collapseFour").attr("style","height:0px");
}

function orderSummary()
{
	hideAddress();
	showOrder();
}

function updateQuant(listingid,new_quant)
{ 
	var ctxPath = "<%=request.getContextPath()%>";
	
	$.ajax(
		{
			type : 'PUT',
			contentType : 'application/json',
			url : ctxPath + "/webapi/listings/update/"+listingid,
			data : JSON.stringify({
		        "quantity": new_quant
			}),
			success : function() {
			},
			error: function() {
				swal(JSON.stringify(err));
			}
	});
}

function insertOrders()
{
	if ($(".login-class")[0])
	{
		hideOrder(); 
	    $('#loginModal').modal('show');
	} 
	else 
	{
		var shipAddress = $("#shipAddress").val().trim();
		if(shipAddress=="")
		{
			hideOrder();
			$("#addrWarning").show();
			showAddress();
		}
		else
		{
			$("#confirmOrder").prop('disabled', true);
			$("#arrow_order").show();
			$("#orderStatus").show();
			hideOrder();
			showPayment();
		}
	}
}

function insertOrder(status,rowid)
{
	checklogin();
	var ctxPath = "<%=request.getContextPath()%>";
	$.ajax(
		{
			type : 'POST',
			contentType : 'application/json',
			url : ctxPath + "/webapi/orders/create",
			data : order_formToJSON(status,rowid),
			success : function(data) 
			{
			},
			error: function(err) 
			{
				swal(JSON.stringify(err));
			}
	});
}


function order_formToJSON(status,rowid) 
{
	var shipAddress = $("#shipAddress").val().trim();	
	<%Timestamp timeStamp = new Timestamp(System.currentTimeMillis());
	  int orderid = Math.abs((int)timeStamp.getTime());%>
	var orderid = <%=orderid%> + rowid;
    var user = getCookie("user_details");
	var userid = JSON.parse(user).id;
	var fname = JSON.parse(user).firstName;
	var lname = JSON.parse(user).lastName;
	var TotalAmount = parseInt($("#quant"+rowid).text()) * parseInt($("#price"+rowid).text());
	<%
	Date myDate = new Date();
	String today = new SimpleDateFormat("yyyy-MM-dd").format(myDate);%>
	var flopkartOrder = JSON.stringify({
        "itemId": $("#itemid"+rowid).val(),
        "orderId": orderid,
	    "shippingAddress" : fname +" " + lname + " , "+shipAddress,
	    "userId" : userid,
	    "quantity": $("#quant"+rowid).text(),
	    "status" : status,
	    "totalAmount" : TotalAmount  
	});
	//swal(flopkartOrder);
	return flopkartOrder;
}



function flopkartBank()
{
	
}

function displayDetails(id)
{
	var ctxPath = "<%=request.getContextPath()%>";
	
	var total = parseInt($("#total_th").text());
	$.ajax(
			{
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/listings/"+id,
				success : function(listing_json)
				{
					var actualPrice = listing_json.price - (listing_json.discount*listing_json.price/100);
					var table_data =  	"<tr>"+
			    	"	<td>"+listing_json.listingName+"</td>"+
			    	"	<td>1</td>"+
			    	"	<td>"+listing_json.price+"</td>"+
			    	"	<td>"+listing_json.discount+"%</td>"+
			    	"	<td class='classPrice'>"+actualPrice+"</td>"+
			    	"</tr>";
			    	$("#orderSummary_body").prepend(table_data);
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
}


function proceedToPay()
{
	checklogin();
	if ($(".login-class")[0])
	{
		hidePayment(); 
	    $('#loginModal').modal('show');
	} 
	else 
	{
		var shipAddress = $("#shipAddress").val().trim();
		if(shipAddress=="")
		{
			hidePayment();
			$("#addrWarning").show();
			showAddress();
		}
		else
		{
			if($(".orderPlaced")[0])
			{
				var accountno = $("#accountno").val();
				var pin = $("#pin").val();
				if(accountno=="" || pin=="" || isNaN(pin))
				{
					$("#accWarning").show();
				}
				else
				{
					var ctxPath = "<%=request.getContextPath()%>";
					$.ajax(
						{
							type : 'POST',
							contentType : 'application/json',
							url : ctxPath + "/webapi/accounts/accountno",
							data : JSON.stringify({
								"accountno": accountno,
							    "pin":pin 
							}),
							success : function(data)
							{
								if(!data)
								{
									$("#accWarning").text("No such account");
									$("#accWarning").show();
								}
								else if(!data.id)
								{
									$("#accWarning").text("Wrong pin");
									$("#accWarning").show();
								}
								else
								{
									var TotalAmount =parseInt($("#total_th").text());
									if(parseInt(data.balance)>=parseInt(TotalAmount))
									{
											$("#accWarning").hide();
											deductBalance(data.balance-TotalAmount,data.id);
											addBalanceFlopkart(TotalAmount);
									}
									else
									{
											$("#accWarning").text("Balance Insufficient");
											$("#paymentStatus").text("Tansaction Failed");
											$("#paymentStatus").attr("style","color:red");
											$("#arrow").attr("style","color:red");
											$("#accWarning").show();
											$("#arrow").show();
											$("#paymentStatus").show();
											$("#proceed").prop('disabled', true);
										      
											$('#order_table > tbody > tr').each(function(i,row) 
												{
												var rowid = row.id;
												        if(rowid!="")
												       	{
												    		var listingid = $("#listingid"+rowid).val();
												    		var new_quant = $("#new_quant"+rowid).val();
											 				insertOrder("Failed",parseInt(rowid));
												        }
												 });
									    	swal({
												  title: "Transaction Failed",
												  text: "Due to insuffient balance",
												  icon: "error"
											});
									}
								}
							},
							error: function(err) 
							{
								swal(JSON.stringify(err));
							}
					});
				}
			}
			else
			{
				hidePayment();
				$("#orderWarning").show();
				showOrder();
			}
		}
	}
}

function deductBalance(amt,id)
{
	var ctxPath = "<%=request.getContextPath()%>";
	$.ajax(
		{
			type : 'PUT',
			contentType : 'application/json',
			url : ctxPath + "/webapi/accounts/update/"+id,
			data : JSON.stringify({
				"balance": amt
			}),
			success : function(data)
			{
				$("#paymentStatus").text("Money Paid");
				$("#proceed").prop('disabled', true);
				$("#paymentStatus").attr("style","color:green");
				$("#arrow").attr("style","color:green");
				$("#arrow").show();
				$("#paymentStatus").show();
			      
				$('#order_table > tbody > tr').each(function(i,row) 
					{
					var rowid = row.id;
					        if(rowid!="")
					       	{
					    		var listingid = $("#listingid"+rowid).val();
					    		var new_quant = $("#new_quant"+rowid).val();
					    		var quan = $("#quant"+rowid).text();
					    		var price = parseInt($("#price"+rowid).text());
					    		var tot = parseInt(price)*parseInt(quan);
				 				insertOrder("Money Paid",parseInt(rowid));
				 				deleteFromCart(parseInt(rowid));
								updateQuant(listingid,new_quant);
// 								alert(listingid + " " + tot +" " +quan +" "+price);
			 					addwalletmoney(listingid,tot);
					        }
					 });
				swal("Order placed successfully!", {
				      icon: "success",
				});
 				
			},
			error: function(err) 
			{
				swal(JSON.stringify(err));
			}
	});
}


function deleteFromCart(rowid)
{
	var ctxPath = "<%=request.getContextPath()%>";
	var cartid = $("#cartid"+rowid).val();
	$.ajax(
			{
				type : 'DELETE',
				contentType : 'application/json',
				url : ctxPath + "/webapi/cart/delete/"+cartid,
				success : function(){
				},
				error : function(){
					swal("Could not remove from cart");
				}
		});
}

function addwalletmoney(listingid,amt)
{	
	var ctxPath = "<%=request.getContextPath()%>";
	amt = amt * 0.15;
	$.ajax(
			{	
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/listingDeals/listing/"+listingid,		//chk tht item is in a deal
				success : function(res)
				{	
					if (res != [] )
					{	var deal_id = res[0].dealid;				
						$.ajax({   
									type : 'GET',
									contentType : 'application/json',
									url : ctxPath + "/webapi/deals/"+deal_id,		//gets dealid and  go to dealtable
									success : function(data)
									{	
										if(data.dealname =="15% Cashback")	//chks wheather its the 15% cashbak deal
										{
											var ctxPath = "<%=request.getContextPath()%>";
										    var user = getCookie("user_details");
										    if (user != "") 
										    { 	
												var user_json = JSON.parse(user);
												var amount = parseInt(amt) + parseInt(user_json.wallet);
												
												$.ajax(
													{
														type : 'PUT',
														contentType : 'application/json',
														url : ctxPath + "/webapi/users/update/"+user_json.id,
														data : JSON.stringify({
															"wallet": amount
														}),
														success : function(data)
														{	
															user_json.wallet = amount;
															user = JSON.stringify(user_json);
															setCookie("user_details", user, 30);
															swal("Succesfully added Money to  your wallet")
														},
														error: function(err) 
														{
															swal(JSON.stringify(err));
														}
												});
										    }
									    }
									},
									error: function(err) 
									{
										swal(JSON.stringify(err));
									}
							});
						
					}
					else
						swal("no such itemid");
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
}


function addBalanceFlopkart(amt)
{
	var ctxPath = "<%=request.getContextPath()%>";
	$.ajax(
			{
				type : 'GET',
				contentType : 'application/json',
				url : ctxPath + "/webapi/accounts/accountno/1",
				success : function(res)
				{
					var amount = amt + res.balance;
					$.ajax(
						{
							type : 'PUT',
							contentType : 'application/json',
							url : ctxPath + "/webapi/accounts/update/1",
							data : JSON.stringify({
								"balance": amount
							}),
							success : function(data)
							{
							},
							error: function(err) 
							{
								swal(JSON.stringify(err));
							}
					});
				},
				error: function(err) 
				{
					swal(JSON.stringify(err));
				}
		});
}


function checklogin()
{
	var user = getCookie("user_details");
    if (user == ""){
    	swal({
			  title: "Please Login",
			  text: "Login to continue",
			  icon: "error"
			})
			.then((redirect) => {
			  if (redirect) {
				  window.location.href = "index.jsp";
			  }
			  else {
				  window.location.href = "index.jsp";
			  }
		});
    } 
}

// function updateOrder(status,rowid)
// {
<%-- 	var ctxPath = "<%=request.getContextPath()%>"; --%>
<%-- 	var orderid = <%=orderid%> + rowid; --%>
// //	alert(orderid);
// 	$.ajax(
// 		{
// 			type : 'GET',
// 			contentType : 'application/json',
// 			url : ctxPath + "/webapi/orders/order/"+orderid,
// 			success : function(data)
// 			{
// // 				alert(data[0].itemId);
// 				$.ajax(
// 						{
// 							type : 'PUT',
// 							contentType : 'application/json',
// 							url : ctxPath + "/webapi/orders/update/"+data[0].id,
// 							data : JSON.stringify({
// 								"status": status
// 							}),
// 							success : function(data)
// 							{
								
// 							},
// 							error: function(err) 
// 							{
// 								swal(JSON.stringify(err));
// 							}
// 					});
// 			},
// 			error: function(err) 
// 			{
// 				swal(JSON.stringify(err));
// 			}
// 	});
// }


</script>
</html>