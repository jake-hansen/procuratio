<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<jsp:useBean id="newuser" class="com.jakedhansen.procuratio.dto.NewUser">
    <jsp:setProperty name="newuser" property="firstName" param="firstname"/>
    <jsp:setProperty name="newuser" property="lastName" param="lastname"/>
    <jsp:setProperty name="newuser" property="username" param="username"/>
    <jsp:setProperty name="newuser" property="email" param="email"/>
    <jsp:setProperty name="newuser" property="password" param="password"/>
</jsp:useBean>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <c:out value="${newuser.firstName}"/>
    <c:out value="${newuser.lastName}"/>
    <c:out value="${newuser.username}"/>
    <c:out value="${newuser.email}"/>
    <c:out value="${newuser.password}"/>
</body>
</html>
