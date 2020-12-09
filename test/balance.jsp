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
<head>
<style>
h1{
    font-style:italic;
    font-size:40px;
    
}
        body{
      background-image: url(all.jpg);
      background-repeat: no-repeat;
      background-attachment: fixed;
       background-size: cover;
       padding-left:30%;
        }
        td{
                font-size:35px;
                /* color:white; */
                text-align:left;
        }
        table{
            border-collapse: collapse;
            border:7px;
        }
</style>
</head>
<body>

<h1>All the Bank Accounts  Balance</h1>
<table border="1">
<tr>
<%-- <td style="color:white;text-align:center;">Account Holder Name</td> --%>
<td style="color:white;text-align:center;">Account Number</td>
<td style="color:white;text-align:center;">balance</td>
</tr>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from balance";
resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr>
<td><%=resultSet.getString("Account_Number") %></td>
<td><%=resultSet.getString("Amount") %></td>
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