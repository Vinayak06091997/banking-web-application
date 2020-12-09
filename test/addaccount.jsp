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
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  body{
      background-image: url(add.png);
      background-repeat: no-repeat;
      background-attachment: fixed;
       background-size: cover;
  }
    h1 {
    font-size: 35px;
    color: #78ca63;
    }
  .form-group{
    color:white;
    margin-bottom: 22px
    }
    .form-control{
      width:50%;
     border-radius: 16px;
         background-color: rgba(0,0,0,.075);
         color:#ff9000;
    }
    .vi{
      color:#000000;
      border-radius:10px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Enter The New Account  details</h1>
  <form action="addaccount.jsp"  method="post">
    <div class="form-group">
      <label for="inputdefault">Account_Holder_name</label>
      <input class="form-control" id="inputdefault" type="text" name="NAME">
    </div>
    <div class="form-group">
        <label for="inputdefault">Account_Type</label>
        <input class="form-control" id="inputdefault" type="text" name="TYPE">
      </div>
      <div class="form-group">
        <label for="inputdefault">BRANCH__NAME</label>
        <input class="form-control" id="inputdefault" type="text" name="BRANCH__NAME">
      </div>
      <div class="form-group">
        <label for="inputdefault">BRANCH_CODE</label>
        <input class="form-control" id="inputdefault" type="text" name="BRANCH__CODE">
      </div>
      <div class="form-group">
        <label for="inputdefault">Date of birth</label>
        <input class="form-control" id="inputdefault" type="text" name="DOB">
      </div>
      <div class="form-group">
        <label for="inputdefault">CONTACT_NUMBER</label>
        <input class="form-control" id="inputdefault" type="text" name="PHONE">
      </div>
    <div class="form-group">
        <label for="inputdefault">Address</label>
        <input class="form-control" id="inputdefault" type="text" name="ADD">
      </div>

    <input  class="vi" type="submit" name="Submit" value="Submit">
    <a href="home.html">Home</a>
  </form>
</div>
<%
String Account_Holder_Name=request.getParameter("NAME");
String PHONE=request.getParameter("PHONE");
String TYPE=request.getParameter("TYPE");
String B_NAME=request.getParameter("BRANCH__NAME");
String Address=request.getParameter("ADD");
String CODE=request.getParameter("BRANCH__CODE");
String DOB=request.getParameter("DOB");
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stack", "root", "");
Statement st=conn.createStatement();
int i=st.executeUpdate("insert into account(Account_Holder_Name,Branch_name,Account_Type,Branch_Code,PHONE,address,DOB)values('"+Account_Holder_Name+"','"+B_NAME+"','"+TYPE+"','"+CODE+"','"+PHONE+"','"+Address+"','"+DOB+"')");
String sql="select * from account order by Account_Number desc  Limit 1" ;
resultSet=st.executeQuery(sql);
resultSet.next();
String s=resultSet.getString("Account_Number");
int j=st.executeUpdate("insert into balance(Account_Number,Amount)values('"+s+"','"+0+"')");
int k=st.executeUpdate("DELETE FROM account WHERE order by Account_Number desc  Limit 1");
//out.print("s");
 //response.sendRedirect("home.html");
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>
