<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | USER BOOKING CONFIRMATION</title>
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

            <h3>Booking Confirmation</h3>

            <div class="row">

                <br/>
                <div class="col-md-6 well">



                    <table class="table table-striped">
                        <tr>
                            <th>PNR Number</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.pnr}"/></td>
                        </tr>
                        <tr>
                            <th>Flight Number</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.flightno}"/></td>
                        </tr>

                        <tr>
                            <th>Provider</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.provider}"/></td>
                        </tr>

                        <tr>
                            <th>Source</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.source}"/></td>
                        </tr>

                        <tr>
                            <th>Destination</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.destination}"/></td>
                        </tr>

                        <tr>
                            <th>Distance</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.distance}"/> K.m</td>
                        </tr>

                        <tr>
                            <th>Journey Date</th>                                
                            <td class="text-primary"><s:property value="%{#session.userBooking.travelldate}"/></td>
                        </tr>


                        <s:if test="%{#session.userBooking.seatexe != 0}">


                            <tr>
                                <th>Executive Class (No.of.Seats) </th>                                
                                <td class="text-primary"><s:property value="%{#session.userBooking.seatexe}"/></td>
                            </tr>
                        </s:if>


                        <s:if test="%{#session.userBooking.seatbusiness != 0}">
                            <tr>
                                <th>Business Class (No.of.Seats)</th>                                
                                <td class="text-primary"><s:property value="%{#session.userBooking.seatbusiness}"/></td>
                            </tr>
                        </s:if>

                        <tr>
                            <th>Actual Price</th>                                
                            <td class="text-primary">Rs. <s:property value="%{#session.actualPrice}"/> /-</td>
                        </tr>    
                            
                            
                         <tr>
                            <th>Discount</th>                                
                            <td class="text-primary">Rs. <s:property value="%{#session.pointsConsumption}"/> /-</td>
                        </tr>    
                            

                        <tr>
                            <th>Price after Discount</th>                                
                            <td class="text-primary">Rs. <s:property value="%{#session.userBooking.price}"/> /-</td>
                        </tr>
                        
                          <tr>
                            <th>Available Credits</th>                                
                            <td class="text-primary">Rs. <s:property value="%{#session.credits}"/> /-</td>
                        </tr>

                       

                    </table>

                        <button class="btn btn-success" onclick="window.print();">Print Ticket</button>

                </div>


            </div>



        </div>







        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
