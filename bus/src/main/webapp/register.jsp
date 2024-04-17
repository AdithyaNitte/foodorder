 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<title>Register</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div class="container">
<h1>Register</h1>
       <form >
 			<label for="username">Username:</label>
 			<input type="text" id="username" name="Username" required autocomplete="off"><br>
 			
 			<label for="email">email:</label>
 			<input type="text" id="email" name="Email" required  autocomplete="off"><br>
 			
 			<label for="password">password:</label>
 			<input type="text" id="password" name="Password" required autocomplete="off"><br>
 			
 			<button >Register</button>
 			
        </form>
        
        <p><a href="index.html">Back to Home</a></p>


</div>
<%
	
	String Username=request.getParameter("Username");
	String Email=request.getParameter("Email");
	String Password=request.getParameter("Password");
	
	

		try{
			String url = "jdbc:mysql://localhost:3306/foodorder";
			String userName = "root";
			String password = "mysql";
			
			
		    Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Connection
			Connection con = DriverManager.getConnection(url,userName,password);
			String query ="INSERT INTO users (username,email,password)VALUES(?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
					
			ps.setString(1,Username);
			ps.setString(2,Email);
			ps.setString(3,Password);
			
			
			ps.executeUpdate();
			con.close();
		}
		catch(Exception e)//super class this is present in java.lang package
		//because it is a default package
		{
			e.printStackTrace();
		}
	
	
	
%>
 
</body>
</html>