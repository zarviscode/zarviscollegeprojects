// ContextPath for the App.
var ctxPath = null;

$(document).ready(function() {
    ctxPath = $('#ctxPath').val();

    // To Display DatePicker

    $('#departure').datepicker({format: 'dd-mm-yyyy'});

    // ReSet for DB Error
    $('#dbError').hide();

    // ReSet for Message Error on home page

    $('#errMsg').text('');

    // Button Action to Sign-In.
    $('#btnSignIn').click(function() {

        // Reset for Error Messages
        $('#userNameDiv').removeClass('form-group has-error');
        $('#lblUserName').removeClass('control-label');
        $('#passwordDiv').removeClass('form-group has-error');
        $('#lblPassword').removeClass('control-label');

        var userName = $('#userName').val();
        var password = $('#password').val();

        if (userName == null || userName.length == 0) {
            $('#userNameDiv').addClass('form-group has-error');
            $('#lblUserName').addClass('control-label');
            return false;
        }
        if (password == null || password.length == 0) {
            $('#passwordDiv').addClass('form-group has-error');
            $('#lblPassword').addClass('control-label');
            return false;
        }
        var btn = $(this);
        btn.button('loading');

        $.ajax({
            url: '${pageContext.request.contextPath}/signin',
            type: 'POST',
            data: $('#loginForm').serialize(),
            success: function(response) {
                if (response == 0) {
                    $('#dbError').show();
                    $('#dbError').text('Invalid User Name/Password !');
                } else {

                    navigate(response);
                }

            }
        }).always(function() {
            btn.button('reset');
        });
    });



    // Button Action to display forgotPassword Page

    $('#forgotLink').click(function() {
        displayForgotPasswordForm();

    });

    // Button Action for the Form ForgotPassword

    // Reset for 

    $('#forgotBtn').click(function() {

        // Reset for All Errors


        $('#userNameDiv').removeClass('form-group has-error');
        $('#lblUserName').removeClass('control-label');
        $('#securityQuestionDiv').removeClass('form-group has-error');
        $('#lblsecurityQuestin').removeClass('control-label');
        $('#answerDiv').removeClass('form-group has-error');
        $('#lblAnswer').removeClass('control-label');

        var userName = $('#email').val();
        var question = $('#question').val();
        var answer = $('#answer').val();

        if (userName == null || userName.length == 0) {
            $('#userNameDiv').addClass('form-group has-error');
            $('#lblUserName').addClass('control-label');
            return false;
        }

        if (question == null || question == 'Select Security Question') {
            $('#securityQuestionDiv').addClass('form-group has-error');
            $('#lblsecurityQuestin').addClass('control-label');
            return false;
        }

        if (answer == null || answer.length == 0) {
            $('#answerDiv').addClass('form-group has-error');
            $('#lblAnswer').addClass('control-label');
            return false;
        }

        var btn = $(this);
        btn.button('loading');

        $.ajax({
            url: '${pageContext.request.contextPath}/getPasswordAction',
            type: 'POST',
            data: $('#forgotPasswordForm').serialize(),
            success: function(response) {
                if (response == 1) {
                    $('#messageModal').show();
                    $('#messageModal').html('Invalid Details Entered');
                } else {
                    $('#messageModal').show();
                    $('#messageModal').html('Your Password is ' + response);
                }
            }
        }).always(function() {
            btn.button('reset');
        });
    });


    // Forgot Password form Clear Action

    $('#forgotClear').click(function() {
        $('#userNameDiv').removeClass('form-group has-error');
        $('#lblUserName').removeClass('control-label');
        $('#securityQuestionDiv').removeClass('form-group has-error');
        $('#lblsecurityQuestin').removeClass('control-label');
        $('#answerDiv').removeClass('form-group has-error');
        $('#lblAnswer').removeClass('control-label');

        $('#email').val("");
        $('#question').val("Select Security Question");
        $('#answer').val("");

    });





    // Google Distance Matrix API

    $('#destination').change(function() {

        var origin = $('#source').val() + ', India';
        var destination = $('#destination').val() + ', India';
        service = new google.maps.DistanceMatrixService();

        service.getDistanceMatrix(
                {
                    origins: [origin],
                    destinations: [destination],
                    travelMode: google.maps.TravelMode.DRIVING,
                    avoidHighways: false,
                    avoidTolls: false
                },
        callback
                );

        function callback(response, status) {


            if (status == "OK") {
                //alert(response.destinationAddresses[0]);
                //dest.value = response.originAddresses[0];
                //alert(response.rows[0].elements[0].distance.text);
                var dist = response.rows[0].elements[0].distance.text;
                var distance = dist.substr(0, dist.length - 2);
                var dist = distance.replace( /,/g, "" );
                $('#distance').val(dist);
            } else {
                alert("Error: " + status);
            }
        }
    });

    // To Find Total Number of Seats

    $('#bucSeats').blur(function() {
        var exeSeats = $('#exeSeats').val();
        var bucSeats = $('#bucSeats').val();
        $('#totalSeats').val(parseInt(exeSeats) + parseInt(bucSeats));
    });


    // To add Number of Days for service availability, Displays a Calendar.
    $('#till').datepicker({format: 'dd-mm-yyyy'});

    // To Add a Flight

    $('#btnAddFlight').click(function() {

        var provider = $('#provider').val();
        var source = $('#source').val();
        var destination = $('#destination').val();
        var distance = $('#distance').val();
        var deptTime = $('#deptTime').val();
        var arrTime = $('#arrTime').val();
        var till = $('#till').val();
        var exeSeats = $('#exeSeats').val();
        var bucSeats = $('#bucSeats').val();
        var totalSeats = $('#totalSeats').val();
        var priceExe = $('#priceExe').val();
        var priceBuc = $('#priceBuc').val();

        if (provider == 'Select Provider') {
            $('#lblproviderdiv').addClass('form-group has-error');
            $('#lblprovider').addClass('control-label');
            return false;
        }

        if (source == 'Source') {
            $('#lblsourcediv').addClass('form-group has-error');
            $('#lblsource').addClass('control-label');
            return false;
        }

        if (destination == 'Destination') {
            $('#lbldestinationdiv').addClass('form-group has-error');
            $('#lbldestination').addClass('control-label');
            return false;
        }

        if (distance.length == 0 || distance == null) {
            $('#lbldistancediv').addClass('form-group has-error');
            $('#lbldistance').addClass('control-label');
            return false;
        }

        if (deptTime.length == 0 || deptTime == null) {
            $('#lbldeptTimediv').addClass('form-group has-error');
            $('#lbldeptTime').addClass('control-label');
            return false;
        }

        if (arrTime.length == 0 || arrTime == null) {
            $('#lblarrTimediv').addClass('form-group has-error');
            $('#lblarrTime').addClass('control-label');
            return false;
        }

        if (till.length == 0 || till == null) {
            $('#lbltilldiv').addClass('form-group has-error');
            $('#lbltill').addClass('control-label');
            return false;
        }

        if (exeSeats.length == 0 || exeSeats == null) {
            $('#lblexeSeatsdiv').addClass('form-group has-error');
            $('#lbldestination').addClass('control-label');
            return false;
        }

        if (bucSeats.length == 0 || bucSeats == null) {
            $('#lblbucSeatsdiv').addClass('form-group has-error');
            $('#lblbucSeats').addClass('control-label');
            return false;
        }

        if (totalSeats.length == 0 || totalSeats == null) {
            $('#lbltotalSeatsdiv').addClass('form-group has-error');
            $('#lbltotalSeats').addClass('control-label');
            return false;
        }

        if (priceExe.length == 0 || priceExe == null) {
            $('#lblpriceExediv').addClass('form-group has-error');
            $('#lblpriceExe').addClass('control-label');
            return false;
        }

        if (priceBuc.length == 0 || priceBuc == null) {
            $('#lblpriceBucdiv').addClass('form-group has-error');
            $('#lblpriceBuc').addClass('control-label');
            return false;
        }

        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: '${pageContext.request.contextPath}/postFlight',
            type: 'POST',
            data: $('#flightForm').serialize(),
            success: function(response) {

                if (response == 1) {
                    $('#dbMsg').show();
                    $('#dbMsg').text('Flight Created');
                } else {
                    $('#dbMsg').show();
                    $('#dbMsg').text('Something Wrong !');
                }

            }
        }).always(function() {
            btn.button('reset');
        });

    });

    // To Clear Flight Fields

    $('#btnClearFlight').click(function() {
        $('#lblprovider').removeClass('control-label');
        $('#lblsource').removeClass('control-label');
        $('#lbldestination').removeClass('control-label');
        $('#lbldistance').removeClass('control-label');
        $('#lbldeptTime').removeClass('control-label');
        $('#lblarrTime').removeClass('control-label');
        $('#lbltill').removeClass('control-label');
        $('#lblexeSeats').removeClass('control-label');
        $('#lblbucSeats').removeClass('control-label');
        $('#lbltotalSeats').removeClass('control-label');
        $('#lblpriceExe').removeClass('control-label');
        $('#lblpriceBuc').removeClass('control-label');

        $('#lblproviderdiv').removeClass('form-group has-error');
        $('#lblsourcediv').removeClass('form-group has-error');
        $('#lbldestinationdiv').removeClass('form-group has-error');
        $('#lbldistancediv').removeClass('form-group has-error');
        $('#lbldeptTimediv').removeClass('form-group has-error');
        $('#lblarrTimediv').removeClass('form-group has-error');
        $('#lbltilldiv').removeClass('form-group has-error');
        $('#lblexeSeatsdiv').removeClass('form-group has-error');
        $('#lblbucSeatsdiv').removeClass('form-group has-error');
        $('#lbltotalSeatsdiv').removeClass('form-group has-error');
        $('#lblpriceExediv').removeClass('form-group has-error');
        $('#lblpriceBucdiv').removeClass('form-group has-error');

    });

    // List Flights Button Action

    $('#btnListFlights').click(function() {
        navigate('listFlights');

    });

    // Navigate to Session User Page Based on Role


    $('#btnHome').click(function() {
        navigate('home');

    });

    // Logout for User in the App

    $('#btnLogout').click(function() {
        navigate('logout');
    });


    // Button Action for Search on HomePage

    $('#btnHomeSearch').click(function() {

        var source = $('#source').val();
        var destination = $('#dest').val();
        var departure = $('#departure').val();
        var error = false;

        if (source == 'Source') {
            error = true;

        }

        if (destination == 'Destination') {
            error = true;

        }

        if (departure.length == 0 || departure == null) {
            error = true;

        }

        if (error == true) {
            $('#errMsg').text('All Fields are required !');
            return false;
        }


        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/searchFlights',
            type: 'POST',
            data: $('#homeSearchForm').serialize(),
            success: function(response) {
                if (response == 0) {
                    $('#errMsg').html('Results not Found');
                } else {
                    navigate('searchResults');
                }


            }
        }).always(function() {
            btn.button('reset');
        });


    });


    // Login Action for Flight Booking

    $('#btnFlightBookLogin').click(function() {

        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/flightBookingLoginAction',
            type: 'POST',
            data: $('#flightBookLoginForm').serialize(),
            success: function(response) {
                if (response == 0) {
                    $('#errMsg').html('Invalid UserName/Password');
                } else {
                    navigate(response);
                }
            }
        }).always(function() {
            btn.button('reset');
        });

    });



    // TicketBooking Action
    $('#btnBook').click(function() {

        var flightno = $('#flightno').val();
        var className = $('#className').val();
        var numberoftickets = $('#numberoftickets').val();
        var sourcedate = $('#sourcedate').val();

        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/confirmBookFlightAction',
            type: 'POST',
            data: $('#bookingForm').serialize(),
            success: function(response) {
                if (response == 1) {
                    navigate('confirmResponseAction') ;
                } 
            }
        }).always(function() {
            btn.button('reset');
        });
    });



    // Clear function for Form Fields

    $.fn.clearForm = function() {
        var email = $('#email').val('');
        var password = $('#password').val('');
        var firstName = $('#firstName').val('');
        var lastName = $('#lastName').val('');
        var question = $('#question').val('');
        var answer = $('#answer').val('');
        var mobile = $('#mobile').val('');
        //$('#error').hide();
    }

    // Creating New User

    // ClientSide error div

    $('#error').hide();

    $('#btnNewUser').click(function() {

        var email = $('#email').val();
        var password = $('#password').val();
        var firstName = $('#firstName').val();
        var lastName = $('#lastName').val();
        var gender = null;
        $(':radio:checked').each(function() {
            gender = $(this).val(); // gets value of each selected radio button
        });
        var question = $('#question').val();
        var answer = $('#answer').val();
        var mobile = $('#mobile').val();

        var error = false;
        if (email.length == 0 || email == null) {
            error = true;

        }
        if (password.length == 0 || password == null) {
            error = true;

        }
        if (firstName.length == 0 || firstName == null) {
            error = true;

        }
        if (lastName.length == 0 || lastName == null) {
            error = true;

        }
        if (question.length == 0 || question == null) {
            error = true;

        }
        if (answer.length == 0 || answer == null) {
            error = true;

        }
        if (mobile.length == 0 || mobile == null) {
            error = true;

        }

        if (error) {
            $('#error').show();
            $('#error').html('All Fields are required !');
            return;

        }


        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/signUpAction',
            type: 'POST',
            data: $('#signUpForm').serialize(),
            success: function(response) {
                console.debug(response);
                //alert(response);
                if (response == 1) {
                    console.debug($('#error'));
                    //$('#error').css('display','block');
                    $('#error').show();
                    $('#error').addClass('alert-success');
                    $('#error').html("Registration Completed");
                    $.fn.clearForm();
                }
            }
        }).always(function() {
            btn.button('reset');
        });

    });


    // SignUp from Clear action


    $('#userClear').click(function() {
        $(this).clearForm();

    });


    // Button Action for Change Password

    $('#forgotError').hide();

    $('#changeClear').click(function() {
        $('#forgotError').hide();
        $('#currentPassword').val('');
        $('#newPassword').val('');

    });

    $('#changeBtn').click(function() {

        var email = $('#email').val();
        var currentPassword = $('#currentPassword').val();
        var newPassword = $('#newPassword').val();


        var error = false;
        if (email.length == 0 || email == null) {
            error = true;
        }

        if (currentPassword.length == 0 || currentPassword == null) {
            error = true;
        }

        if (newPassword.length == 0 || newPassword == null) {
            error = true;
        }

        if (error == true) {
            $('#forgotError').show();
            $('#forgotError').html('All Fields are required !');

            return;
        }

        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/changePasswordAction',
            type: 'POST',
            data: $('#changePasswordForm').serialize(),
            success: function(response) {
                console.debug(response);
                //alert(response);
                if (response == 1) {

                    $('#forgotError').show();
                    $('#forgotError').addClass('bg-success');
                    $('#forgotError').html("Password Change Successfully");
                    $('#currentPassword').val('');
                    $('#newPassword').val('');

                } else {

                    $('#forgotError').show();
                    $('#forgotError').html("Invalid Details Entered !");
                }
            }
        }).always(function() {
            btn.button('reset');
        });


    });



    // Cancel Ticket Button Action

    $('#cancelErr').hide();

    $('#cancleTicketBtn').click(function() {
        var pnr = $('#pnr').val();

        if (pnr.length == 0 || pnr == null) {
            $('#cancelErr').show();
            $('#cancelErr').html('PNR ID is required !');
            return false;
        }

        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/cancelTicketAction',
            type: 'POST',
            data: $('#cancelTicketForm').serialize(),
            success: function(response) {
                $('#cancelErr').show();
                $('#cancelErr').html(response);
            }
        }).always(function() {
            btn.button('reset');
        });

    });
    
    
    $('#btnUpdateFlight').click(function(){
        
        var btn = $(this);
        btn.button('loading');
        $.ajax({
            url: ctxPath + '/confirmUpdateFlightAction',
            type: 'POST',
            data: $('#updateFlightForm').serialize(),
            success: function(response) {
                $('#dbMsg').show();
                $('#dbMsg').html(response);
            }
        }).always(function() {
            btn.button('reset');
        });
    });


});


// Function call to navigate to authenticated User.
function navigate(uri) {
    window.location = ctxPath + '/' + uri;
}

// Function call to display forgotPassword.jsp Page
function displayForgotPasswordForm() {
    navigate('forgotPassword');
}

