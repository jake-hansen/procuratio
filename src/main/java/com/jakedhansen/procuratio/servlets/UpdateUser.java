package com.jakedhansen.procuratio.servlets;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.Credentials;
import com.jakedhansen.procuratio.services.UserService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.Arrays;

@WebServlet(name = "UpdateUser", value = "/updateuser")
public class UpdateUser extends HttpServlet {
    public enum Status {
        SUCCESSFUL,
        DUPLICATE_USER,
        NAME_NOT_VALID,
        FAILURE
    }

    public static class NameInvalidException extends Exception {
        public NameInvalidException(String name) {
            super("name invalid: " + name);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String email= request.getParameter("email");
        String[] names = name.split("\\s+");
        try {
            validateName(names);
        } catch (NameInvalidException e) {
            session.setAttribute("user_update_status", Status.NAME_NOT_VALID);
            response.sendRedirect("profile.jsp");
            return;
        }

        String firstname = names[0];
        String lastname = names[1];

        try {
            Long userId = ((User) session.getAttribute("user")).getId();
            User user = new User();
            user.setId(userId);

            user.setFirstname(firstname);
            user.setLastname(lastname);
            user.setUsername(username);
            user.setEmail(email);

            User newUser = UserService.Update(user);
            session.setAttribute("user_update_status", Status.SUCCESSFUL);
            session.setAttribute("user", newUser);
            response.sendRedirect("profile.jsp");
        } catch (UserService.DuplicateUsernameException e) {
            session.setAttribute("user_update_status", Status.DUPLICATE_USER);
            response.sendRedirect("profile.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            session.setAttribute("user_update_status", Status.FAILURE);
            response.sendRedirect("profile.jsp");
        }
    }

    private void validateName(String[] names) throws NameInvalidException {
        if (names.length != 2) {
            throw new NameInvalidException(Arrays.toString(names));
        }
    }
}
