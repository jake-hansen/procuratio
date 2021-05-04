<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:genericpage title="Home">
    <jsp:attribute name="header">
        <h1 style="text-align: center">
        <c:if test="${not empty sessionScope.user}">
            Welcome, ${sessionScope.user.firstname}.
        </c:if>
        <c:if test="${empty sessionScope.user}">
            Welcome, please login or register.
        </c:if>
        </h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
    </jsp:body>
</t:genericpage>