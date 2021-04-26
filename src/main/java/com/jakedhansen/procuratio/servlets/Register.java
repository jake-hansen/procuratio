package com.jakedhansen.procuratio.servlets;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.NewUser;
import com.jakedhansen.procuratio.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "Register", value = "/register")
public class Register extends HttpServlet {
    public enum Status {
        SUCCESSFUL,
        DUPLICATE_USER,
        FAILURE
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String firstname = request.getParameter("firstname");
        String lastname = request.getParameter("lastname");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        NewUser newUser = new NewUser(firstname, lastname, username, email, password);

        HttpSession session = request.getSession();

        try {
            User registeredUser = UserService.Register(newUser);
            session.setAttribute("register_status", Status.SUCCESSFUL);

            response.sendRedirect("register.jsp");
        } catch (Exception e) {
            session.setAttribute("register_status", Status.FAILURE);
            session.setAttribute("register_firstname", newUser.getFirstName());
            session.setAttribute("register_lastname", newUser.getLastName());
            session.setAttribute("register_username", newUser.getUsername());
            session.setAttribute("register_email", newUser.getEmail());

            response.sendRedirect("register.jsp");
        }

    }
}
