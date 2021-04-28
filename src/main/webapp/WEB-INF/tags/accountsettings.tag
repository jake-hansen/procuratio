<%@tag description="Account settings template" pageEncoding="UTF-8"%>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="settings" fragment="true" %>


<t:genericpage title="Your Account">
    <jsp:attribute name="header">
        <link rel="stylesheet" href="styles/myaccount.css" />
    </jsp:attribute>
    <jsp:attribute name="footer">
    </jsp:attribute>
    <jsp:body>
        <div class="container" id="userinfocontainer">
            <div class="row">
                <div class="col-sm-3" id="sidebar">
                    <ul class="list-group">
                        <li class="list-group-item">Account Settings</li>
                        <li class="list-group-item"><a href="profile.jsp">Profile</a></li>
                        <li class="list-group-item"><a href="accountsecurity.jsp">Security</a></li>
                    </ul>
                </div>
                <div class="col-sm" id="content">
                    <jsp:invoke fragment="settings"/>
                </div>
            </div>
        </div>
    </jsp:body>
</t:genericpage>
