<%--
  Created by IntelliJ IDEA.
  User: sambit.pradhan
  Date: 7/27/2022
  Time: 11:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<%--    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/5.1.3/js/bootstrap.min.js"></script>--%>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.13/css/jquery.dataTables.min.css">
<%--    <script src="https://cdn.datatables.net/1.10.23/js/jquery.dataTables.min.js"> </script>--%>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" >
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <title>Property Registration</title>
</head>
<body style="margin: 2rem;">
<style>
    a{
        cursor: pointer;
    }
</style>
<h3 style="color: green">Property Registration Form</h3>
<div class="card text-center" style="margin-right: 5rem; margin-left: 5rem;">
    <div class="card-header">
        <ul class="nav nav-tabs card-header-tabs">
            <li class="nav-item"><a class="nav-link active" id="addId" onclick="openAdd()" <%--href="/add"--%>>Add</a></li>
            <li class="nav-item"><a class="nav-link" id="viewId" onclick="openView()" <%--href="/view"--%>>View</a></li>
        </ul>
    </div>

    <div class="card-body">
        <div id="add">
            <form action="/propertyRegistration" method="post" id="propertyRegistrationForm" enctype="multipart/form-data">
                <h3 class="card-title">Property Details</h3>
                <div class="form">
                    <div class="row g-3 m-4">

                        <div class="col-md-4 control-label">
                            <label for="housingProject" class="form-label control-label">Housing Project</label>
                            <select class="form-control form-control" name="propertyId" id="propertyId" onchange="getPropertyPrice(this.value)" value="${propertyRegistration.property.housingProject}">
                                <option value="Select" hidden>Select</option>
                                <c:forEach items="${propertyList}" var="property" varStatus="coount">
                                    <option value="${property.propertyId}">${property.housingProject}</option>
                                </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="housingProject" id="housingProject">
                        <input type="hidden" name="propertyName" id="propertyName">

                        <c:choose>
                            <c:when test = "${propertyRegistration ne null}">
                                <input type="hidden" name="registrationId" id="propertyRegistrationId" value="${propertyRegistration.propertyRegistrationId}">
                            </c:when>
                            <c:otherwise>
                                <input type="hidden" name="registrationId" id="propertyRegistrationId" value="0">
                            </c:otherwise>
                        </c:choose>
<%--                        <input type="hidden" name="registrationId" id="propertyRegistrationId" value="${propertyRegistration.propertyRegistrationId}">--%>

                        <div class="col-md-4 control-label">
                            <label for="propertyType" class="form-label control-label">Property Type</label>
                            <select class="form-control form-control" name="propertyType" id="propertyType" value="${propertyRegistration.propertyType}">
                                <option value="Select" hidden>Select</option>
                                <c:forEach items="${propertyList}" var="property" varStatus="coount">
                                    <option value="${property.propertyType}">${property.propertyType}</option>
                                </c:forEach>
                        </select>
                        </div>
                        <div class="col-md-4 control-label">
                            <label for="propertyPrice" class="form-label control-label">Property Cost</label>
                            <input class="form-control form-control" name="propertyPrice" id="propertyPrice" value="${propertyRegistration.property.propertyPrice}"/>
                        </div>
                    </div>

                    <div class="card">
                        <h5 class="card-header control-label">Applicant Details</h5>
                        <div class="card-body">
                            <div class="hold">
                                <div class="row g-3 mb-4">
                                    <div class="col-md-4 control-label">
                                        <label for="name" class="form-label control-label">Name</label>
                                        <input type="text" name="applicantName" class="form-control" id="name" required value="${propertyRegistration.applicantName}"/>

                                    </div>
                                    <div class="col-md-4 control-label">
                                        <label for="email" class="form-label"><span class="">Email</span> </label>
                                        <input type="email" name="applicantEmail" class="form-control" id="email" required value="${propertyRegistration.applicantEmail}"/>
                                    </div>

                                    <div class="col-md-4 control-label">
                                        <label for="mobile" class="form-label control-label">Mobile</label>
                                        <input type="text" name="applicantPhone" class="form-control" id="mobile" required value="${propertyRegistration.applicantPhone}"/>
                                    </div>

                                </div>

                                <div class="row g-3">

                                    <div class="col-md-4 control-label">
                                        <label for="dob" class="form-label control-label">Date of Birth</label>
                                        <input type="date" name="applicantDOB" class="form-control datepicker minimumSize" id="dob" required value="${propertyRegistration.applicantDOB}"/>
                                    </div>

                                    <div class="col-md-4 control-label">
                                        <label for="gender" class="form-label control-label">Gender</label>
                                        <div class="row g-2" style="margin-left: 10rem;">
                                            <div class="col-md-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="applicantGender" id="exampleRadios1" value="Male" checked>
                                                    <label class="form-check-label" for="exampleRadios1"> Male </label>
                                                </div>
                                            </div>
                                            <div class="col-md-4">
                                                <div class="form-check">
                                                    <input class="form-check-input" type="radio" name="applicantGender" id="exampleRadios2" value="FeMale">
                                                    <label class="form-check-label" for="exampleRadios2">FeMale </label>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-4 control-label" style="margin-top: 2rem;">
                                        <div class="form-group">
                                            <label for="idProof">Upload id-proof</label>
                                            <input type="file" class="form-control-file" name="idProof" id="idProof">
                                        </div>
                                    </div>
                                </div>

                                <div class="btnhold mt-3">
                                    <button type="button" class="btn btn-outline-primary mr-3" onclick="validateForm()">Submit</button>
                                    <button type="reset" class="btn btn-outline-secondary">Reset</button>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>



        <div id="view">
            <h3 class="card-title">Registration Details</h3>
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th>S.No</th>
                        <th>Housing Project</th>
                        <th>Property Type</th>
                        <th>Property Cost</th>
                        <th>Applicant Name</th>
                        <th>Applicant Email</th>
                        <th>Applicant Mobile</th>
                        <th>Applicant DOB</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${propertyRegistrationList}" var="propertyRegistration" varStatus="count">
                        <tr>
                            <td>${count.count}</td>
                            <td>${propertyRegistration.property.housingProject}</td>
                            <td>${propertyRegistration.propertyType}</td>
                            <td>${propertyRegistration.property.propertyPrice}</td>
                            <td>${propertyRegistration.applicantName}</td>
                            <td>${propertyRegistration.applicantEmail}</td>
                            <td>${propertyRegistration.applicantPhone}</td>
                            <td>${propertyRegistration.applicantDOB}</td>
                            <td>
                                <a href = "/edit/${propertyRegistration.propertyRegistrationId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16"><path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001zm-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708l-1.585-1.585z"/></svg></a>
                                |
                                <a href = "/delete/${propertyRegistration.propertyRegistrationId}"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-trash" viewBox="0 0 16 16"><path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/><path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4 4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/></svg></a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>

</body>

<script>
    $(document).ready(function (){
        $('#add').show();
        $('#view').hide();
    });

    function openAdd(){
        $('#view').hide();
        $('#add').show();

        $('#addId').addClass("active");
        $('#viewId').removeClass("active");
    }
    function openView(){
        $('#view').show();
        $('#add').hide();

        $('#addId').removeClass("active");
        $('#viewId').addClass("active");
    }

    function getPropertyPrice(propertyId){
        console.log("Property Id : " + propertyId);
        $.ajax({
            url: '/getPropertyPrice',
            type: 'GET',
            data: {
                propertyId: propertyId
            },
            success: function (data) {
                console.log(data);
                const property = JSON.parse(data);
                $('#propertyPrice').val(property.propertyPrice);
                $('#housingProject').val(property.housingProject);
                $('#propertyName').val(property.propertyName);
            }
        });
    }

    function validateForm(){

       let name = $('#name').val();
       let email = $('#email').val();
       let phone = $('#mobile').val();
       let dob = $('#dob').val();

       let nameRegx = /^[a-zA-Z ]+$/;
       let emailRegx = /^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$/;
       let phoneRegx = /^[0-9]{10}$/;

       let today = new Date();

       if (name == null || name == "") {
           alert("Name must be filled out");
           $('#name').focus();
           $('#name').css('border-color', 'red');
           $('#name').attr('placeholder', 'Please enter name');
           return false;
       } else if (!nameRegx.test(name)) {
           alert("Name must be alphabets");
           $('#name').focus();
           $('#name').css('border-color', 'red');
           $('#name').attr('placeholder', 'Please enter valid name');
           return false;
       } else if (name.length<3 || name.length > 30){
           alert("Name must be between 3 and 30 characters");
           $('#name').focus();
           $('#name').css('border-color', 'red');
           $('#name').attr('placeholder', 'Name should be between 3 to 30 characters');
       } else {
           $('#name').css('border-color', 'green');
           $('#name').attr('placeholder', '');

           if (email == null || email == "") {
               alert("Email must be filled out");
               $('#email').focus();
               $('#email').css('border-color', 'red');
               $('#email').attr('placeholder', 'Please enter email');
               return false;
           } else if (!emailRegx.test(email)) {
               alert("Email must be valid");
               $('#email').focus();
               $('#email').css('border-color', 'red');
               $('#email').attr('placeholder', 'Please enter valid email');
               return false;
           } else {
               $('#email').css('border-color', 'green');
               $('#email').attr('placeholder', '');

               if (phone == null || phone == "") {
                   alert("Phone must be filled out");
                   $('#mobile').focus();
                   $('#mobile').css('border-color', 'red');
                   $('#mobile').attr('placeholder', 'Please enter phone');
                   return false;
               } else if (!phoneRegx.test(phone)) {
                   alert("Phone must be valid");
                   $('#mobile').focus();
                   $('#mobile').css('border-color', 'red');
                   $('#mobile').attr('placeholder', 'Please enter valid phone');
                   return false;
               } else {
                   $('#mobile').css('border-color', 'green');
                   $('#mobile').attr('placeholder', '');

                   if (dob == null || dob == "") {
                       alert("Date of birth must be filled out");
                       $('#dob').focus();
                       $('#dob').css('border-color', 'red');
                       $('#dob').attr('placeholder', 'Please enter date of birth');
                       return false;
                   }else if (Date.parse(dob) > Date.parse(today)) {
                       alert("Date of birth must be less than today");
                       $('#dob').focus();
                       $('#dob').css('border-color', 'red');
                       $('#dob').attr('placeholder', 'Please enter valid date of birth');
                       return false;
                   } else {
                       console.log("Inside DOB Pass.");
                       $('#dob').css('border-color', 'green');
                       $('#dob').attr('placeholder', '');

                       $('#propertyRegistrationId').submit();

                   }
               }
           }
       }
    }



</script>
</html>
