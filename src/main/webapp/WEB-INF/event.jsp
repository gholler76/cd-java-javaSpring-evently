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
    <title>Evently - EVENTS</title>
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
	 	<div class="row">
	 		<c:if test="${event.host.id == user.id}">
	   			<div class="row justify-content-end">
	   				<div class="col-6 d-flex justify-content-end">
	   					<a type="button" class="btn btn-sm btn-warning" href="/edit/${event.id}">Edit</a>
	   				</div>
	   				<div class="col-6 d-flex justify-content-start">
	   					<form action="/delete" method="post">
	   						<input type="hidden" name="id" value="${event.id}">
	   						<input type="hidden" name="_method" value="delete">
	   						<button type="submit" class="btn btn-sm btn-danger">Delete</button>
	   					</form>
	   				</div>
	   			</div>
	   		</c:if>
	 	</div>
        <div class="row justify-content-around">
            <div class="col-5">
    			<h1>${event.name}</h1>
    			<table class="table table-sm">
					<tbody>
						<tr>
						<th scope="row">Host:</th>
						<td>${event.host.firstname} ${event.host.lastname}</td>						
						</tr>
						<tr>
						<th scope="row">Date:</th>
						<td><fmt:formatDate value="${event.date}"/></td>						
						</tr>
						<tr>
						<th scope="row">City:</th>
						<td>${event.city}</td>
						</tr>
						<tr>
						<th scope="row">Number of Attendees:</th>
						<td>${fn:length(event.guests)}</td>
						</tr>
					</tbody>
				</table>
				<table class="table">
					<thead class="thead-light">
						<th>Name</th>
						<th>City</th>
					</thead>
					<tbody>
						<c:forEach var="guest" items="${event.guests}">
						<tr>
							<td>${guest.firstname} ${guest.lastname}</td>
							<td>${guest.city}</td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row mb-4">
					<c:choose>
						<c:when test="${event.guests.contains(user)}">
						   	You joined | <a class="btn btn-sm btn-dark" href="/event/cancel/${event.id}">Cancel</a>
						</c:when>
						<c:otherwise>
							<a class="btn btn-sm btn-success" href="/event/join/${event.id}">Join</a>						    			
						</c:otherwise>
					</c:choose>
				</div>
   	 		</div>
            <div class="col-5">
  				<a class="btn btn-primary btn-block mb-3" href="/dashboard">Return Home</a>
    			<table class="table">
    				<thead class="thead-dark">
    					<tr>
    						<th>MESSAGE BOARD</th>
    						<th></th>
    					</tr>
    				</thead>
					<tbody class="message-box">
						<c:forEach var="comment" items="${comments}">
						<tr>
							<c:if test="${comment.event.id == event.id}">
							<th scope="row">${comment.user.firstname} ${comment.user.lastname}</th>
							<td>${comment.content}</td>	
							</c:if>
						</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="/event/post/${event.id}" method="post">
					<form:errors path="content" value="${error}" cssClass="messages error pl-3 pt-2"/>
					<textarea name="content" class="form-control mb-2 "></textarea>
					<button type="submit" class="btn-success btn-lg">Post a Comment</button>
					<input type="hidden" name="event_id" value="${event.id}">
					<input type="hidden" name="user_id" value="${user.id}">
				</form>
			</div>
		</div>
	</div>
</body>
</html>