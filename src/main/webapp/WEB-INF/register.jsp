<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style><%@include file="/WEB-INF/css/style.css"%></style>
    <title>Evently - REGISTER</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<header>
        <div class="container-fluid">
            <div class="row justify-content-center bg-white pl-3 pb-2 pt-2">
            	<div class="col display-4 text-primary bg-white font-weight-normal">
                	<a href="/" class="text-decoration-none">evently</a>
                </div>
            </div>
        </div>
    </header>
	<div class="container">
		<div class="row justify-content-center bg-light border border-col mt-2 pb-3 pt-3">
    		<div class="col-6">
			    <h1>REGISTER</h1>
			    <form:form method="post" action="/register" modelAttribute="user" class="form-group border-top">
			        <div class="form-group ">
			            <form:label path="firstname" class="pt-2">First Name</form:label>
			            <form:errors path="firstname" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:input path="firstname" class="form-control create-post"/>
			        </div>
			        <div class="form-group ">
			            <form:label path="lastname">Last Name</form:label>
			            <form:errors path="lastname" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:input path="lastname" class="form-control create-post"/>
			        </div>
			        <div class="form-group ">
			            <form:label path="city">City:</form:label>
			            <form:errors path="city" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:input path="city" class="form-control create-post"/>
			        </div>
			        <div class="form-group ">
			            <form:label path="state">State:</form:label>
			            <form:errors path="state" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:select class="form-control" path="state">
							<form:option value="">--Select--</form:option>
							<form:option value="AK">Alaska</form:option>
							<form:option value="AL">Alabama</form:option>
							<form:option value="AR">Arkansas</form:option>
							<form:option value="AZ">Arizona</form:option>
							<form:option value="CA">California</form:option>
							<form:option value="CO">Colorado</form:option>
							<form:option value="CT">Connecticut</form:option>
							<form:option value="DC">District of Columbia</form:option>
							<form:option value="DE">Delaware</form:option>
							<form:option value="FL">Florida</form:option>
							<form:option value="GA">Georgia</form:option>
							<form:option value="HI">Hawaii</form:option>
							<form:option value="IA">Iowa</form:option>
							<form:option value="ID">Idaho</form:option>
							<form:option value="IL">Illinois</form:option>
							<form:option value="IN">Indiana</form:option>
							<form:option value="KS">Kansas</form:option>
							<form:option value="KY">Kentucky</form:option>
							<form:option value="LA">Louisiana</form:option>
							<form:option value="MA">Massachusetts</form:option>
							<form:option value="MD">Maryland</form:option>
							<form:option value="ME">Maine</form:option>
							<form:option value="MI">Michigan</form:option>
							<form:option value="MN">Minnesota</form:option>
							<form:option value="MO">Missouri</form:option>
							<form:option value="MS">Mississippi</form:option>
							<form:option value="MT">Montana</form:option>
							<form:option value="NC">North Carolina</form:option>
							<form:option value="ND">North Dakota</form:option>
							<form:option value="NE">Nebraska</form:option>
							<form:option value="NH">New Hampshire</form:option>
							<form:option value="NJ">New Jersey</form:option>
							<form:option value="NM">New Mexico</form:option>
							<form:option value="NV">Nevada</form:option>
							<form:option value="NY">New York</form:option>
							<form:option value="OH">Ohio</form:option>
							<form:option value="OK">Oklahoma</form:option>
							<form:option value="OR">Oregon</form:option>
							<form:option value="PA">Pennsylvania</form:option>
							<form:option value="PR">Puerto Rico</form:option>
							<form:option value="RI">Rhode Island</form:option>
							<form:option value="SC">South Carolina</form:option>
							<form:option value="SD">South Dakota</form:option>
							<form:option value="TN">Tennessee</form:option>
							<form:option value="TX">Texas</form:option>
							<form:option value="UT">Utah</form:option>
							<form:option value="VA">Virginia</form:option>
							<form:option value="VT">Vermont</form:option>
							<form:option value="WA">Washington</form:option>
							<form:option value="WI">Wisconsin</form:option>
							<form:option value="WV">West Virginia</form:option>
							<form:option value="WY">Wyoming</form:option>
						</form:select>
			        </div>
			        <div class="form-group ">
			            <form:label path="email">Email</form:label>
			            <form:errors path="email" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:input path="email" class="form-control create-post"/>
			        </div>
			        <div class="form-group ">
			            <form:label path="password">Password</form:label>
			            <form:errors path="password" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:password path="password" class="form-control create-post"/>
			        </div>
			        <div class="form-group ">
			            <form:label path="passwordConfirmation">Confirm Password</form:label>
			            <form:errors path="passwordConfirmation" cssClass="messages error pl-3 pt-2"></form:errors>
			            <form:password path="passwordConfirmation" class="form-control create-post"/>
			        </div>
			        <form:button type="submit" class="btn btn-primary">Register</form:button>
			    </form:form>
   	 		</div>
    	</div>
	</div>
</body>
</html>