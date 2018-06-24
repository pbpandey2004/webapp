<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page isELIgnored="false" %>

 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Search</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
 
<body>


	<div class="generic-container">
		<%@include file="authheader.jsp"%>
		<%@include file="taskheader.jsp"%>

		<div class="well lead">USER SEARCH</div>

		<form:form method="POST" modelAttribute="userSearch"
			class="form-horizontal">

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3 control-lable" for="searchText"
						path="searchText"><h5>FIRST/LAST NAME:</h5></label>
					<div class="col-md-7">
						<form:input type="text" path="searchText" id="searchText"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="searchText" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			<h1 align="center">OR</h1>
			</br>
			</br>

			<div class="row">
				<div class="form-group col-md-12" id="skill">
					<label class="col-md-3 control-lable" path="competency"
						for="competency"><h5>COMPETENCY:</h5></label>
					<div class="col-md-7">
						<form:select path="competency" items="${skill}" multiple="true"
							itemValue="id" itemLabel="description"
							class="form-control input-sm" />
						<div class="has-error">
							<form:errors path="competency" class="help-inline" />
						</div>
					</div>
				</div>
			</div>

			</br></br>

			<div class="row">
				<div class="form-actions floatRight">
					<input type="submit" value="SEARCH" class="btn btn-primary btn-sm" />
					or <a href="<c:url value='/list' />">CANCEL</a>
				</div>
			</div>
		</form:form>
	</div>


</body>
</html>