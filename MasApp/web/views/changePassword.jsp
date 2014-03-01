<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | CHANGE PASSWORD</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css"/>

        <style type="text/css">
        #changePasswordPanel {
                width: 500px;
                height: 400px;

            }
        </style>

        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script type="text/javascript" src="resources/js/massapp.js"></script>


    </head>
    <body>


        <div class="container">
            <div class="page-header">
                <div class="pull-right">

                    <button class="btn btn-success" id="btnHome">Home</button>
                    <button class="btn btn-danger" id="btnLogout">LogOut</button>
                </div>
                <h2>Miles Acquisition System.</h2>
                <h4 class="text-success lead">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h4>
            </div>

            <div id="changePasswordPanel">
                <div class="panel panel-primary">

                    <div class="panel-heading">Change Password</div>
                   

                    <div class="panel-body">
                        
                        <p class="bg-danger" id="forgotError"></p>
                        <form role="form" id="changePasswordForm">

                            <div class="form-group" id="userNameDiv">
                                <label for="userName" id="lblUserName">E-Mail</label>
                                <input type="text"  name ="email" class="form-control" placeholder="E-Mail" id="email" readonly="readonly" value='<s:property value="%{#session.user.email}"/>'/>                                    
                            </div>
                            <div class="form-group" id="securityQuestionDiv">
                                <label for="question" id="lblsecurityQuestin">Current Password</label>
                                <input type="text"  name ="currentPassword" class="form-control" placeholder="Current Password" id="currentPassword" />                                    
                            </div>
                            <div class="form-group" id="answerDiv">
                                <label for="answer" id="lblAnswer">New Password</label>
                                <input type="text"  name ="newPassword" class="form-control" placeholder="New Password" id="newPassword"/>                                    
                            </div>
                            <br/>
                            <div class="form-group">

                                <button type="button" class="btn btn-success" id="changeBtn" data-loading-text="Please wait...">Change Password</button>
                                <button type="button" class="btn btn-success" id="changeClear">Clear</button>
                            </div>

                        </form>   


                    </div>
                </div>


                <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
                <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>




            </div>







            <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




            <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
            <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
