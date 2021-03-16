<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Money Transfer</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
&nbsp
	<div class="header" style= "margin-top: 0px !important">
			<img src="Images/logo.png" width="70"> <a
				href="index.jsp">Home</a> <a href="transfer.jsp">Transfer Money</a> <a
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
	<h1>Money Transfer</h1>
	<table class="table">
		<tr>
			<th>S. No</th>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Account No</th>
			<th>Transfer Money</th>
		</tr>

		<%
			try {
				int n = 0;
				Class.forName("com.mysql.cj.jdbc.Driver");
				String query = "SELECT * FROM transfer";
				Connection c = DriverManager.getConnection(url, uname, pass);
				Statement st = c.createStatement();
				ResultSet rs = st.executeQuery(query);
				while (rs.next()) {
					n += 1;
					int id = rs.getInt("id");
					String fname = rs.getString("fname");
					String lname = rs.getString("lname");
					String acc_no = rs.getString("acc_no");
		%>
		<tr>
			<td><%=id%></td>
			<td><%=fname%></td>
			<td><%=lname%></td>
			<td><%=acc_no%></td>
			<td><a class="tbutton"
				href="transaction.jsp?fname=<%=fname%>&lname=<%=lname%>&acc_no=<%=acc_no%>">Transfer</a></td>
		</tr>
		<%
			}
				c.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		%>
	</table>
</body>
</html>