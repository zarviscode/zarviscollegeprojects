<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>
<html lang="en">
    <head>
        <title>MAS | FORGOT PASSWORD</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>

        <style type="text/css">
            #forgotPasswordPanel {
                width: 500px;
                height: 400px;

            }

            #messageModal {
                display: none;
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
                <h2>Miles Acquisition System.</h2>
            </div>



            <div id="forgotPasswordPanel">
                <div class="panel panel-primary">

                    <div class="panel-heading">Forgot Password ?</div>
                    <div id="messageModal" class="alert alert-info">

                    </div>

                    <div class="panel-body">
                        <form role="form" id="forgotPasswordForm">



                            <div class="form-group" id="userNameDiv">
                                <label for="userName" id="lblUserName">E-Mail</label>
                                <input type="text"  name ="email" class="form-control" placeholder="User Name" id="email"/>                                    
                            </div>
                            <div class="form-group" id="securityQuestionDiv">
                                <label for="question" id="lblsecurityQuestin">Security Question</label>
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
                            <div class="form-group" id="answerDiv">
                                <label for="answer" id="lblAnswer">Answer</label>
                                <input type="text"  name ="answer" class="form-control" placeholder="Answer" id="answer"/>                                    
                            </div>
                            <br/>
                            <div class="form-group">

                                <button type="button" class="btn btn-success" id="forgotBtn" data-loading-text="Please wait...">Submit</button>
                                <button type="button" class="btn btn-success" id="forgotClear">Clear</button>
                            </div>

                        </form>   


                    </div>
                </div>


                <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
                <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
                </body>
                </html>
