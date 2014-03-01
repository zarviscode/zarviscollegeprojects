<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | USER HOME</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css"/>

        <style type="text/css">
            #appFooter {

                position: relative;
                top:400px;
            }
            
            #distanceMeter {
                height: 150px;
            }
            
            #creditsScore {
                
                height: 150px;
            }
        </style>

        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script type="text/javascript" src="resources/js/massapp.js"></script>


    </head>
    <body>


        <div class="container">
            <div class="page-header">
                <div class="pull-right">


                    <button class="btn btn-danger" id="btnLogout">LogOut</button>
                </div>
                <h2>Miles Acquisition System.</h2>
                <h4 class="text-success lead">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h4>
            </div>


            <div class="row">
                <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
                    <div class="list-group">
                        <a href="${pageContext.request.contextPath}/userBookTicketAction" class="list-group-item active">Book Ticket</a>
                        <a href="${pageContext.request.contextPath}/userBookingHistoryAction" class="list-group-item">Booking History</a>
                        <a href="${pageContext.request.contextPath}/showCancelAction" class="list-group-item" id="">Cancel Ticket</a>
                        <a href="${pageContext.request.contextPath}/showChangePassword" class="list-group-item">Change Password</a>

                    </div>
                </div>


                <div class="col-sm-3 pull-right" id="distanceMeter">
                    <h3 class="text-center">Total Distance</h3>
                    <h3 class="text-center text-primary"><s:property value="%{#session.totalDistance}"/> K.m</h3>
                </div>
                
                <div class="col-sm-3 pull-right" id="creditsScore">
                    <h3 class="text-center">Credits With You</h3>
                    <h3 class="text-center text-primary">Rs.<s:property value="%{#session.credits}"/>0 /-</h3>
                </div>



            </div>



        </div>







        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
