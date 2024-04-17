<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
<h1>Login</h1>
       <form action="Servletlogin" method="post">
 			<label for="username">Username:</label>
 			<input type="text" id="username" name="username" required  autocomplete="off"><br>
 			
 			<label for="password">password:</label>
 			<input type="text" id="password" name="password" required autocomplete="off"><br>
 			
 			<button type="submit">login</button>
        </form>
        
        <p><a href="index.html">Back to Home</a></p>
        
        
         <%-- Display error message if login fails --%>
        <% String error = request.getParameter("error");
            if (error != null && error.equals("1")) { %>
                <p style="color: red;">Invalid username or password. Please try again.</p>
        <% } %>

</div>

</body>
</html>