<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Dynamic Route Planning</title>
        <meta name="description" content="">
        <meta name="author" content="templatemo">
        <link href="css/style.css" rel="stylesheet">
    </head>
    <body>
        <div id="container" class="container">
            <div style="width: 1200px;margin: 30px;color: white">
                <center><h1>Enhanced Automated Planning and Routing System for Product Delivery</h1></center>
            </div>
            <div>
                <ul class="nav nav-justified">
                    <li class="active"><a href="index.jsp">Home</a></li>
                    <li><a href="alogin.jsp">Admin</a></li>
                    <li><a href="ulogin.jsp">User</a></li>
                    <li><a href="delivery.jsp">Delivery Person</a></li>
                </ul>
            </div><br />
            <div style="border:1px solid white;width: 700px;height: 400px;margin-left: 300px;border-radius: 9px;background-image: url()"><br />
                <center><h1 style="color: white;">Welcome to User Login</h1></center>
                <form action="useraction.jsp" method="post" style="width: 600px;height: 300px;margin-left: 80px;"><br />
                    <center> 
                    <label style="font-size: 25px;margin-left: -150px;color: white;margin-top: 50px">User Name </label>
                    <input type="text" placeholder="Enter Email Id" required="" class="textbox" name="uname"style="margin-left: 30px"/><br /><br />
                    <label style="font-size: 25px;margin-left: -150px;color: white">Password  </label>
                    <input type="password" placeholder="Enter Password" required="" class="textbox" name="pass" style="margin-left: 40px"/><br /><br /><br />
                    <input type="submit" value="SignIn" class="button"/>&nbsp;&nbsp;&nbsp;
                    <input type="reset" value="Reset" class="button" style="margin-right: 170px;"/>
                    </center>
                    <h4 style="color: red;margin-left: 150px;margin-top: 20px">New User</h4><a href="reg.jsp" style="float: right;margin-top: -38px;margin-right: 310px;text-decoration: none;color: white">Click Here</a>
                </form>
            </div>
        </div> <!-- /container -->
        <div>
              </div>
    </body>
</html>