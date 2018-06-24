<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
 
<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Home</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
 
<body>
    <div class="generic-container">
        <%@include file="authheader.jsp" %> 
        <%@include file="taskheader.jsp" %>  
        <div class="panel panel-default">
              <!-- Default panel contents -->
              
            <div class="panel-heading"><span class="lead">Home Page </span></div>
			<table class="table table-hover">
				<thead>
					<tr>
						<th>This is demo Simple web application<br />It includes the
							following functions:
						</th>

					</tr>
				</thead>
				<tbody>

					<tr>
						<td>Login Storing <br />user information <br /> Skill List
							Create Skill <br />Edit Skill <br /> Delete Skill</td>

					</tr>

				</tbody>
			</table>
		</div>

            <div class="well">
                 Go to <a href="<c:url value='/list' />">Users List</a>
            </div>
    </div>
</body>
</html>