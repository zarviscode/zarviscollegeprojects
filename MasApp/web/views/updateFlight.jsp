<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | ADD FLIGHT</title>
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
                <h6 class="text-success">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h6>
            </div>

                <p>Update for Flight <span class="label label-success"><s:property value="flightid"/></span>, Starting From <span class="label label-success"><s:property value="source"/></span> to Destination <span class="label label-success"><s:property value="destination"/></span></p>
                <br/>

            <div class="panel panel-primary" id="flightPanel">
                <div class="panel panel-heading">Update Flight Entry</div>

                <div class="panel panel-body">
                    
                    <form role="form" id="updateFlightForm">
                        <input type="hidden" value='<s:property value="flightid"/>' id="flightno" name="flightno"/>
                        <div class="alert alert-info" id="dbMsg"></div>
                        <div class="form-group col-xs-10" id="lblproviderdiv">
                            <label for="lblprovider" id="lblprovider">New Provider</label>
                            <select class="form-control" id="provider" name="provider">
                                <option>Select Provider</option>
                                <option>Indian AirLines</option>
                                <option>Jet AirWays</option>
                                <option>Lufthansa</option>
                                <option>Spice Jet</option>
                                <option>KingFisher AirLines</option>
                                <option>Deccan Aviation</option>
                            </select>                               

                        </div>

                        <div class="form-group col-xs-4" id="lblsourcediv">
                            <label for="lblsource" id="lblsource">Source</label>
                            <select class="form-control" id="source" name="source">
                                <option>Source</option>                                
                                <option>Mumbai</option>
                                <option>Chennai</option>
                                <option>Delhi</option>
                                <option>Vijayawada</option>
                                <option>Kolkata</option>
                                <option>Visakhapatnam</option>
                                <option>Hyderabad</option>
                                <option>Baroda</option>
                                <option>Bhubaneswar</option>
                            </select>                               

                        </div>
                        <div class="form-group col-xs-4" id="lbldestinationdiv">
                            <label for="lbldestination" id="lbldestination">Destination</label>
                            <select class="form-control" id="destination" name="destination">
                                <option>Destination</option>
                                <option>Mumbai</option>
                                <option>Chennai</option>
                                <option>Delhi</option>
                                <option>Vijayawada</option>
                                <option>Kolkata</option>
                                <option>Visakhapatnam</option>
                                <option>Hyderabad</option>
                                <option>Baroda</option>
                                <option>Bhubaneswar</option>
                            </select>                             

                        </div>
                        <div class="form-group col-xs-4" id="lbldistancediv">
                            <label for="lbldistance" id="lbldistance">Distance (Km.)</label>
                            <input type="text" name="distance" class="form-control" placeholder="Distance" id="distance" readonly="true"/>

                        </div>

                        <div class="form-group col-xs-4" id="lbldeptTimediv">
                            <label for="lbldeptTime" id="lbldeptTime">Departure Time</label>
                            <input name ="deptTime" type="text" class="form-control" placeholder="Departure" id="deptTime" value='<s:property value="depttime"/>'/>

                        </div>
                        <div class="form-group col-xs-4" id="lblarrTimediv">
                            <label for="lblarrTime" id="lblarrTime">Arrival Time</label>
                            <input name = "arrTime" type="text" class="form-control" placeholder="Arrival" id="arrTime" value='<s:property value="arrtime"/>'/>                              

                        </div>
                        <div class="form-group col-xs-4" id="lbltilldiv">
                            <label for="lbltill" id="lbltill">Available Till</label>
                            <input type="text" class="form-control" placeholder="Availability" name="till" id="till" value='<s:property value="availabletill"/>'/>

                        </div>

                        <div class="form-group col-xs-4" id="lblexeSeatsdiv">
                            <label for="lblexeSeats" id="lblexeSeats">No.Of.Seats(EXE)</label>
                            <input type="text" class="form-control" placeholder="Seats(EXE)" name = "exeSeats" id="exeSeats" value='<s:property value="seatexe"/>'/>

                        </div>

                        <div class="form-group col-xs-4" id="lblbucSeatsdiv">
                            <label for="lblbucSeats" id="lblbucSeats">No.Of.Seats(BUC)</label>
                            <input type="text" class="form-control" placeholder="Seats(BUC)" name = "bucSeats" id="bucSeats" value='<s:property value="seatbusiness"/>'/>

                        </div>
                       

                        <div class="form-group col-xs-6" id="lblpriceExediv">
                            <label for="lblpriceExe" id="lblpriceExe">Price of (Executive Class)</label>
                            <input type="text" class="form-control" placeholder="Price (EXE)" name="priceExe" id="priceExe" value='<s:property value="costexe"/>'/>

                        </div>
                        <div class="form-group col-xs-6" id="lblpriceBucdiv">
                            <label for="lblpriceBuc" id="lblpriceBuc">Price of (Business Class)</label>
                            <input type="text" class="form-control" placeholder="Price (BUC)" id="priceBuc" name="priceBuc" value='<s:property value="costbusiness"/>'/>

                        </div>

                    </form>


                    <div class="form-group col-xs-6" id="btnPanel">
                        <button class="btn btn-success" id="btnUpdateFlight" data-loading-text="Please wait...">Update Flight</button>                           
                        <button class="btn btn-warning" id="btnClearFlight">Clear</button>                           
                    </div>  </div>


            </div>





        </div>








        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>



        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
