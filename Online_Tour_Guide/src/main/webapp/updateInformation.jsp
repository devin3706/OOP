<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import = "com.info.model.Information" %>    
<%@ page import = "com.info.service.IInfoService" %>
<%@ page import = "com.info.service.InfoServiceImpl" %>
<%@ page import = "java.util.ArrayList" %>


<!DOCTYPE html>
<html>
<head>
  	<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Hugo 0.84.0">
    <title>Update Information</title>

    <link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">

    

    <!-- Bootstrap core CSS -->
	<link href="style/dist/css/bootstrap.min.css" rel="stylesheet">
	
	<script>
		function toHomePage(){
			window.location.href = "home.html";
		}
		
		function validateUpdate() {
            // Get form elements
            var locid = document.forms["updateForm"]["locid"].value;
            var heading = document.forms["updateForm"]["heading"].value;
            var dscrption = document.forms["updateForm"]["dscrption"].value;

            // validation
            if (locid === "" || dscrption == "") {
                alert("Required fields are not filled out");
            }else if(!locid.includes("LOC-")){
            	alert("Entered Location ID is Invalid");
            }else{
            	alert("Information updated Successfully");
            }
        }
	</script>

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>

    
    <!-- Custom styles for this template -->
    <link href="style/dist/css/form.css" rel="stylesheet">
</head>
<body>
	
	<%
		String infoID = (String) request.getAttribute("infoID");
	
		IInfoService iInfoService = new InfoServiceImpl();
		ArrayList<Information> infoList = iInfoService.getInfoById(infoID);
	%>

	<main class="form-signin">
	
		<%	
			for(Information information : infoList){
		%>
			
			  <form action="<%=request.getContextPath()%>/update" method="post" id="updateForm">
			    
			    <h1 class="h3 mb-3 fw-normal">Update Information</h1>
			
			    <div class="form-floating">
			      <input type="text" id="infoid" class="form-control" size="50" name="infoID" value="<%= information.getInfoID() %>" disabled>
			      <label for="infoid">Information ID</label>
			      <input type="hidden" name="infoID" value="<%= information.getInfoID() %>">
			    </div>
			    <div class="form-floating">
			      <input type="text" id="locid" class="form-control" size="50" name="locationID" value="<%= information.getLocationID() %>" required>
			      <label for="locid">Location ID</label>
			    </div>
			    <div class="form-floating">
			      <input type="text" id="heading" class="form-control" size="50" name="heading" value="<%= information.getHeading() %>">
			      <label for="heading">Heading</label>
			    </div>
			    <div class="form-floating">
			      <textarea rows="10" cols="50" id="dscrption" class="form-control" name="description" required><%= information.getDescription() %></textarea>
			      <label for="dscrption">Description</label>
			    </div>
			    
			    <button class="w-100 btn btn-lg btn-primary" type="submit" onclick="validateUpdate()">Update Information</button><br><br>
			    <button class="w-100 btn btn-lg btn-secondary" type="button" onclick="toHomePage()">Cancel</button>
			  </form>
			
		<%		
			}
		%>
		
	</main>

</body>
</html>