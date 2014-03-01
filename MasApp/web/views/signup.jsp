<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>
<html lang="en">
    <head>
        <title>MAS | SIGN UP</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>

        <style type="text/css">
            #signupPanel {
                width: 500px;
                height: 400px;

            }
        </style>

        <script type="text/javascript" src="resources/js/jquery.js"></script> 
<script type="text/javascript" src="resources/js/massapp.js"></script>

    </head>
    <body>
        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>
        <div class="container">
            <div class="page-header">
                <ul class="nav nav-pills pull-right">

                    <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>

                </ul>
                <h3>Miles Acquisition System.</h3>
            </div>

            <div id="signupPanel">

                <div class="panel panel-primary">

                    <div class="panel-heading">Sign Up</div>
                    <div class="panel-body">

                        
                      <div class="alert alert-danger" id="error"></div>
                      

                        <form role="form" id="signUpForm">
                            <div class="input-group input-group-sm">

                                <label for="email">E-Mail</label>
                                <input type="email" class="form-control" name="email" placeholder="E-Mail" id="email" size="80"/>                                
                            </div>

                            <div class="input-group input-group-sm">
                                <label for="password">Password</label>
                                <input type="password" name="password" id="password" placeholder="Password" class="form-control" size="80"/>                                
                            </div>

                            <div class="input-group input-group-sm">
                                <label for="firstName">First Name</label>
                                <input type="text" id="firstName" name="firstName" placeholder="First Name" class="form-control" size="80"/>
                            </div>

                            <div class="input-group input-group-sm">
                                <label for="lastName">Last Name</label>
                                <input type="text" name="lastName" id="lastName" placeholder="Last Name" class="form-control" size="80"/>

                            </div>

                            <br/>
                            <div class="form-group form-inline">
                                <label for="gender">Gender&nbsp;</label>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios1" value="Male" checked>
                                        Male
                                    </label>
                                </div>
                                <div class="radio">
                                    <label>
                                        <input type="radio" name="gender" id="optionsRadios2" value="Female">
                                        Female
                                    </label>
                                </div>

                            </div>
                            <div class="input-group input-group-sm">
                                <label for="question">Security Question</label>
                                <select class="form-control" id="question" name="question">
                                    <option>Select Security Question</option>
                                    <option>What was your childhood nickname? </option>
                                    <option>In what city did you meet your spouse/significant other?</option>
                                    <option>What is the name of your favorite childhood friend? </option>
                                    <option>What street did you live on in third grade?</option>
                                    <option>What is your oldest sibling's birthday month and year? </option>
                                    <option>What is the middle name of your oldest child?</option>
                                    <option>What is your oldest sibling's middle name?</option>
                                    <option>What school did you attend for sixth grade?</option>
                                </select>

                            </div> 
                            <div class="input-group input-group-sm">
                                <label for="answer">Answer</label>
                                <input type="text" name="answer" id="answer" placeholder="Answer" class="form-control" size="80"/>

                            </div>
                            <div class="input-group input-group-sm">
                                <label for="mobile">Mobile</label>
                                <input type="text" name="mobile" id="mobile" placeholder="Mobile" class="form-control"/>

                            </div>
                            <br/>
                            <div class="form-group">

                                <button type="button"  data-loading-text="Please wait..." class="btn btn-success" id="btnNewUser">Submit</button>
                                <button type="button" class="btn btn-success" id="userClear">Clear</button>
                            </div>

                        </form>

                    </div>

                </div>

            </div>




        </div>

        
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        
    </body>
</html>
