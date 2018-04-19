function headerFunctions(ctxPath)
{	
	$("#signup").hide();
	$(".warning").hide();
	checkCookie();	
	
	$("#f_name").focus(function(){
	        $('.warning').hide(); // hide error popup
	});
	$("#l_name").focus(function(){
	        $('.warning').hide(); // hide error popup
	});
	
	$("#phone").focus(function(){
	       $('.warning').hide(); // hide error popup
	});
	$("#email").focus(function(){
	       $('.warning').hide(); // hide error popup
	});
	$("#pass_txt").focus(function(){
	      $('.warning').hide(); // hide error popup
	});
	fetch(ctxPath);
}
	
function fetch(ctxPath) 
{
	$.ajax(
	{
		type : 'GET',
		contentType : 'application/json',
		url : ctxPath + "/webapi/categories",
		dataType : "json", // data type of response
		success :
			function(data)
			{
				categoryMenu(data,ctxPath);
			},
    	error:
    		function() 
    		{
        	//alert("error occurred");
    		}
	});
}
	
function categoryMenu(result,ctxPath)
{
	for(var i in result)
	{
		var li_node = document.createElement("LI");                 // Create a <li> node
		li_node.className="dropdown";
		li_node.setAttribute("id", "li_"+result[i].id);
		li_node.setAttribute("name", result[i].categoryName);
		var dropdownContent = "dropdownContent(this,'"+ctxPath+"')";
		var scrt_var = 10; 
		var onclickContent = "location.href=this.href+'?key='+scrt_var;";
		var data = " <a href='ListingSearch.jsp'  style='color:black' data-hover='dropdown' "+
				 " onmouseover="+dropdownContent+" onmouseout='setTimeout(dropdownBack,3000, this);' "+
		         "class='category-dropdown dropdown-toggle' data-toggle='dropdown' id='"+
		         result[i].id+"'>"+	result[i].categoryName +
		 		"<span id='span_"+ result[i].id+"' style='color:grey' class='glyphicon glyphicon-chevron-down'></span>"+
				"</a>";
		var data1 = "<ul class='dropdown-menu pages'>"+
					"<li>"+
						"<div class='yamm-content'>"+
							"<div class='row'>"+
								"<div class='col-xs-12 col-menu'>"+
									"<ul class='links' id='ul_"+ result[i].id+"'>"+
					"</ul></div></div></li></ul>";
		document.getElementById("category_dropdown").appendChild(li_node);
		$(li_node).html(data + data1);
	} 

}
	
function dropdownContent(obj,ctxPath)
{
	var categoryid = obj.id;
//	var ctxPath = "http://localhost:8080/flopkartPrototype";
		$.ajax(
		{
			type : 'GET',
			contentType : 'application/json',
			url : ctxPath + "/webapi/subcategories/category/"+categoryid,
			dataType : "json", // data type of response
			success : 
				function(data)
				{
					subCategoryDropdown(data,categoryid);
				},
	    	error:
	    		function() 
	    		{
	        	//alert("error occurred");
	    		}
		});
 	$(obj).css("color","blue");
 	$('#span_'+obj.id).toggleClass('glyphicon-chevron-down glyphicon-chevron-up');
 	$('#li_'+obj.id).addClass('open');
}

function subCategoryDropdown(result,categoryid)
{
	var data = "";
	if(Object.keys(result).length>0)
	{	
		for(var i in result)
		{
			data = data + "<li> <a href='ListingSearch.jsp?id="+result[i].id+"'>"
					+result[i].subcategoryName+"</a></li>";
		}
		$('#ul_'+categoryid).html(data);
	}
 
	
	else
		$('#li_'+categoryid).removeClass('open');
		

}

function dropdownBack(obj)
{
 	$(obj).css("color","black");
 	$('#span_'+obj.id).toggleClass('glyphicon-chevron-up glyphicon-chevron-down');
 	$('#li_'+obj.id).removeClass('open');
// 	$('#ul_'+obj.id).empty();
}

function show_signup()
{ 
	$("#old").hide();
	$("#signup").show();
}
	
	
function show_old()
{ 
	$("#old").show();
	$("#signup").hide();
}
	
function signup(ctxPath) 
{	
	if (!$("#f_name").val() )
	{
		$("#warning_fname").show();
		return false;
	}
	if (!$("#l_name").val() )
	{
		$("#warning_lname").show();
		return false;
	}
	var email = $("#email").val();
	var phone = $("#phone").val();
	if ( !phone.match(/^[0-9]{10}$/))
	{
		$("#warning_phone_new").show();
		return false;
	}
	if (!$("#email").val() )
	{
		$("#warning_email_new").show();
		return false;
	}
	else if (!email.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
	{
		$("#warning_email_new").show();
		return false;
	}
		
	if (!$("#pass_txt").val() )
	{
		$("#warning_pass_new").show();
		return false;
	}
	$.ajax(
	{
	type : 'POST',
	async: false,
	contentType : 'application/json',
	url : ctxPath + "/webapi/users/create",
	dataType : "json", // data type of response
	data : signupformToJSON(),
	success : renderDetails,
	error : function(err)
			{
				var status = err.status;
				if(status==200){
					$('#loginModal').modal('hide');
					swal({
						  title: "Success",
						  text: "User signed up successfully!",
						  icon: "success"
						})
						.then((reload) => {
						  if (reload) { 
							  window.location.reload(true);
						  }
						  else {
							  window.location.reload(true);
						  }
					});
				}
			}
	});
}

function renderDetails(user)
{ 
	if (user == null)
	{
		$("#warning_register").show();
	}
	else if (user.id === 0)
	{	
		$("#warning_pass").show();
	}
	else
	{
		showUser(user);
		setCookie("user_details", JSON.stringify(user), 30);
		$('#loginModal').modal('hide');
	}

	return false;
}

function signupformToJSON() 
{
    $("#email_phone").val($("#email").val());
	$("#pass_text").val($("#pass_txt").val());
	var fname = $("#f_name").val();
	var lname = $("#l_name").val();
	var email = $("#email").val();
	var password = $("#pass_txt").val();
	var phone = $("#phone").val();
	var userType = "customer";	
		
	var flipkart_user = JSON.stringify({
				"firstName":fname,
				"lastName":lname,
				"phone":phone,
        		"email":email,
        		"password":password,
        		"userType":userType,
        		"wallet":0
    });
	return flipkart_user;
}
	
function checkCookie() 
{
    var user = getCookie("user_details");
    if (user != "") 
    {
    	setCookie("user_details", user, 30);
        showUser(JSON.parse(user));
    } 
    else 
    {
    	showLogin();
    	//$('#loginModal').modal('toggle');
    }
}

function showLogin()
{
	$("#registered").hide();
	$("#unregistered").show();
}

function showUser(user)
{
	$("#registered").show();
	$("#unregistered").hide();
}

function validate(ctxPath) 
{
	$(".warning").hide();
	var email_phone = $("#email_phone").val();
	var len = email_phone.length;
	if(email_phone.match(/^[0-9]/))
	{
		if (len!=10 || !email_phone.match(/^[0-9]{10}$/))
		{
			$("#warning_email").show();
			return false;
		}
	}
	else if (!email_phone.match(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/))
	{
			$("#warning_email").show();
			return false;
	}
	else
		findUser(ctxPath);
}
		
//Helper function to serialize all the form fields into a JSON string
function formToJSON() 
{
    var email = $("#email_phone").val();
	var password = $("#pass_text").val();
	var flipkart_user = JSON.stringify({
    	"email":email,
    	"password":password
    	});
	return flipkart_user;
}

function findUser(ctxPath) 
{
	$.ajax(
	{
		type : 'POST',
		contentType : 'application/json',
		url : ctxPath + "/webapi/users/email",
		dataType : "json", // data type of response
		data : formToJSON(),
		success : renderDetails
    });
}
	
function onSignIn(googleUser) {
	  var profile = googleUser.getBasicProfile();
	  console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
	  console.log('Name: ' + profile.getName());
	  console.log('Image URL: ' + profile.getImageUrl());
	  console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.
	  
	  var flipkart_user = JSON.stringify({
	    	"email":profile.getEmail()
	    });
	  
	  $.ajax({
		type : 'POST',
		async: false,
		contentType : 'application/json',
		url : "http://localhost:8080/flopkartPrototype/webapi/users/gmail",
		dataType : "json", // data type of response
		data : flipkart_user,
		success : function(user)
		{
			renderDetailsGoogle(user,profile);
		}
	 });
}

function renderDetailsGoogle(user,profile)
{    
	var name = profile.getName();
	var firstName = name.split(" ")[0];
	var lastName = name.split(" ")[1];
	var flipkart_user = JSON.stringify({
		"firstName":firstName,
		"lastName":lastName,
  		"email":profile.getEmail(),
  		"password":"password",
  		"userType":"customer",
		"wallet":0
  });
	
	if (user == null)
	{
		$.ajax({
			type : 'POST',
			async: false,
			contentType : 'application/json',
			url : "http://localhost:8080/flopkartPrototype/webapi/users/create",
			dataType : "json", // data type of response
			data : flipkart_user,
			success : signupGoogle,
			error:  function(err)
			{
				var status = err.status;
				if(status==200)
				{
					$('#loginModal').modal('hide');
					swal({
						  title: "Success",
						  text: "User signed up successfully!",
						  icon: "success"
						})
						.then((reload) => 
						{
						  if (reload) 
						  {
							  signOut();
							  window.location.reload(true);
						  }
						  else 
						  {
							  signOut();
							  window.location.reload(true);
						  }
					});
				}
			}
		});
	}
	else
	{
		showUser(user);
		setCookie("user_details", JSON.stringify(user), 30);
		$('#loginModal').modal('hide');
	}
	return false;
}

function signupGoogle(user)
{
	//alert(JSON.stringify(user));
	showUser(user);
	setCookie("user_details", JSON.stringify(user), 30);
	$('#loginModal').modal('hide');
}

function signOut() 
{
    var auth2 = gapi.auth2.getAuthInstance();
    auth2.signOut().then(function () 
    {
      console.log('User signed out.');
    });
 }