<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>TSF Banking</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
&nbsp
		<div class="header">
			<img src="Images/logo.png" width="70"> <a
				href="home.jsp">Home</a> <a href="transfer.jsp">Transfer Money</a> <a
				href="history.jsp">Transaction History</a> 
				
			<p>Your Balance:</p>
			<%@page import="java.sql.*"%>
			<%
				String url = "jdbc:mysql://localhost:3306/banking?serverTimezone=UTC";
				String uname = "root";
				String pass = "";
				try {
					Class.forName("com.mysql.cj.jdbc.Driver");
					String query = "SELECT * FROM balance";
					Connection c = DriverManager.getConnection(url, uname, pass);
					Statement st = c.createStatement();     
					ResultSet rs = st.executeQuery(query);      
					while (rs.next()) {
						int balance = rs.getInt("balance");
			%>
			
			<p ><%=balance%></p> 
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
			
		</div>
	<div class="mainBox">
		<h1>Welcome to TSF Banking</h1>
		<img src="Images/bank.png" align="center">
	</div>
	<div class="sideBox">
		<form action="transfer.jsp" method="post">
			<img src="Images/money_transfee.png" align="center" width="300">
			<input class="buttons" type="submit" value="Transfer Money">
		</form>
		<form action="history.jsp" method="post">
			<img style="margin-top: 50px;" src="Images/history.png"
				align="center" width="300"> <input class="buttons"
				type="submit" value="Transfer History">
		</form>
	</div>
</body>
</html>