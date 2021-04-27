package com.jakedhansen.procuratio.servlets;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.Credentials;
import com.jakedhansen.procuratio.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Login", value = "/login")
public class Login extends HttpServlet {
    public enum Status {
        SUCCESSFUL,
        BAD_PASSWORD,
        FAILURE
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Credentials credentials = new Credentials(username, password);

        HttpSession session = request.getSession();

        try {
            User registeredUser = UserService.Login(credentials);
            session.setAttribute("login_status", Status.SUCCESSFUL);
            session.setAttribute("user", registeredUser);

            response.sendRedirect("index.jsp");
        } catch (UserService.IncorrectPasswordException i) {
            setFailure(session, credentials, Status.BAD_PASSWORD);
            response.sendRedirect("login.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
            setFailure(session, credentials, Status.FAILURE);
            response.sendRedirect("login.jsp");
        }
    }

    private void setFailure(HttpSession session, Credentials credentials, Status status) {
        session.setAttribute("login_status", status);
        session.setAttribute("login_username", credentials.getUsername());
    }
}
