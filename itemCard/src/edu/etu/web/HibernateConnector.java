package edu.etu.web;


import org.hibernate.SessionFactory;

import org.hibernate.cfg.Configuration;

public class HibernateConnector {
    private static final SessionFactory sessionFactory;

    static {
        try {
            sessionFactory = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
            System.out.println("Initial SessionFactory creation succeed.");
        } catch (Throwable ex) {
            System.out.println("Initial SessionFactory creation failed. " + ex);
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

}
