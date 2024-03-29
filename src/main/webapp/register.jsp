<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<c:if test="${not empty sessionScope.user}">
    <c:redirect url="index.jsp"/>
</c:if>

<t:genericpage title="Register">
    <jsp:attribute name="header">
        <link rel="stylesheet" href="styles/register.css" />
        <h1 style="text-align: center">Register</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <form id="registerform" action="register" method="post">
            <div class="row">
                <div class = "col">
                    <label for="firstname" class="form-label">First Name</label>
                    <input type="text" class="form-control" id="firstname" name="firstname" required value="<c:out value="${sessionScope.register_firstname}"/>"/>
                </div>
                <div class = "col">
                    <label for="lastname" class="form-label">Last Name</label>
                    <input type="text" class="form-control" id="lastname" name="lastname" required value="<c:out value="${sessionScope.register_lastname}"/>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" required value="<c:out value="${sessionScope.register_username}"/>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="email" class="form-label">Email address</label>
                    <input type="email" class="form-control" id="email" name="email" required value="<c:out value="${sessionScope.register_email}"/>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" required name="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}">
                    <small id="emailHelp" class="form-text text-muted">Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters</small>
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                    <c:if test="${not empty sessionScope.register_status}">
                        <c:if test="${sessionScope.register_status eq 'SUCCESSFUL'}">
                            <p class="text-success">Successfully registered</p>
                        </c:if>
                        <c:if test="${sessionScope.register_status eq 'FAILURE'}">
                            <p class="text-danger">Failed to register</p>
                        </c:if>
                        <c:if test="${sessionScope.register_status eq 'DUPLICATE_USER'}">
                            <p class="text-warning">Username already taken</p>
                        </c:if>
                        <c:if test="${sessionScope.register_status eq 'PASSWORD_REQUIREMENTS'}">
                            <p class="text-warning">Password requirements not met</p>
                        </c:if>
                        <c:remove var="register_status" scope="session"/>
                    </c:if>
                </div>
            </div>
        </form>

    </jsp:body>
</t:genericpage>