/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.controller;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import javax.transaction.UserTransaction;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.AccountHistory;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class AccountHistoryJpaController implements Serializable {

    public AccountHistoryJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(AccountHistory accountHistory) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Users historyUserid = accountHistory.getHistoryUserid();
            if (historyUserid != null) {
                historyUserid = em.getReference(historyUserid.getClass(), historyUserid.getUserid());
                accountHistory.setHistoryUserid(historyUserid);
            }
            em.persist(accountHistory);
            if (historyUserid != null) {
                historyUserid.getAccountHistoryList().add(accountHistory);
                historyUserid = em.merge(historyUserid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findAccountHistory(accountHistory.getHistoryid()) != null) {
                throw new PreexistingEntityException("AccountHistory " + accountHistory + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(AccountHistory accountHistory) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            AccountHistory persistentAccountHistory = em.find(AccountHistory.class, accountHistory.getHistoryid());
            Users historyUseridOld = persistentAccountHistory.getHistoryUserid();
            Users historyUseridNew = accountHistory.getHistoryUserid();
            if (historyUseridNew != null) {
                historyUseridNew = em.getReference(historyUseridNew.getClass(), historyUseridNew.getUserid());
                accountHistory.setHistoryUserid(historyUseridNew);
            }
            accountHistory = em.merge(accountHistory);
            if (historyUseridOld != null && !historyUseridOld.equals(historyUseridNew)) {
                historyUseridOld.getAccountHistoryList().remove(accountHistory);
                historyUseridOld = em.merge(historyUseridOld);
            }
            if (historyUseridNew != null && !historyUseridNew.equals(historyUseridOld)) {
                historyUseridNew.getAccountHistoryList().add(accountHistory);
                historyUseridNew = em.merge(historyUseridNew);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                Integer id = accountHistory.getHistoryid();
                if (findAccountHistory(id) == null) {
                    throw new NonexistentEntityException("The accountHistory with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            AccountHistory accountHistory;
            try {
                accountHistory = em.getReference(AccountHistory.class, id);
                accountHistory.getHistoryid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The accountHistory with id " + id + " no longer exists.", enfe);
            }
            Users historyUserid = accountHistory.getHistoryUserid();
            if (historyUserid != null) {
                historyUserid.getAccountHistoryList().remove(accountHistory);
                historyUserid = em.merge(historyUserid);
            }
            em.remove(accountHistory);
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<AccountHistory> findAccountHistoryEntities() {
        return findAccountHistoryEntities(true, -1, -1);
    }

    public List<AccountHistory> findAccountHistoryEntities(int maxResults, int firstResult) {
        return findAccountHistoryEntities(false, maxResults, firstResult);
    }

    private List<AccountHistory> findAccountHistoryEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(AccountHistory.class));
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

    public AccountHistory findAccountHistory(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(AccountHistory.class, id);
        } finally {
            em.close();
        }
    }
    
    public List<AccountHistory> findAccountUserid(Users user) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("AccountHistory.findByHistoryUserid");
            query.setParameter("historyUserid", user);
            return query.getResultList();
        } catch (Exception e) {
            
        } finally {
            em.close();
        }
        return null;
    }

    public int getAccountHistoryCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<AccountHistory> rt = cq.from(AccountHistory.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
