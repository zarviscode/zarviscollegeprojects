<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>
<html lang="en">
    <head>
        <title>MAS | SEARCH RESULTS</title>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="resources/css/bootstrap.min.css"/>
        <link rel="stylesheet" type="text/css" href="resources/css/datepicker.css"/>

        <style type="text/css">
            #wellId {
                width: 600px;
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

                    <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
                    
                </ul>
                <h2>Miles Acquisition System.</h2>
            </div>
            <br/>
            <h4>Available Flights as on : <s:property value="deptDate"/></h4>
            
            <br/>
            <div class="table-responsive">
                <table class="table table-condensed table-bordered">
                    <tr class="bg-primary">
                        
                        <th>Provider</th>
                        <th>Source</th>
                        <th>Destination</th>
                        <th>Departure</th>
                        <th>Arrival</th>                                               
                        <th>Price (EXE)</th>
                        <th>Price (BUC)</th>
                        <th>Distance (Km.)</th>                        
                        <th>Action</th> 
                    </tr>

                    <s:iterator value="list" var="flight">

                        <tr>
                            
                            <td><s:property value="%{#flight.provider}"/></td>
                            <td><s:property value="%{#flight.source}"/></td>
                            <td><s:property value="%{#flight.destination}"/></td>
                            <td><s:property value="%{#flight.depttime}"/></td>
                            <td><s:property value="%{#flight.arrtime}"/></td>                                                       
                            <td><s:property value="%{#flight.costexe}"/></td>
                            <td><s:property value="%{#flight.costbusiness}"/></td>
                            <td><s:property value="%{#flight.distance}"/></td>                            
                            <td><a href='${pageContext.request.contextPath}/showBookingAction?fid=<s:property value="%{#flight.flightno}"/>&deptDate=<s:property value="deptDate"/>' class="btn btn-success">Book</a></td>

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
