/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tw.com.model.entity;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import tw.com.model.entity.exceptions.NonexistentEntityException;
import tw.com.model.entity.exceptions.PreexistingEntityException;

/**
 *
 * @author Z00907
 */
public class AccountTblJpaController implements Serializable {

    public AccountTblJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AccountTbl accountTbl) throws PreexistingEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(accountTbl);
            em.getTransaction().commit();
        } catch (Exception ex) {
            if (findAccountTbl(accountTbl.getUserId()) != null) {
                throw new PreexistingEntityException("AccountTbl " + accountTbl + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AccountTbl accountTbl) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            accountTbl = em.merge(accountTbl);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                String id = accountTbl.getUserId();
                if (findAccountTbl(id) == null) {
                    throw new NonexistentEntityException("The accountTbl with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(String id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            AccountTbl accountTbl;
            try {
                accountTbl = em.getReference(AccountTbl.class, id);
                accountTbl.getUserId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accountTbl with id " + id + " no longer exists.", enfe);
            }
            em.remove(accountTbl);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AccountTbl> findAccountTblEntities() {
        return findAccountTblEntities(true, -1, -1);
    }

    public List<AccountTbl> findAccountTblEntities(int maxResults, int firstResult) {
        return findAccountTblEntities(false, maxResults, firstResult);
    }

    private List<AccountTbl> findAccountTblEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AccountTbl.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public AccountTbl findAccountTbl(String id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AccountTbl.class, id);
        } finally {
            em.close();
        }
    }

    public int getAccountTblCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AccountTbl> rt = cq.from(AccountTbl.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
