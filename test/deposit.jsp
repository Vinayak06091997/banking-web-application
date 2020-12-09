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
  .form-control {
    width: 50%;
    border-radius: 16px;
    background-color: rgba(0,0,0,.075);
    color: #ff9000;
}
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
    }
    .vi{
      color:#000000;
      border-radius:10px;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Deposit amount </h1>
  <form action="deposit.jsp"  method="post">
    <div class="form-group">
      <label for="inputdefault">Account_Number</label>
      <input class="form-control" id="inputdefault" type="text" name="Acoount_Number">
    </div>
    <div class="form-group">
        <label for="inputdefault">Deposit Amount</label>
        <input class="form-control" id="inputdefault" type="text" name="Deposit">
      </div>
    <div class="form-group">
        <label for="inputdefault">Discripation</label>
        <input class="form-control" id="inputdefault" type="text" name="des">
      </div>
      
    <input  class="vi" type="submit" name="Submit" value="Submit">
  </form>
</div>
<%
String Acoount_Number=request.getParameter("Acoount_Number");
String Deposit=request.getParameter("Deposit");
String des=request.getParameter("des");
String D1=Deposit;
try
{
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/stack", "root", "");
Statement st=conn.createStatement();
String sql="select * from balance where Account_number="+Acoount_Number ;
resultSet=st.executeQuery(sql);
resultSet.next();
int b=resultSet.getInt("Amount");
int c=Integer.parseInt(D1);
int d=(b+c);
String sq="UPDATE balance SET Amount="+d+" where Account_Number="+Acoount_Number;
int j=st.executeUpdate(sq);
int i=st.executeUpdate("insert into tra(Account_Number,deposit,Balance,description)values('"+Acoount_Number+"','"+Deposit+"','"+d+"','"+des+"')");
if(i==1){
    response.sendRedirect("home.html");
    }
    else
    {
      %>
    <script language="javascript">
    alert("Inavalid Account number ");	//Java Script alert message
    window.location.replace("home.jsp")
    </script>
    <%
    }
}
catch(Exception e)
{
System.out.print(e);
e.printStackTrace();
}
%>
</body>
</html>
