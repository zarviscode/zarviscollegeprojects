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


            <h3 class="text-primary">Booking History</h3>
            <br/>
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <tr class="info">
                        <th>PNR No</th>
                        <th>Flight No</th>
                        <th>Provider</th>
                        <th>Source</th>
                        <th>Destination</th>
                        <th>Journey Date</th>

                    </tr>


                    <s:iterator value="list" var="book">

                        <s:if test="%{#book.username == #session.user.email}">
                            <tr>

                                <s:if test="%{#book.active == 0}">
                                    <td><s:property value="%{#book.pnr}"/>&nbsp;<span class="label label-danger">Canceled</span></td>
                                    </s:if>
                                    <s:elseif test="%{#book.active == 1}">
                                    <td><s:property value="%{#book.pnr}"/></td>
                                </s:elseif>


                                <td><s:property value="%{#book.flightno}"/></td>
                                <td><s:property value="%{#book.provider}"/></td>
                                <td><s:property value="%{#book.source}"/></td>
                                <td><s:property value="%{#book.destination}"/></td>
                                <td><s:property value="%{#book.travelldate}"/></td>



                            </tr>
                        </s:if>
                    </s:iterator>
                </table>
            </div>



        </div>







        <input type="hidden" value="${pageContext.request.contextPath}" id="ctxPath"/>




        <script type="text/javascript" src="resources/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="resources/js/bootstrap-datepicker.js"></script>
    </body>
</html>
