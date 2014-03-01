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
            <h3>Customers Report</h3>
            
            <div class="table-responsive">
                <table class="table table-bordered table-hover">
                    <tr class="info">
                        <th>User Name</th>
                        <th>First Name</th>
                        <th>Last Name</th>
                        <th>Gender</th>
                        <th>Mobile</th>
                                               
                    </tr>
                    
                    
                    <s:iterator value="list" var="masUser">
                        
                        <s:if test="%{#masUser.email != #session.user.email}">
                        <tr>
                            <td><s:property value="%{#masUser.email}"/></td>
                            <td><s:property value="%{#masUser.firstname}"/></td>
                            <td><s:property value="%{#masUser.lastname}"/></td>
                            <td><s:property value="%{#masUser.gender}"/></td>
                            <td><s:property value="%{#masUser.mobile}"/></td>
                           
                            
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
