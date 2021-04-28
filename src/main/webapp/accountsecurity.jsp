<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:accountsettings>
    <jsp:attribute name="settings">
        <h5>Account Security</h5>
                    <hr/>
                    <form action="${pageContext.request.contextPath}/updatepassword" method="post">
                        <h6>New Password</h6>
                        <input class="form-control" type="password" id="password" name="password"/>
                        <br/>
                        <button type="submit" class="btn btn-outline-success">Update Password</button>
                        <c:if test="${not empty sessionScope.password_reset_status}">
                            <c:if test="${sessionScope.password_reset_status eq 'SUCCESSFUL'}">
                                <p class="text-success">Successfully updated password</p>
                            </c:if>
                            <c:if test="${sessionScope.password_reset_status eq 'FAILURE'}">
                                <p class="text-danger">Failed to update password</p>
                            </c:if>
                            <c:if test="${sessionScope.password_reset_status eq 'PASSWORD_REQUIREMENTS_FAILURE'}">
                                <p class="text-warning">Password requirements not met</p>
                            </c:if>
                            <c:remove var="password_reset_status" scope="session"/>
                        </c:if>
                    </form>
    </jsp:attribute>
</t:accountsettings>