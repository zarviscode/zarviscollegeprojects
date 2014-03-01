<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | Booking</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>


        <style type="text/css">
            #appFooter {

                position: relative;
                top:400px;
            }

            #tblInfo {

                width:700px;

            }

            #bookFormDiv {

                position: relative; 
                top:-308px;
                height: auto;
                width: 428px;
                left:711px;
            }
            
            #milesDiv {
                height: 100px;


            }
            
            #pointsDiv {
                height: 100px;
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

            <div class="col-xs-2 pull-right" id="pointsDiv" >
                <h3 class="text-muted">Available Credits</h3>
                <h4 class="text-primary">Rs.<s:property value="%{#session.totalCredits}"/> /-</h4>
                
            </div>
            
            <div class="col-xs-2 pull-right" id="milesDiv">
                <h3 class="text-muted text-center">Traveled Distance</h3>
                <h4 class="text-primary text-center"><s:property value="%{#session.milesTravelled}"/> K.m</h4>
            </div>
            
            <br/><br/><br/><br/><br/><br/><br/>
            

            <div class="well" id="tblInfo">

                <input type="hidden" id="provider" value="%{#session.flight.provider}"/>
                <input type="hidden" id="source" value="%{#session.flight.source}"/>
                <input type="hidden" id="destination" value="%{#session.flight.destination}"/>
                <input type="hidden" id="depttime" value="%{#session.flight.depttime}"/>
                <input type="hidden" id="arrtime" value="%{#session.flight.arrtime}"/>
                <input type="hidden" id="distance" value="%{#session.flight.distance}"/>
                <input type="hidden" id="seatexe" value="%{#session.flight.seatexe}"/>
                <input type="hidden" id="seatbusiness" value="%{#session.flight.seatbusiness}"/>
                <input type="hidden" id="totalseats" value="%{#session.flight.totalseats}"/>
                <input type="hidden" id="costexe" value="%{#session.flight.costexe}"/>
                <input type="hidden" id="costbusiness" value="%{#session.flight.costbusiness}"/>
                
               



                <table class="table table-bordered">

                    <tr>
                        <th>Provider</th>
                        <td><s:property value="%{#session.flight.provider}"/></td>
                        <th>Source</th>
                        <td><s:property value="%{#session.flight.source}"/></td>
                        <th>Destination</th>
                        <td><s:property value="%{#session.flight.destination}"/></td>

                    </tr>

                    <tr>
                        <th>Departure</th>
                        <td><s:property value="%{#session.flight.depttime}"/></td>
                        <th>Arrival</th>
                        <td><s:property value="%{#session.flight.arrtime}"/></td>
                        <th>Total Distance</th>
                        <td><s:property value="%{#session.flight.distance}"/></td>

                    </tr>


                    <tr>
                        <th>Seats in Executive Class</th>
                        <td><s:property value="%{#session.flight.seatexe}"/></td>
                        <th>Seats in Business Class</th>
                        <td><s:property value="%{#session.flight.seatbusiness}"/></td>
                        <th>Number of Seats</th>
                        <td><s:property value="%{#session.flight.totalseats}"/></td>


                    </tr>

                    <tr>

                        <th>Price for Executive Class</th>
                        <td>Rs.<s:property value="%{#session.flight.costexe}"/></td>
                        <th>Price of Business Class</th>
                        <td>Rs.<s:property value="%{#session.flight.costbusiness}"/></td>
                        <th>Flight Number</th>
                        <td class="success"><s:property value="%{#session.flight.flightno}"/></td>
                    </tr>


                </table>

            </div>


            <div id="bookFormDiv" class="well">

                <div class="panel panel-primary">
                    <div class="panel panel-heading">Book Ticket</div>

                    <div class="panel panel-body">

                        <form id="bookingForm">
                             <input type="hidden" name="flightno" id="flightno" value='<s:property value="%{#session.flight.flightno}"/>'/>
                             <input type="hidden" id="sourcedate" name ="sourcedate" value='<s:property value="%{#session.flight.sourcedate}"/>'/>
                        <div class="form-group col-xs-6" id="lbldestinationdiv">
                            <label for="lblnumberoftickets" id="lblnumberoftickets">Number of Tickets</label>
                            <select class="form-control" id="numberoftickets" name="numberoftickets">
                                <option>1</option>
                                <option>2</option>
                                <option>3</option>
                                <option>4</option>

                            </select>                             

                        </div>
                        <div class="form-group col-xs-6" id="lbldistancediv">
                            <label for="lblforclass" id="lblforclass">Select Class</label>
                            <select class="form-control" id="className" name="className">
                                <option>Executive</option>
                                <option>Business</option>                              

                            </select> 
                        </div> 
                        <s:if test="%{#session.totalCredits != 0}">
                        <div class="form-group col-xs-8" id="lbldistancediv">
                            <label for="lblCredits" id="lblforclass">Credits Usage</label>
                            <select class="form-control" id="credits" name="credits">
                                <option>0</option>
                                <option>25</option>                              
                                <option>50</option>                              
                                <option>75</option>                              
                                <option>100</option>                              

                            </select> 
                        </div>  
                        </s:if>

                         <div class="form-group col-xs-8" id="btnPanel">
                            <input type="button" class="btn btn-success" id="btnBook" data-loading-text="Please wait..." value="Book Ticket"/>
                            
                        </div>
                        <s:if test="%{#session.totalCredits != 0}">
                        <div class="form-group col-xs-8">
                            <span class="label label-danger">Note : </span>&nbsp;<span class="label label-success">The Usage of Credits will be in Percentage</span>
                            
                        </div>
                        </s:if>
                         </form>
                        
                        







                    </div>


                </div>





            </div>





        </div>







        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
