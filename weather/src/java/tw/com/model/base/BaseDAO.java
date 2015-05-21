/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.base;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Session;

import tw.com.model.dao.exceptions.PreexistingEntityException;

/**
 *
 * @author Z00907
 */
public class BaseDAO<T> {

    private String msg = "";

    public String getMessage() {
        return msg;
    }

    public void create(T object) throws PreexistingEntityException, Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction(); //開啟交易
            session.persist(object); //將物件儲存資料庫
            session.getTransaction().commit(); //傳送交易
            msg = "新增成功";
        } catch (Exception ex) {
            session.getTransaction().rollback();
            msg = "新增失敗";
        } finally {
            session.close();
        }
    }

    public void update(T object) throws PreexistingEntityException, Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction(); //開啟交易
            session.update(object); //將物件儲存資料庫
            session.getTransaction().commit(); //傳送交易

        } catch (Exception ex) {
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }

    public void delete(T object) throws PreexistingEntityException, Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction(); //開啟交易
            session.delete(object); //將物件儲存資料庫
            session.getTransaction().commit(); //傳送交易

        } catch (Exception ex) {
            session.getTransaction().rollback();
        } finally {
            session.close();
        }
    }

    public T find(Class<? extends T> clazz, Serializable id) throws PreexistingEntityException, Exception {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction(); //開啟交易
            return (T) session.get(clazz, id);

        } finally {
            session.getTransaction().commit();
            session.close();
        }
    }

    @SuppressWarnings("unchecked")
    public List<T> list(String hql) {
        Session session = HibernateUtil.getSessionFactory().openSession();
        try {
            session.beginTransaction(); //開啟交易
            return session.createQuery(hql).list();

        } finally {
            session.getTransaction().commit();
            session.close();
        }
    }
}
