<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | ADMIN HOME</title>
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

            <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar" role="navigation">
                <div class="list-group">
                    <a href="${pageContext.request.contextPath}/addFlight" class="list-group-item active">Add Flight</a>
                    <a href="#" class="list-group-item" id="btnListFlights">List Flights</a>
                    <a href="${pageContext.request.contextPath}/listCustomersAction" class="list-group-item">List Customers</a>
                    


                </div>
            </div>

            <div id="appFooter" class="well well-sm">
                <h5 class="text-center text-success">&COPY;All Rights Reserved. Sai Teja Infotech, Vijayawada</h5>
            </div>
            

        </div>







<input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
