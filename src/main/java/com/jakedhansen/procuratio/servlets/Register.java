package com.jakedhansen.procuratio.servlets;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.NewUser;
import com.jakedhansen.procuratio.services.PasswordService;
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
        PASSWORD_REQUIREMENTS,
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
            setSuccess(session);

            response.sendRedirect("register.jsp");
        } catch (UserService.DuplicateUsernameException e) {
            setFailure(session, newUser, Status.DUPLICATE_USER);
            response.sendRedirect("register.jsp");
        } catch (PasswordService.PasswordRequirementsNotMetException p) {
            setFailure(session, newUser, Status.PASSWORD_REQUIREMENTS);
            response.sendRedirect("register.jsp");
        }
        catch (Exception e) {
            e.printStackTrace();
            setFailure(session, newUser, Status.FAILURE);
            response.sendRedirect("register.jsp");
        }

    }

    private void setFailure(HttpSession session, NewUser newUser, Status status) {
        session.setAttribute("register_status", status);
        session.setAttribute("register_firstname", newUser.getFirstName());
        session.setAttribute("register_lastname", newUser.getLastName());
        session.setAttribute("register_username", newUser.getUsername());
        session.setAttribute("register_email", newUser.getEmail());
    }

    private void setSuccess(HttpSession session) {
        session.setAttribute("register_status", Status.SUCCESSFUL);
        session.removeAttribute("register_firstname");
        session.removeAttribute("register_lastname");
        session.removeAttribute("register_username");
        session.removeAttribute("register_email");
    }
}
