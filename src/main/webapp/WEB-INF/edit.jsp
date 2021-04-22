<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true"%>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
	<style><%@include file="/WEB-INF/css/style.css"%></style>
    <title>Evently - EDIT EVENT</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<header>
		<div class="container-fluid">
	    	<div class="row justify-content-between bg-white pl-3 pb-2 pt-2">
	        	<div class="col display-4 text-primary bg-white font-weight-normal">
	            	<a href="/" class="text-decoration-none">evently</a>
	            </div>
	            <div class="col-8 text-dark bg-white pt-2">
	            	<div class="row justify-content-between">
	                	<div class="col-11 pr-2 border-right font-weight-normal text-right">
	                    	Welcome, <c:out value="${user.firstname }"/>
	                  	</div>
	                    <div class="col-1 pl-2 text-right">
	                    	<a href="/logout" class="small link">logout</a>
						</div>
                    </div>
               	</div>
           	</div>
       	</div>
    </header>
	 <div class="container bg-light border border-col mt-3 pt-3">
        <div class="row justify-content-around">
            <div class="col-6">
    			<h4 class="other">Edit Your Event:</h4>
    			<form:form action="/edit/${event.id}" method="post" modelAttribute="event">
    			 <input type="hidden" name="_method" value="put"> 
    				<div class="form-group row">
    					<form:label path="name" class="col-sm-2 col-form-label">Name</form:label>
    					<form:errors path="name" cssClass="messages error pl-3 pt-2"/>
    					<div class="col-sm-10">
    					<form:input path="name" class="form-control"></form:input>
    					</div>
    				</div>
    				<div class="form-group row">
    					<form:label path="date" class="col-sm-2 col-form-label">Date</form:label>
    					<form:errors path="date" cssClass="messages error pl-3 pt-2"/>
    					<div class="col-sm-10">
    					<form:input path="date" class="form-control" type="date"></form:input>
    					</div>
    				</div>
    				<div class="form-group row">
    					<form:label path="city" class="col-sm-2 col-form-label">City</form:label>
    					<form:errors path="city" cssClass="messages error pl-3 pt-2"/>
    					<div class="col-sm-10">
    					<form:input path="city" class="form-control"></form:input>
    					</div>
    				</div>
    				<div class="form-group row">
    					<form:label path="state" class="col-sm-2 col-form-label">State</form:label>
			            <form:errors path="state" cssClass="messages error pl-3 pt-2"/>
			            <div class="col-sm-10">
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
    				</div>
    				<div class="form-group row">
    					<form:input type="hidden" path="host" value="${user.id}"></form:input>
						<div class="col-10 offset-2 d-flex justify-content-start">
							<form:button type="submit" class="btn btn-warning btn-lg mb-4">Submit</form:button>
						</div>
					</div>
				</form:form>
		 	 	<div class="row justify-content-between">
		 	 		<form action="/delete" method="post">
					<input type="hidden" name="_method" value="delete">
					<input type="hidden" name="id" value="${event.id}">
					<button type="submit" class="btn btn-md btn-danger">Delete</button>
					</form>
		 	 		<a class="btn btn-primary btn-ld mb-3" href="/dashboard">Return Home</a>
		 	 	</div>
   	 		</div>
	    </div>
	</div>
</body>
</html>