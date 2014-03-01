<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>

<html lang="en">
    <head>
        <title>MAS | CANCEL TICKET</title>
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

            #cancelFormDiv {
                height: auto;
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


            <h4>Cancel Your Ticket</h4>

            <div class="row">



                <div class="col-sm-4 well" id="cancelFormDiv">
                    
                    <div class="panel panel-primary">
                        
                        <div class="panel-heading">Cancel</div>
                        
                        <div class="panel-body">
                            
                            <form id="cancelTicketForm">
                                
                                <p class="bg-danger" id="cancelErr"></p>
                                <div class="form-group">
                                    <label for="lblPnr">Enter PNR ID</label>
                                    <input type="text" name="pnr" id="pnr" class="form-control"/>
                                </div>
                                
                                <div>
                                    <input type="button" class="btn btn-success" id="cancleTicketBtn" data-loading-text="Please wait..." value="Cancel Ticket"/>
                                    
                                </div>
                                
                                
                            </form>
                            
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
