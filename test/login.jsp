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
	<title>
			Loginpage
	</title>
	<head>
		<%-- <link rel="stylesheet" href="css/login.css" type="text/css"> --%>
		<!-- <div style="background-image: url('1.jpg');"></div> -->
		<style>
		body {
    margin: 0;
    padding-left: 460px;
    padding-top: 80px;
    font-family: sans-serif;
    background: linear-gradient(to right, #b92b27, #1565c0);
    /* background-image: url("1.jpg"); */
    background-repeat: no-repeat;
    background-attachment: fixed;
      
}

.box {
    width: 400px;
    padding: 30px;
    /* position: absolute; */
    /* padding-left: 20%; */
    top: 50%;
    left: 50%;
    background: #4a3434;;
    text-align: center;
    transition: 0.25s;
    margin-top: 100px;
    border-radius: 4%;
    box-shadow:20px;
}

.box input[type="text"],
.box input[type="password"] {
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #3498db;
    padding: 10px 10px;
    width: 250px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s
}

.box h1 {
    color: white;
    text-transform: uppercase;
    font-weight: 500
}

.box input[type="text"]:focus,
.box input[type="password"]:focus {
    width: 300px;
    border-color: #2ecc71
}

.box input[type="submit"] {
    border: 0;
    background: none;
    display: block;
    margin: 20px auto;
    text-align: center;
    border: 2px solid #2ecc71;
    padding: 14px 40px;
    outline: none;
    color: white;
    border-radius: 24px;
    transition: 0.25s;
    cursor: pointer
}

.box input[type="submit"]:hover {
    background: #2ecc71
}

.forgot {
    text-decoration: underline
}


.text-muted
{
    color:wheat;

}
h2{
    font-size:50px;
    font-style:italic;
    color: aquamarine;
}
</style>
		
	</head>
	<body>
		<h2>Wellcome to XYZ Bank </h2>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<div class="card">
						<form class="box" action="login.jsp" method="post">
							<h1>Admin Login</h1>
						 <p class="text-muted"> Please enter your user_id and password!</p>
							 <input type="text" name="user_id" placeholder="Username">
							  <input type="password" name="password" placeholder="Password"> 
							  <a class="forgot text-muted" href="#">Forgot password?</a> 
							  <input type="submit" name="" value="Login" href=" home.html">
							<div class="col-md-12">
								<!-- <ul class="social-network social-circle">
									<li><a href="#" class="icoFacebook" title="Facebook"><i class="fab fa-facebook-f"></i></a></li>
									<li><a href="#" class="icoTwitter" title="Twitter"><i class="fab fa-twitter"></i></a></li>
									<li><a href="#" class="icoGoogle" title="Google +"><i class="fab fa-google-plus"></i></a></li>
								</ul> -->
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
<%
try{
connection = DriverManager.getConnection(connectionUrl+database, userid, password);
statement=connection.createStatement();
String sql ="select * from login";
resultSet  = statement.executeQuery(sql);
String userid1=(String)request.getParameter("user_id");
String password1=(String)request.getParameter("password");
//out.println(userid1);
//out.println(password1);
//out.println("nhhjkhj");
resultSet.next();
String name= (String)resultSet.getString("user");
String pass= (String)resultSet.getString("password");
//out.println(name);
//out.println(pass);
//out.println(userid1);
if(name.equals(userid1) && pass.equals(password1)) 
{
	//out.println("yes");
		response.sendRedirect("home.html");
}
else
{ 
    %>
<script language="javascript">
alert("Invalid userid/password");
</script>
   <% 
}
} catch (Exception e) {
e.printStackTrace();
}
connection.close();
%>
</body>
</html>