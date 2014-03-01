<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | LIST FLIGHTS</title>
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

            #flightPanel {

                width: 500px;
                height: auto;

            }

            #dbMsg {
                display: none;
            }
        </style>
        
        <script type="text/javascript" src="resources/js/jquery.js"></script>
        <script type="text/javascript" src="resources/js/massapp.js"></script>


        <script type="text/javascript">

        </script>

    </head>
    <body>


        <div class="container">
            <div class="page-header">
                <div class="pull-right">

                    <button class="btn btn-success" id="btnHome">Home</button>
                    
                    <button class="btn btn-danger" id="btnLogout">LogOut</button>
                </div>
                <h4>Miles Acquisition System.</h4>
                <h6 class="text-success">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h6>
            </div>

            <br/>
            <h3>Flights Report</h3>
            <h4 class="text-muted">Click on the Flight Number to Edit Details</h4>
            <br/>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <tr class="info">
                        <th>Flight Id</th>
                        <th>Provider</th>
                        <th>Source</th>
                        <th>Destination</th>
                        <th>Departure</th>
                        <th>Arrival</th>
                        <th>Seats(EXE)</th>
                        <th>Seats(BUC)</th>
                        <th>Total Seats</th>
                        <th>Price (EXE)</th>
                        <th>Price (BUC)</th>
                        <th>Distance (Km.)</th>
                        <th>Service Availability</th>                        
                    </tr>
                    
                    <s:iterator value="flightList" var="flight">
                        
                        <tr>
                            <td><a href='${pageContext.request.contextPath}/editDeleteAction?fid=<s:property value="%{#flight.flightno}"/>'><s:property value="%{#flight.flightno}"/></a></td>
                            <td><s:property value="%{#flight.provider}"/></td>
                            <td><s:property value="%{#flight.source}"/></td>
                            <td><s:property value="%{#flight.destination}"/></td>
                            <td><s:property value="%{#flight.depttime}"/></td>
                            <td><s:property value="%{#flight.arrtime}"/></td>
                            <td><s:property value="%{#flight.seatexe}"/></td>
                            <td><s:property value="%{#flight.seatbusiness}"/></td>
                            <td><s:property value="%{#flight.totalseats}"/></td>
                            <td><s:property value="%{#flight.costexe}"/></td>
                            <td><s:property value="%{#flight.costbusiness}"/></td>
                            <td><s:property value="%{#flight.distance}"/></td>
                            <td><s:property value="%{#flight.availabletill}"/></td>
                            
                        </tr>
                    </s:iterator>
                </table>
            </div>


        </div>



<input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>

        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
