<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="logged_in" value="${not empty sessionScope.user}" scope="page"/>

<nav class="navbar navbar-expand-lg navbar-light bg-light" id="navbar">
    <a class="navbar-brand" href="#">Procuratio</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/index.jsp">Home</a>
            </li>
            <c:if test="${not logged_in}">
                <li class="nav-item">
                    <a class="nav-link" href="${pageContext.request.contextPath}/register.jsp">Register </a>
                </li>
            </c:if>
        </ul>

            <c:if test="${logged_in}">
                <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="get">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Logout</button>
                </form>
            </c:if>
            <c:if test="${not logged_in}">
                <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/login.jsp" method="get">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
                </form>
            </c:if>
    </div>
</nav>
