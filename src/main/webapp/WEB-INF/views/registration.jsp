<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored="false" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	function myFunc() {
		var selectBox = document.getElementById("roles");
		var selectedValue = selectBox.options[selectBox.selectedIndex].value;
		var x = document.getElementById("skill");
		if (selectedValue == 2 || selectedValue == 3) {
			x.style.display = "none";
		} else {
			x.style.display = "block";
		}
	}
</script>

<html>
 
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>User Registration Form</title>
    <link href="<c:url value='/static/css/bootstrap.css' />" rel="stylesheet"></link>
    <link href="<c:url value='/static/css/app.css' />" rel="stylesheet"></link>
</head>
 
<body>
    <div class="generic-container">
        <%@include file="authheader.jsp" %> 
        <div class="well lead">USER REGISTRATION FORM</div>
        <form:form method="POST" modelAttribute="user" class="form-horizontal">
            <form:input type="hidden" path="id" id="id"/>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="firstName"><h5>FIRST NAME</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="firstName" id="firstName" placeholder="John" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="firstName" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="lastName"><h5>LAST NAME</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="lastName" id="lastName" placeholder="Doe" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="lastName" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="ssoId"><h5>USERNAME</h5></label>
                    <div class="col-md-7">
                        <c:choose>
                            <c:when test="${edit}">
                                <form:input type="text" path="ssoId" id="ssoId" class="form-control input-sm" disabled="true"/>
                            </c:when>
                            <c:otherwise>
                                <form:input type="text" path="ssoId" id="ssoId" placeholder="John.doe" class="form-control input-sm" />
                                <div class="has-error">
                                    <form:errors path="ssoId" class="help-inline"/>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="password"><h5>PASSWORD</h5></label>
                    <div class="col-md-7">
                        <form:input type="password" path="password" id="password" placeholder="Enter Password" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="password" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
     
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="email"><h5>EMAIL</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="email" id="email" placeholder="John.doe@xyz.com" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="email" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="email"><h5>CURRENT EMPLOYER</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="current_emp" id="email" placeholder="ABC Company" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="email" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="email"><h5>CURRENT TITLE</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="current_title" id="email" placeholder="Manager" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="email" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="email"><h5>SESSION ATTENDED</h5></label>
                    <div class="col-md-7">
                        <form:input type="text" path="session" id="email" placeholder="YYYY-MM-DD" class="form-control input-sm" />
                        <div class="has-error">
                            <form:errors path="email" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
             
            <div class="row">
                <div class="form-group col-md-12">
                    <label class="col-md-3 control-lable" for="userProfiles"><h5>ROLES</h5></label>
                    <div class="col-md-7">
                        <form:select path="userProfiles" items="${roles}" multiple="true" itemValue="id" itemLabel="type" class="form-control input-sm" id="roles" onchange="myFunc()" />
                        <div class="has-error">
                            <form:errors path="userProfiles" class="help-inline"/>
                        </div>
                    </div>
                </div>
            </div>
            
            <div class="row">
                <div class="form-group col-md-12" id="skill">
                    <label class="col-md-3 control-lable" for="userCompetencies"><h5>COMPETENCY</h5></label>
                    <div class="col-md-7">
                        <form:select path="userCompetencies" items="${skill}" multiple="true" itemValue="id" itemLabel="description" class="form-control input-sm"/>
                        <div class="has-error">
                            <form:errors path="userCompetencies" class="help-inline"/>
                        </div>
                    </div>
                </div>
			</div>
     
            <div class="row">
                <div class="form-actions floatRight">
                    <c:choose>
                        <c:when test="${edit}">
                            <input type="submit" value="UPDATE" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">CANCEL</a>
                        </c:when>
                        <c:otherwise>
                            <input type="submit" value="REGISTER" class="btn btn-primary btn-sm"/> or <a href="<c:url value='/list' />">CANCEL</a>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </form:form>
    </div>
</body>
</html>