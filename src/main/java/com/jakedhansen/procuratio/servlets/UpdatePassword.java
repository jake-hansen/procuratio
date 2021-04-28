package com.jakedhansen.procuratio.servlets;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.services.PasswordService;
import com.jakedhansen.procuratio.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "UpdatePassword", value = "/updatepassword")
public class UpdatePassword extends HttpServlet {
    public enum Status {
        SUCCESSFUL,
        PASSWORD_REQUIREMENTS_FAILURE,
        FAILURE
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String newPassword = request.getParameter("password");
        User user = (User) session.getAttribute("user");

        try {
            UserService.UpdatePassword(user, newPassword);
            session.setAttribute("password_reset_status", Status.SUCCESSFUL);
        } catch (PasswordService.PasswordRequirementsNotMetException p) {
            session.setAttribute("password_reset_status", Status.PASSWORD_REQUIREMENTS_FAILURE);
        } catch (Exception e) {
            session.setAttribute("password_reset_status", Status.FAILURE);
        } finally {
            response.sendRedirect("accountsecurity.jsp");
        }
    }
}
