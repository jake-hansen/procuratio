package com.jakedhansen.procuratio.services;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.Credentials;
import com.jakedhansen.procuratio.dto.NewUser;
import org.hibernate.Session;
import com.jakedhansen.procuratio.database.Database;
import org.hibernate.exception.ConstraintViolationException;

import javax.persistence.Query;
import java.util.List;

public class UserService {

    public static class DuplicateUsernameException extends Exception {
        public DuplicateUsernameException(String username) {
            super("username " + username + " already taken");
        }
    }

    public static class IncorrectPasswordException extends Exception {
        public IncorrectPasswordException(String s) {
            super(s);
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

    public static User Login(Credentials credentials) throws IncorrectPasswordException {
        Session session = Database.getSession();

        String hql = "FROM User u where u.username = ?1";

        Query query = session.createQuery(hql);
        query.setParameter(1, credentials.getUsername());
        List<User> userList = query.getResultList();
        User foundUser = userList.get(0);

        boolean valid = PasswordService.checkPassword(credentials.getPassword(), foundUser.getEncryptedPassword());
        if (!valid) {
            throw new IncorrectPasswordException("incorrect password for user " + credentials.getUsername());
        } else {
            return foundUser;
        }
    }
}
