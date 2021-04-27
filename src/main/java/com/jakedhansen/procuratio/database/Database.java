package com.jakedhansen.procuratio.database;

import com.jakedhansen.procuratio.domain.User;
import org.hibernate.HibernateException;
import org.hibernate.Metamodel;
import org.hibernate.query.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.metamodel.EntityType;

import java.util.Map;

public class Database {
    private static final SessionFactory ourSessionFactory;

    static {
        try {
            Configuration configuration = new Configuration();
            configuration.configure();
            configuration.setProperty("hibernate.connection.url", System.getenv("PROCURATIO_DATABASE_URL"));
            configuration.setProperty("hibernate.connection.username", System.getenv("PROCURATIO_DATABASE_USERNAME"));
            configuration.setProperty("hibernate.connection.password", System.getenv("PROCURATIO_DATABASE_PASSWORD"));
            configuration.addAnnotatedClass(User.class);

            ourSessionFactory = configuration.buildSessionFactory();
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static Session getSession() throws HibernateException {
        return ourSessionFactory.openSession();
    }
}