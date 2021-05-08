<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddEditCustomer.aspx.cs" Inherits="WebApplication2.AddEditCustomer" %>

<!DOCTYPE html>

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet"  >
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
  
    <div class="container">
        <form id="frmCustomer" class="needs-validation" novalidate>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="txtCustomerName">Customer Name</label>
                    <input type="text" class="form-control" id="txtCustomerName" value="" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="txtCustomerMobile">Mobile Number</label>
                    <input type="text" class="form-control" id="txtCustomerMobile" value="" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="txtEamil">Email ID</label>
                    <input type="email" class="form-control" id="txtEamil" required>
                    <div class="invalid-feedback">
                        Please provide a valid Email ID.
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom04">State</label>
                    <select class="custom-select" id="cmbState">
                        <option selected disabled value="">Choose...</option>
                        <option>Rajastan</option>
                         <option>Gujrat</option>
                         <option>Goa</option>
                    </select>
                    <div class="invalid-feedback">
                        Please select a valid state.
                    </div>
                </div>
                <div class="col-md-3 mb-3">
                    <label for="validationCustom05">Zip</label>
                    <input type="text" class="form-control" id="txtZip" >
                    <div class="invalid-feedback">
                        Please provide a valid zip.
                    </div>
                </div>
            </div>
          <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="txtAddress">Address : </label>
                   <textarea class="form-control" id="txtAddress" required></textarea>
                    <div class="invalid-feedback">
                        Please Enter Address
                    </div>
                </div>
          
            </div>
            
            <div class="form-group">
                <div class="form-check">
                    <input class="form-check-input" type="checkbox" value="" id="invalidCheck" >
                    <label class="form-check-label" for="invalidCheck">
                        Agree to terms and conditions
                    </label>
                    <div class="invalid-feedback">
                        You must agree before submitting.
                    </div>
                </div>
            </div>
            <button class="btn btn-primary" type="submit">Submit form</button>
        </form>
    </div>
    <hr />
    <br />
    <br />
     <div class="container">
         <h4>Test form</h4>
        <form id="frmTest" class="needs-validation" novalidate>
            <div class="form-row">
                <div class="col-md-6 mb-3">
                    <label for="txtCustomerName">Test Name</label>
                    <input type="text" class="form-control" id="txtTestName" value="" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
                <div class="col-md-6 mb-3">
                    <label for="txtCustomerMobile">Mobile Number</label>
                    <input type="text" class="form-control" id="txtCustomerMobile" value="" required>
                    <div class="valid-feedback">
                        Looks good!
                    </div>
                </div>
            </div>
          
            <button class="btn btn-primary" type="submit">Submit form</button>
        </form>
    </div>

    <script>
        // Example starter JavaScript for disabling form submissions if there are invalid fields
        (function () {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                          
                        }
                        else {
                            // if customer form is submited then call the save  method.
                            if (form.id == "frmCustomer") {
                                // dont submit the form which is default behav
                                // dont submit the form which is default behav
                                event.preventDefault();
                                event.stopPropagation();

                                $.SaveCustomerDetails();
                            }
                           
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        })();
    </script>



    <script>
        $.SaveCustomerDetails = function () {


            var customerName = $("#txtCustomerName").val();
            var custmobile = $("#txtCustomerMobile").val();
            var custemail = $("#txtEamil").val();
            var custaddress = $("#txtAddress").val();

            // Create an object:
            var CustomerData = {
                CustomerID: 1, Name: customerName, MobileNo: custmobile, EmailID: custemail,
                Address: custaddress
            };
          

            $.ajax({
                url: "http://192.168.43.63/api/Masters/SaveCustomerData",
                type: 'POST',
              
                data: JSON.stringify(CustomerData),
             
                dataType: "json",
                success: function (responseData) {

                    console.log(responseData);
                    alert("Success !");
                },
                error: function (xhr, status, error) {
                    alert("Error : " + error);
                    alert("Error Text: " + xhr.responseText);


                },
                failure: function (r) {
                    alert("Fail:" + r.responseText);
                }
            }).done(function (response) { //

                //alert("Done : " + response);
            });

        }

    </script>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js" integrity="sha384-JEW9xMcG8R+pH31jmWH6WWP0WintQrMb4s7ZOdauHnUtxwoG2vI5DkLtS3qm9Ekf" crossorigin="anonymous"></script>


</body>
</html>
