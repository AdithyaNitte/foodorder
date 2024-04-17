<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 
 pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>

.last{
position:absolute;
left:550px;
color:white;

}

.new{

position :absolute;
left:15px;
}


.card {
  position: relative;
  width: 190px;
  height: 254px;
  background-color: #000;
  display: flex;
  flex-direction: column;
  justify-content: end;
  padding: 12px;
  gap: 12px;
  border-radius: 8px;
  cursor: pointer;
  
}

.card::before {
  content: '';
  position: absolute;
  inset: 0;
  left: -5px;
  margin: auto;
  width: 200px;
  height: 264px;
  border-radius: 10px;
  background: linear-gradient(-45deg, #e81cff 0%, #40c9ff 100% );
  z-index: -10;
  pointer-events: none;
  transition: all 0.6s cubic-bezier(0.175, 0.885, 0.32, 1.275);
}

.card::after {
  content: "";
  z-index: -1;
  position: absolute;
  inset: 0;
  background: linear-gradient(-45deg, #fc00ff 0%, #00dbde 100% );
  transform: translate3d(0, 0, 0) scale(0.95);
  filter: blur(20px);
}

.heading {
  font-size: 20px;
  text-transform: capitalize;
  font-weight: 700;
}

.card p:not(.heading) {
  font-size: 14px;
}

.card p:last-child {
  color: #e81cff;
  font-weight: 600;
}

.card:hover::after {
  filter: blur(30px);
}

.card:hover::before {
  transform: rotate(-90deg) scaleX(1.34) scaleY(0.77);
}

body{

background-color:black;
color:white;
}


</style>


</head>
<body>
<center>


<h1>FILL IN YOUR DETAILS</h1>

	<div class="card">
  <p class="heading">
  
    
  </p>
  <p>
 
  </p>
  
  <p>
  
     <form  class="new" autocomplete="off">
   
		<div>
			<label for="Customername"><b>Enter Your Name :</b> </label><br/>
			<input type="text" name="Customername" required>
		</div>
		<div>
		<label for="Customeremail"><b>Enter Your Email :</b> </label><br/>
			<input type="email" name="Customeremail">
		</div>
		<div>
			<label for="Customerphone"><b>Enter Your Phone :</b> </label><br/>
			<input type="text" name="Customerphone">
		</div>
		<div>
			<label for="address"><b>Enter Your Address</b> </label><br/>
			<input type="text" name="address">
		</div>
		<div>
			<label  for="payment"><b>Enter the Payment Method</b> </label><br/>
			<input type="text" name="payment">
			
		</div><br/>
	<button>Submit</button>
	
	<br>
	<br>
	
</form>
</p></div>
</center>
   <a href="main.html"><h3 class="last">Go to Home page </h3></a>




<%
	String Customername=request.getParameter("Customername");
	String Customeremail=request.getParameter("Customeremail");
	String Customerphone=request.getParameter("Customerphone");
	String address=request.getParameter("address");
	String payment=request.getParameter("payment");
	String message="";
	

		try{
			
			String url = "jdbc:mysql://localhost:3306/checkout";
			String userName = "root";
			String password = "mysql";
			
		    Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Connection
			Connection con = DriverManager.getConnection(url,userName,password);
			String query ="INSERT INTO customer (name,email,phone,address,payment)VALUES(?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(query);
					
			
			ps.setString(1,Customername);
			ps.setString(2,Customeremail);
			ps.setString(3,Customerphone);
			ps.setString(4,address);
			ps.setString(5,payment);
			
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
