<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | MODIFY FLIGHT</title>
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
        <script type="text/javascript" src="http://maps.google.com/maps/api/js?sensor=false"></script>
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
                    <button class="btn btn-success" id="btnListFlights">List Flights</button>
                    <button class="btn btn-danger" id="btnLogout">LogOut</button>
                </div>
                <h4>Miles Acquisition System.</h4>
                <h3 class="text-success">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h3>
            </div>

            <h4 class="text-success">Modify or Remove Flight</h4>
            <br/>

            <div class="row">

                <div class="col-md-6 well">


                    <table class="table table-striped">

                        <tr>
                            <th>Flight Number</th>                                
                            <td class="text-primary"><s:property value="fid"/></td>
                        </tr>

                        <tr>
                            <th>Provider</th>                                
                            <td class="text-primary"><s:property value="provider"/></td>
                        </tr>

                        <tr>
                            <th>Source</th>                                
                            <td class="text-primary"><s:property value="source"/></td>
                        </tr>

                        <tr>
                            <th>Destination</th>                                
                            <td class="text-primary"><s:property value="destination"/></td>
                        </tr>

                        <tr>
                            <th>Distance</th>                                
                            <td class="text-primary"><s:property value="distance"/> K.m</td>
                        </tr>

                        <tr>
                            <th>Service Available Upto</th>                                
                            <td class="text-primary"><s:property value="availabletill"/></td>
                        </tr>

                        <tr>
                            <th>Executive Class (No.of.Seats) </th>                                
                            <td class="text-primary"><s:property value="seatexe"/></td>
                        </tr>
                        <tr>
                            <th>Business Class (No.of.Seats)</th>                                
                            <td class="text-primary"><s:property value="seatbusiness"/></td>
                        </tr>


                    </table>

                    <div class="modal-footer">

                        <a href='${pageContext.request.contextPath}/updateFlightAction?flightid=<s:property value="fid"/>' class="btn btn-warning">Edit</a>
                        <a href='${pageContext.request.contextPath}/deleteFlightAction?flightid=<s:property value="fid"/>' class="btn btn-danger">Delete</a>
                    </div>  

                </div>


            </div>





        </div>








        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>



        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
