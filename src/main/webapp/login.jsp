<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:genericpage title="Login">
    <jsp:attribute name="header">
        <link rel="stylesheet" href="styles/login.css" />
        <h1 style="text-align: center">Login</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <form id="loginform" action="login" method="post">
            <div class="row">
                <div class="col">
                    <label for="username" class="form-label">Username</label>
                    <input type="text" class="form-control" id="username" name="username" value="<c:out value="${sessionScope.login_username}"/>">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <label for="password" class="form-label">Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                </div>
            </div>
            <div class="row">
                <div class="col">
                    <button type="submit" class="btn btn-primary" id="submit">Submit</button>
                    <c:if test="${not empty sessionScope.login_status}">
                        <c:if test="${sessionScope.login_status eq 'FAILURE'}">
                            <p class="text-danger">Failed to login</p>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </form>

    </jsp:body>
</t:genericpage>