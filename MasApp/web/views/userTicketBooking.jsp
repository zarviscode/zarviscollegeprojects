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
                <div class="pull-right">


                    <button class="btn btn-danger" id="btnLogout">LogOut</button>
                </div>
                <h2>Miles Acquisition System.</h2>
                <h4 class="text-success lead">Welcome, <s:property value="%{#session.user.firstname}"/> <s:property value="%{#session.user.lastname}"/> ( <s:property value="%{#session.user.userrole}"/> )</h4>
            </div>


            <div class="row">
                
                <div class="col-xs-6 well">
                       <div class="panel-primary">
                    <div class="panel-heading">Book Flight Tickets</div>
                    <div class="panel-body">
                        
                        <p id="errMsg" class="text-center text-danger"></p>

                        <form role="form" id="homeSearchForm">
                            <div class="form-group col-xs-6">
                                <label for="from">Source</label>

                                <select class="form-control" id="source" id="source" name="source">
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
                            <div class="form-group col-xs-6">
                                <label for="from">Destination</label>

                                <select class="form-control" id="source" id="dest" name="dest">
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

                        
                            <div class="form-group col-xs-6">
                                <label for="from">Depart On Date</label>
                                <input type="text" class="form-control" placeholder="Departure" id="departure" name="departure"/>

                            </div>

                        </form>


                        <div class="form-group col-xs-6" id="btnPanel">
                            <button class="btn btn-primary" id="btnHomeSearch" data-loading-text="Searching...">Search Flights</button>                           

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
