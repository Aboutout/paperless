<html lang="en">
<head>
  <title>Paperless | General</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="css/bootstrap.css" rel="stylesheet">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="js/bootstrap.min.js"></script>

  <link href="extcss/index.css" rel="stylesheet">
<script src="extjs/index.js"></script>
<link href="extcss/login.css" rel="stylesheet">
<link rel="shortcut icon" href="images/clg.jpg">

</head>
<body>
<!--header starts***********************************************************************8-->	
<header>
	<div class="container">	
 <div class="row">
    <div class="col-sm-5 col-md-3 col-lg-2">
      </div>
    <div class="col-sm-2 col-md-6 col-lg-8">
     <img src="images/clglogo.jpg"></img>
    </div>
    <div class="col-sm-5 col-md-3 col-lg-2">
      
    </div>
  </div>
</div>
</header>
<!--hader ends*******************************************************************************-->
<!--hnavbar starts*******************************************************************************-->

<nav class="navbar navbar-inverse" >
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#"></a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-log-in"></span>&nbspLogin<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="flogin.jsp">Faculty</a></li>
            <li><a href="slogin.jsp">Student</a></li>
            
          </ul>
        </li>
        
      </ul>
    </div>
  </div>
</nav>
  <!--navbar ends*******************************************************************************-->
  <!--form starts****************************************************************************888-->
    <div class="container">    
        <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
        <div class="signupshadow">                    
            <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title" style="font-size:30px;font-family: tahoma;">Student Sign Up</div>
                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="forgotpassword.jsp">Forgot password?</a></div>
                    </div>     

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                            
                        <form id="loginform" class="form-horizontal" role="form" action="/Paperless/signup" method="post">
                                    
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                        <input   class="form-control" name="name1" value="" placeholder="name" type="text" required autofocus>                                        
                                    </div>
                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-envelope"></i></span>
                                <input id="login-username"  class="form-control" name="username" value="" placeholder="email eg.abc@sggs.ac.in" type="email" required autofocus>                                        
                            </div>
                                
                            <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required autofocus >
                                    </div>

                                    <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                        <input id="login-password" type="password" class="form-control" name="repassword" placeholder="confirm password" required autofocus >
                                    </div>
                                    <div style="margin-bottom: 25px" class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-phone"></i></span>
                                        <input id="login-username"  class="form-control" name="phone" value="" placeholder="Mobile Number " type="phone" required autofocus>                                        
                                    </div>

                                    <div class="form-group">
                                      <table width="100%" >
                                      <tr >
                                      <td width="40%">
                                     
                                    <div style="margin-bottom: 25px;width:247px;margin-left: 15px;" class="input-group">
                                     <span class="input-group-addon"><i class="glyphicon glyphicon-bitcoin"></i></span>
                                    <select class="form-control" name="branch" placeholder="Select Branch">
                                        <option >Select Branch</option>
                                        <option >CSE</option>
                                        <option >IT</option>
                          
                                      </select>
                                      </div>
                                     </td>
                                     <td width="60%">
                                      <div style="margin-bottom: 25px;width:250px;margin-left: 11px;" class="input-group">
                                     <span class="input-group-addon"><i class="glyphicon glyphicon-yen"></i></span>
                                    <select class="form-control" id="sel1" name="year">
                                        <option >Select Year</option>
                                        <option >FirstYear</option>
                                        <option >SecondYear</option>
                                        <option >ThirdYear</option>
                                        <option >FinalYear</option>
                                      </select>
                                      </div>
                                  </td>
                                      </tr>
                                      </table>
                              </div>
                              <input type="submit"  name="signup" class="btn btn-primary" value="Sign Up"/>
                                <div class="input-group">
                                      <div class="checkbox">
                                        <label>
                                          <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                        </label>
                                      </div>
                                    </div>


                         </form>     



                          </div>                     
                    </div>  
        </div>
        </div>
        </div>
        <br>
 <!--form Ends****************************************************************************888-->      
<!-- footer starts********************************************************************-->
<div class="footer">
   


           <div align="center">
              <div style="margin-top: 10px;font-family: robotoRegular;font-size: 12px;"> &copyAll Rights Reserved<br>
              Designed and Developed by<br>
              <h4>Pratik Lahase and Ankit Chopade</h4>
             
          </div>
    </div>
</div>
<!-- footer ends********************************************************************-->
</body>
</html>
