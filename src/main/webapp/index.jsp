<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<t:genericpage title="Home">
    <jsp:attribute name="header">
        <h1 style="text-align: center"> Welcome, {username}</h1>
    </jsp:attribute>
    <jsp:attribute name="footer">
        <p>footer</p>
    </jsp:attribute>
    <jsp:body>
        <p>body</p>
    </jsp:body>
</t:genericpage>