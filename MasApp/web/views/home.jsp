<!DOCTYPE html>
<%@taglib  prefix="s" uri="/struts-tags" %>
<html lang="en">
    <head>
        <title>MAS</title>
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

                    <li class="active"><a href="${pageContext.request.contextPath}/showSignup">Sign Up</a></li>
                    <li class="active"><a href="#" data-toggle="modal" data-target="#myModal">Sign In</a></li>
                </ul>
                <h2>Miles Acquisition System.</h2>
            </div>

                    <br/>
                    
            <div class="row">

                <div class="col-md-6 well" id="wellId">

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




                <div class="col-md-5 well pull-right">

                    <div id="myCarousel" class="carousel slide" data-ride="carousel">
                        <!-- Carousel indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                            <li data-target="#myCarousel" data-slide-to="1"></li>
                            <li data-target="#myCarousel" data-slide-to="2"></li>
                            <li data-target="#myCarousel" data-slide-to="3"></li>
                            <li data-target="#myCarousel" data-slide-to="4"></li>
                            <li data-target="#myCarousel" data-slide-to="5"></li>
                        </ol>   
                        <!-- Carousel items -->
                        <div class="carousel-inner">
                            <div class="active item">
                                <img src="resources/images/slide-1.jpg" alt="Slide 1">
                                <div class="carousel-caption">
                                    <h3>SpiceJet</h3>
                                    <p>Fly SpiceJet, India's favourite Domestic Airline.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/slide-2.jpg" alt="Slide 2">
                                <div class="carousel-caption">
                                    <h3>Air India</h3>
                                    <p>Air India flies you daily to World.</p>
                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/slide-4.jpg" alt="Slide 3">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/slide-5.png" alt="Slide 3">
                                <div class="carousel-caption">

                                </div>
                            </div>
                            <div class="item">
                                <img src="resources/images/slide-6.png" alt="Slide 3">
                                <div class="carousel-caption">

                                </div>
                            </div>


                        </div>
                        <!-- Carousel nav -->
                        <a class="carousel-control left" href="#myCarousel" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="carousel-control right" href="#myCarousel" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>


                </div>
            </div>
        </div>


        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title" id="myModalLabel">Sign In</h4>
                    </div>
                    <div class="modal-body">

                        <form role="form" id="loginForm">

                            <div class="alert alert-danger" id="dbError"></div>

                            <div class="form-group" id="userNameDiv">
                                <label for="userName" id="lblUserName">E-Mail</label>
                                <input type="email"  name ="email" class="form-control" placeholder="E-Mail" id="userName"/>                                    
                            </div>
                            <div class="form-group" id="passwordDiv">
                                <label for="password" id="lblPassword">Password</label>
                                <input name="password" type="password" class="form-control" placeholder="Password" id="password"/>                                    
                            </div>
                            <br/>
                            <div class="form-group">

                                <button type="button" class="btn btn-success" id="forgotLink">Forgot Password ?</button>
                            </div>

                        </form>                            


                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                        <button type="button" id="btnSignIn" class="btn btn-primary" data-loading-text="Loading...">Sign In</button>
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
