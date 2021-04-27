package com.jakedhansen.procuratio.services;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.Credentials;
import com.jakedhansen.procuratio.dto.NewUser;
import org.hibernate.Session;
import com.jakedhansen.procuratio.database.Database;
import org.hibernate.exception.ConstraintViolationException;

public class UserService {

    public static class DuplicateUsernameException extends Exception {
        DuplicateUsernameException(String username) {
            super("username " + username + " already taken");
        }
    }

    public static User Register(NewUser user) throws DuplicateUsernameException, PasswordService.PasswordRequirementsNotMetException {
        Session session = Database.getSession();

        User saveUser = new User();
        saveUser.setFirstname(user.getFirstName());
        saveUser.setLastname(user.getLastName());
        saveUser.setUsername(user.getUsername());
        saveUser.setEmail(user.getEmail());
        saveUser.setEncryptedPassword(PasswordService.hashPassword(user.getPassword()));

        try {
            session.getTransaction().begin();
            session.save(saveUser);
            session.getTransaction().commit();
        } catch (ConstraintViolationException e) {
            if (e.getSQLException().getErrorCode() == 1062) {
                throw new DuplicateUsernameException(user.getUsername());
            }
        } finally {
            session.close();
        }

        return saveUser;
    }

    public static User Login(Credentials credentials) throws Exception {
        throw new RuntimeException();
    }
}
