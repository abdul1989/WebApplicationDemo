<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.24/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.24/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" type="text/css" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
        .selected2 {
    background-color: midnightblue !important;
    color: white !important;
    text-decoration: none !important;
}
    </style>
   
</head>
    
<body>
    <a href="AddEditCustomer.aspx">Add User</a>
    <button class="btn btn-primary" id="btnGet1">
        Get 1
    </button>
   

   <table id="tblCustomer" class="table table-condensed table-bordered table-striped">
    <thead>
        <tr>
           <th>Customer ID</th>
           <th>Customer Name</th>
           <th>Address</th>
           <th>Mobile No</th>
           <th>Email ID</th>
             <th>Edit</th>
              <th>Select</th>
              <th>Delete</th>
        </tr>
    </thead>
</table>
   


    <script>


        $("#btnGet1").click(function () {
            $.LoadCustomerData();

        });
        $.GetCustomerDataByID = function (ID) {

            $.ajax({
                url: "http://192.168.43.63/api/Masters/GetCustomerData",
                type: 'GET',
                Accept: 'application / json, application/ xml',
                data: { CustID: ID },
                dataType: 'json',

                success: function (responseData) {

                    console.log(responseData);
                   
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

        $.LoadCustomerData = function () {

            var table = $('#tblCustomer').DataTable({
                fixedHeader: true,
                processing: true,
                responsive: true,
                stateSave: true,
                aLengthMenu: [
                    [10, 25, 50, 100, 200, -1],
                    [10, 25, 50, 100, 200, "All"]
                ],
                ajax: {

                    url: "http://192.168.43.63/api/Masters/GetCustomerData",
                    type: 'GET',
                  
                    data: { CustID: 1 },
                    dataSrc: function (d) {
                        return d
                    }

                },
                columns: [
                   
                    { 'data': 'CustomerID' },
                    { 'data': 'Name' },
                    { 'data': 'MobileNo' },
                    { 'data': 'EmailID' },
                    { 'data': 'Address' },
                  
                        {
                            data: 'Edit',
                            render: function (data, type, row) {


                                return "<a class='lnkEdit btn btn btn-primary' href='" + data + "'>&nbsp;Edit	&nbsp;	</a>";
                            }
                        },
                        {
                            data: 'Select',
                            render: function (data, type, row) {


                                return "<a class='lnkSelect btn btn btn-primary' href='" + data + "'>Select</a>";
                            }
                        },
                        {
                            data: 'Delete',
                            render: function (data, type, row) {


                                return "<a class='lnkDelete btn btn btn-primary' href='" + data + "'>Delete</a>";
                            }
                        }


                ],


            }); // table ends here
            $('#tblCustomer tbody').on('click', 'tr', function () {



                if ($(this).hasClass('selected')) {
                    $(this).removeClass('selected');
                }
                else {
                    table.$('tr.selected').removeClass('selected');
                    $(this).addClass('selected');
                }
            });


            //to invisble multipe columns
            // table.columns([1, 2]).visible(true);

            table.columns([1]).visible(true);
        };


        //   attaching event on table , then on link ( to be pricese)
        $("#tblCustomer").on("click", ".lnkSelect", function () {

            event.preventDefault(); // <---------you may want this to stop the link

            // get the link value
            //var addressValue = $(this).attr("href");

            //remove all other selected rows..
            $('#tblCustomer tr.selected2').removeClass('selected2');

            // set the selected rows.
            $(this).parent().parent().addClass('selected2');


            var currentRow = $(this).closest("tr");
            var data = $('#tblCustomer').DataTable().row(currentRow).data();

            var varCustomerName = (data['Name']);
            var varCompanyName = (data['MobileNo']);
            var varMailID = (data['EmailID']);
         

            $('#txtCustomerName').val(varCustomerName);
            $('#txtCompanyName').val(varCompanyName);
            $('#txtMailID').val(varMailID);
          

        
            return false; // <---------or this if you want to prevent bubbling as well
        });
    </script>

    <div style="width:50%; margin-left:20px;">
        <label>Customer Name</label>
       <input  type="text" class="form-control" id="txtCustomerName" /> <br />
        <label>Company Name</label>
    <input type="text" class="form-control" id="txtCompanyName" /> <br />
        <label>GS Name</label>
    <input type="text" class="form-control" id="txtMailID" /> <br />
    </div>

</body>
</html>
