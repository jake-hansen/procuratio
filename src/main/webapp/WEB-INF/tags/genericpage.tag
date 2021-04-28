<%@tag description="Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<%@attribute name="title" required="true" %>
<html>
<head>
    <title>${title}</title>
    <script src="https://unpkg.com/bootstrap-darkmode@0.7.0/dist/theme.js"></script>
    <link rel="stylesheet" href="styles/main.css" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

    <script async src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script async src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script async src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://unpkg.com/bootstrap-darkmode@0.7.0/dist/darktheme.css"/>

    <jsp:include page="/layouts/navbar.jsp" />
</head>
<body>
<script>
    const themeConfig = new ThemeConfig();
    themeConfig.initTheme();

    const theme = window.matchMedia("(prefers-color-scheme: dark)");
    if (theme.matches) {
        document.getElementById("navbar").classList.add("bg-dark")
        document.getElementById("navbar").classList.add("navbar-dark")
    } else {
        document.getElementById("navbar").classList.add("bg-light")
        document.getElementById("navbar").classList.add("navbar-light")
    }
    theme.addEventListener("change", (e) => {
        if (e.matches) {
            themeConfig.setTheme('dark');
            document.getElementById("navbar").classList.replace("bg-light", "bg-dark");
            document.getElementById("navbar").classList.replace("navbar-light", "navbar-dark")
        } else {
            themeConfig.setTheme('light');
            document.getElementById("navbar").classList.replace("bg-dark", "bg-light");
            document.getElementById("navbar").classList.replace("navbar-dark", "navbar-light")
        }
    });
</script>
<div class="container" id="main-container">
    <div class="row">
        <div class="column-sm" id="header-row">
            <div class="container-row" id="pageheader">
                <jsp:invoke fragment="header"/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="column-sm" id="body-row">
            <div class="container-row" id="body">
                <jsp:doBody/>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="column-sm" id="footer-row">
            <div class="container-row" id="pagefooter">
                <jsp:invoke fragment="footer"/>
            </div>
        </div>
    </div>
</div>

</body>
</html>
