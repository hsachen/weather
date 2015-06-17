/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.base;

import org.hibernate.cfg.Configuration;
import org.hibernate.SessionFactory;
import org.hibernate.boot.registry.StandardServiceRegistry;
import org.hibernate.boot.registry.StandardServiceRegistryBuilder;

public class HibernateUtil { 

    private static final SessionFactory sessionFactoryHist;
    private static final StandardServiceRegistry serviceRegistryHist;
    
   private static final SessionFactory sessionFactory;
    private static final StandardServiceRegistry serviceRegistry;

    static {
        try {
            Configuration configurationHist = new Configuration();
            configurationHist.configure("hist.cfg.xml");
            serviceRegistryHist = new StandardServiceRegistryBuilder().applySettings(configurationHist.getProperties()).build();
            sessionFactoryHist = configurationHist.buildSessionFactory(serviceRegistryHist);
            
             Configuration configuration = new Configuration();
            configuration.configure("db.cfg.xml");
            serviceRegistry = new StandardServiceRegistryBuilder().applySettings(configuration.getProperties()).build();
            sessionFactory = configuration.buildSessionFactory(serviceRegistry);
        } catch (Throwable ex) {
            throw new ExceptionInInitializerError(ex);
        }
    }

    public static SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public static void closeAllResources() {
        sessionFactory.close();
        StandardServiceRegistryBuilder.destroy(serviceRegistry);
    }
    
      public static SessionFactory getSessionFactoryHist() {
        return sessionFactoryHist;
    }

    public static void closeAllResourcesHist() {
        sessionFactoryHist.close();
        StandardServiceRegistryBuilder.destroy(serviceRegistry);
    }
}
