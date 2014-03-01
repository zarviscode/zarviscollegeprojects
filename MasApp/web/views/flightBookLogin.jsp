<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>
<html lang="en">
    <head>
        <title>MAS</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>


        <style type="text/css">
            #wellId {
                width: 400px;
                height: 300px;
            }

            #btnPanel {
                position: relative;
                top:20px;

            }
        </style>
        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script type="text/javascript" src="resources/js/massapp.js"></script>


    </head>
    <body>

        <div class="container">
            <div class="page-header">
                <ul class="nav nav-pills pull-right">

                    <li class="active"><a href="${pageContext.request.contextPath}/showSignup">Sign Up</a></li>
                    <li class="active"><a href="${pageContext.request.contextPath}/home">Cancel</a></li>
                </ul>
                <h2>Miles Acquisition System.</h2>
            </div>

            <div class="well" id="wellId">

                <div class="panel-primary">
                    <div class="panel-heading">Login to Book Ticket</div>
                    <div class="panel-body">

                        <p id="errMsg" class="text-center text-danger"></p>

                        <form role="form" id="flightBookLoginForm">
                            <div class="form-group">
                                <label for="from">User Name</label>

                                <input type="text" class="form-control" name="userName" id="userName"/>

                            </div>
                            <div class="form-group">
                                <label for="from">Password</label>

                                <input type="password" class="form-control" name="password" id="password"/>

                            </div>



                        </form>


                        <div class="form-group">
                            <button class="btn btn-success" data-loading-text="Please Wait..." id="btnFlightBookLogin">Login</button>                           

                        </div>



                    </div>



                </div>

            </div>
        </div>

    </div> 





    <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>



    <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
</body>
</html>
