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
                </ul>
            </div><br />
            <div style="border:1px solid blue;height: 450px; width: 512px;border-radius: 30px;margin-left: 430px;background-image: url('images/reg.jpg')"><br />
                <form action="regaction.jsp" method="get">
                   <div style="float: left;margin-left: 20px;width: 350px;height: 385px;margin-top: -13px;border-radius: 20px;color: white"><br />
                       <center><label style="font-size: 20px">Name</label>&nbsp;&nbsp;<input type="text" class="textbox1" style="margin-left: 47px" name="name" required=""/><br /><br />
                       <label style="font-size: 20px">Email ID</label>&nbsp;&nbsp;<input type="email" class="textbox1" style="margin-left: 23px" name="email" required=""/><br /><br />
                       <label style="font-size: 20px">Password</label>&nbsp;&nbsp;<input type="password" class="textbox1" style="margin-left: 12px" name="pass" required=""/><br /><br />
                       <label style="font-size: 20px">D.O.B</label>&nbsp;&nbsp;<input type="date" style="margin-left: 46px;width: 200px;height: 25px;font-size: 20px" name="dob" required=""/><br /><br />
                       <label style="font-size: 20px;">Location</label>&nbsp;&nbsp;<input type="text" class="textbox1" style="margin-left: 25px" name="loc" required=""/><br /><br />
                       <label style="font-size: 20px">Contact No</label>&nbsp;&nbsp;<input type="text" class="textbox1" name="cno" required=""/><br /><br />
                        <label style="font-size: 20px">Bank Name</label>&nbsp;
                        <select style="width: 200px;height: 25px;font-size: 20px" required="" name="bank">
                            <option selected="">Select</option>   
                            <option value="ICIC">ICIC</option>   
                            <option value="KOTAK">KOTAK</option>   
                            <option value="CITIBANK">CITIBANK</option>   
                            <option value="SBI">SBI</option>   
                            <option value="HDFC">HDFC</option>   
                            <option value="AXIS">AXIS</option>   
                        </select><br /><br />
                        <label style="font-size: 20px">Credit card</label>&nbsp;&nbsp;
                        <input type="text" class="textbox1" style="margin-left: 4px;" name="card" required=""/>
                        <br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="submit" value="SignUp" />
                        <input type="Reset" value="Clear" />
                        <a href="index.jsp"><input type="button" value="Exit" /></a>
                    </div>
                </form>
            </div>
        </div> <!-- /container -->
   
    </body>
</html>