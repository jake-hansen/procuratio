<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:accountsettings>
    <jsp:attribute name="settings">
        <h5>My Account</h5>
                    <hr/>
                    <form action="${pageContext.request.contextPath}/updateuser" method="post">
                        <h6>Name</h6>
                        <input class="form-control" type="text" id="name" name="name" value="${sessionScope.user.firstname} ${sessionScope.user.lastname}"/>
                        <br/>
                        <h6>Username</h6>
                        <input class="form-control" type="text" id="username" name="username" value="${sessionScope.user.username}"/>
                        <br/>
                        <h6>Email</h6>
                        <input class="form-control" type="email" id="email" name="email" value="${sessionScope.user.email}"/>
                        <br/>
                        <button type="submit" class="btn btn-outline-success">Save Changes</button>
                        <c:if test="${not empty sessionScope.user_update_status}">
                            <c:if test="${sessionScope.user_update_status eq 'SUCCESSFUL'}">
                                <p class="text-success">Successfully updated profile</p>
                            </c:if>
                            <c:if test="${sessionScope.user_update_status eq 'FAILURE'}">
                                <p class="text-danger">Failed to update profile</p>
                            </c:if>
                            <c:if test="${sessionScope.user_update_status eq 'DUPLICATE_USER'}">
                                <p class="text-warning">Username already taken</p>
                            </c:if>
                            <c:if test="${sessionScope.user_update_status eq 'NAME_NOT_VALID'}">
                                <p class="text-warning">Name must be a valid first and lastname</p>
                            </c:if>
                            <c:remove var="user_update_status" scope="session"/>
                        </c:if>
                    </form>
    </jsp:attribute>
</t:accountsettings>