<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="style.css">
</head>
<body>
&nbsp
	<div class="header">
		<img src="Images/logo.png" width="70"> <a href="index.jsp">Home</a>
		<a href="transfer.jsp">Transfer Money</a> <a href="history.jsp">Transaction
			History</a>
		<p class="b">Your Balance:</p>
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
		String a = request.getParameter("amount");
		int amount = Integer.parseInt(a);
	%>
	<%@page import="java.sql.*"%>
	<%
		try {
			int n = 0;
			int balance = 0;
			Class.forName("com.mysql.cj.jdbc.Driver");
			String query = "SELECT * FROM balance";
			Connection c = DriverManager.getConnection(url, uname, pass);
			Statement st = c.createStatement();
			ResultSet rs = st.executeQuery(query);
			while (rs.next()) {
				balance = rs.getInt("balance");
			}
			if (balance < amount) {
	%>
	<h1>Transaction Unsuccessful</h1>
	<h2>Insufficient Balance</h2>
	<p id="return">
		Return to <a href="home.jsp">Home Page</a>
	</p>
	<%
		} else {
	%>
	<h1>Transaction Successful</h1>
	<p id="return">
		Return to <a href="index.jsp">Home Page</a>
	</p>
	<%
		balance = balance - amount;
				query = "UPDATE balance SET balance = ?";
				PreparedStatement st1 = c.prepareStatement(query);
				st1.setInt(1, balance);
				int result = st1.executeUpdate();

				query = "INSERT INTO history (fname, lname, acc_no, amount) values (?, ?, ?, ?)";
				st1 = c.prepareStatement(query);
				st1.setString(1, fname);
				st1.setString(2, lname);
				st1.setString(3, acc_no);
				st1.setString(4, a);
				result = st1.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	%>
	</table>
</body>
</html>