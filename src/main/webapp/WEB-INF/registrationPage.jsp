<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isErrorPage="true" %>    

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register</title>
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css" integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
    		<div class="col-6">
			    <h1>Register!</h1>
			    <form:form method="post" action="/registration" modelAttribute="user">
			        <p>
			            <form:label path="email">Email:</form:label>
			            <form:errors path="email"></form:errors>
			            <form:input path="email"/>
			        </p>
			        <p>
			            <form:label path="password">Password:</form:label>
			            <form:errors path="password"></form:errors>
			            <form:password path="password"/>
			        </p>
			        <p>
			            <form:label path="passwordConfirmation">Password Confirmation:</form:label>
			            <form:errors path="passwordConfirmation"></form:errors>
			            <form:password path="passwordConfirmation"/>
			        </p>
			        <input type="submit" value="Register!"/>
			    </form:form>
   	 		</div>
    	</div>
	</div>
</body>
</html>