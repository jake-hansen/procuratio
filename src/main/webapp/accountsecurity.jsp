<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<t:accountsettings>
    <jsp:attribute name="settings">
        <h5>Account Security</h5>
                    <hr/>
                    <form>
                        <h6>New Password</h6>
                        <input class="form-control" type="password" id="password" name="password"/>
                        <br/>
                        <button type="submit" class="btn btn-outline-success">Update Password</button>
                    </form>
    </jsp:attribute>
</t:accountsettings>