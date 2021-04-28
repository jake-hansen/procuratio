<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:accountsettings>
    <jsp:attribute name="settings">
        <h5>My Account</h5>
                    <hr/>
                    <form>
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
                    </form>
    </jsp:attribute>
</t:accountsettings>