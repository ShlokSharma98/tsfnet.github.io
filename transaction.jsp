<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Transaction</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
&nbsp
	<div class="header">
			<img src="Images/logo.png" width="70"> <a
				href="index.jsp">Home</a> <a href="transfer.jsp">Transfer Money</a> <a
				href="history.jsp">Transaction History</a>
			<p class = "b">Your Balance:</p>
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
			<p><%=balance%></p>
			<%
				}
				} catch (Exception e) {
					e.printStackTrace();
				}
			%>
		</div>
	<%
		String fname = (String) request.getParameter("fname");
		String lname = (String) request.getParameter("lname");
		String acc_no = (String) request.getParameter("acc_no");
	%>
	<h1>Transaction</h1>
	<form action="money_sent.jsp" method="post">
		<table class=table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Account Number</th>
				<th>Amount</th>
			</tr>
			<tr>
				<td><%=fname%></td>
				<td><%=lname%></td>
				<td><%=acc_no%></td>
				<td><input class="amount" type="number" name="amount" required></td>
			</tr>
		</table>
		<input type="hidden" name="acc_no" value=<%=acc_no%>> <input
			type="hidden" name="fname" value=<%=fname%>> <input
			type="hidden" name="lname" value=<%=lname%>>
		<div class="transfer">
			<input class="transferbutton" type="submit" value="Transfer">
		</div>
	</form>
</body>
</html>