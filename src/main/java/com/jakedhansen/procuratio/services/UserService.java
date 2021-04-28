package com.jakedhansen.procuratio.services;

import com.jakedhansen.procuratio.domain.User;
import com.jakedhansen.procuratio.dto.Credentials;
import com.jakedhansen.procuratio.dto.NewUser;
import org.hibernate.Session;
import com.jakedhansen.procuratio.database.Database;
import org.hibernate.exception.ConstraintViolationException;

import javax.persistence.PersistenceException;
import javax.persistence.Query;
import java.util.List;

public class UserService {

    public static class DuplicateUsernameException extends Exception {
        public DuplicateUsernameException(String username) {
            super("username " + username + " already taken");
        }
    }

    public static class IncorrectCredentialsException extends Exception {
        public IncorrectCredentialsException(String s) {
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

    public static User Login(Credentials credentials) throws IncorrectCredentialsException {

        try (Session session = Database.getSession()) {
            String hql = "FROM User u where u.username = ?1";
            Query query = session.createQuery(hql);
            query.setParameter(1, credentials.getUsername());
            List<User> userList = query.getResultList();
            User foundUser = userList.get(0);

            boolean valid = PasswordService.checkPassword(credentials.getPassword(), foundUser.getEncryptedPassword());
            if (!valid) {
                throw new IncorrectCredentialsException("incorrect password for user " + credentials.getUsername());
            } else {
                return foundUser;
            }
        } catch (Exception e) {
            throw new IncorrectCredentialsException(e.getMessage());
        }
    }

    public static User Update(User user) throws DuplicateUsernameException {
        Session session = Database.getSession();

        String hql = "UPDATE User u set u.username = ?1, u.firstname = ?2, u.lastname = ?3, u.email = ?4 WHERE u.id" +
                "= ?5";

        Query query = session.createQuery(hql);
        query.setParameter(1, user.getUsername());
        query.setParameter(2, user.getFirstname());
        query.setParameter(3, user.getLastname());
        query.setParameter(4, user.getEmail());
        query.setParameter(5, user.getId());

        try {
            session.getTransaction().begin();
            query.executeUpdate();
            session.getTransaction().commit();
        } catch (PersistenceException e) {
            if (e.getCause().getClass().equals(ConstraintViolationException.class)) {
                ConstraintViolationException c =(ConstraintViolationException) e.getCause();
                if (c.getSQLException().getErrorCode() == 1062) {
                    throw new DuplicateUsernameException(user.getUsername());
                }
            }
            e.printStackTrace();
        } finally {
            session.close();
        }

        return user;
    }

    public static void UpdatePassword(User user, String newPassword) throws PasswordService.PasswordRequirementsNotMetException {
        Session session = Database.getSession();
        String encryptedPassword = PasswordService.hashPassword(newPassword);

        String hql = "UPDATE User u set u.encryptedPassword = ?1 WHERE u.id = ?2";

        Query query = session.createQuery(hql);
        query.setParameter(1, encryptedPassword);
        query.setParameter(2, user.getId());

        try {
            session.getTransaction().begin();
            query.executeUpdate();
            session.getTransaction().commit();
        } finally {
            session.close();
        }
    }
}
