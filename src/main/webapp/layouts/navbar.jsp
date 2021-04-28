<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <li class="nav-item">
                <a class="nav-link" href="${pageContext.request.contextPath}/register.jsp">Register </a>
            </li>
        </ul>

            <c:if test="${not empty sessionScope.user}">
                <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/logout" method="get">
                    <button class="btn btn-outline-warning my-2 my-sm-0" type="submit">Logout</button>
                </form>
            </c:if>
            <c:if test="${empty sessionScope.user}">
                <form class="form-inline my-2 my-lg-0" action="${pageContext.request.contextPath}/login.jsp" method="get">
                    <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Login</button>
                </form>
            </c:if>
    </div>
</nav>
