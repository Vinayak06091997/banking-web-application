<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
String id = request.getParameter("userid");
String driver = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String database = "stack";
String userid = "root";
String password = "";
try {
Class.forName(driver);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}
Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
<!DOCTYPE html>
<html>
<style>
body{
      background-image: url(all.jpg);
      background-repeat: no-repeat;
      background-attachment: fixed;
       background-size: cover;
       padding-left:30%;
        }</style>
<body>

<h1>Transaction Details</h1>
<table border="1">
<tr>
<td>Date</td>
<td>Account Number</td>
<td>Description</td>
<td>Reference</td>
<td>withdrawl </td>
<td>Deposite</td>
<td>Balance</td>

</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from tra";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Rate") %></td>
<td><%=resultSet.getString("Account_Number") %></td>
<td><%=resultSet.getString("description") %></td>
<td><%=resultSet.getString("R_ID") %></td>
<td><%=resultSet.getString("withd") %></td>
<td><%=resultSet.getString("deposit") %></td>
<td><%=resultSet.getString("Balance") %></td>
</tr>
<%
}
connection.close();
} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
</body>
</html>