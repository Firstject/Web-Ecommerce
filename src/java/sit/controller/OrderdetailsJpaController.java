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
import sit.model.Orderdetails;
import sit.model.Orders;
import sit.model.Products;

/**
 *
 * @author Firsty
 */
public class OrderdetailsJpaController implements Serializable {

    public OrderdetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Orderdetails orderdetails) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders detailOrderid = orderdetails.getDetailOrderid();
            if (detailOrderid != null) {
                detailOrderid = em.getReference(detailOrderid.getClass(), detailOrderid.getOrderId());
                orderdetails.setDetailOrderid(detailOrderid);
            }
            Products detailProductid = orderdetails.getDetailProductid();
            if (detailProductid != null) {
                detailProductid = em.getReference(detailProductid.getClass(), detailProductid.getProductId());
                orderdetails.setDetailProductid(detailProductid);
            }
            em.persist(orderdetails);
            if (detailOrderid != null) {
                detailOrderid.getOrderdetailsList().add(orderdetails);
                detailOrderid = em.merge(detailOrderid);
            }
            if (detailProductid != null) {
                detailProductid.getOrderdetailsList().add(orderdetails);
                detailProductid = em.merge(detailProductid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findOrderdetails(orderdetails.getDetailid()) != null) {
                throw new PreexistingEntityException("Orderdetails " + orderdetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Orderdetails orderdetails) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orderdetails persistentOrderdetails = em.find(Orderdetails.class, orderdetails.getDetailid());
            Orders detailOrderidOld = persistentOrderdetails.getDetailOrderid();
            Orders detailOrderidNew = orderdetails.getDetailOrderid();
            Products detailProductidOld = persistentOrderdetails.getDetailProductid();
            Products detailProductidNew = orderdetails.getDetailProductid();
            if (detailOrderidNew != null) {
                detailOrderidNew = em.getReference(detailOrderidNew.getClass(), detailOrderidNew.getOrderId());
                orderdetails.setDetailOrderid(detailOrderidNew);
            }
            if (detailProductidNew != null) {
                detailProductidNew = em.getReference(detailProductidNew.getClass(), detailProductidNew.getProductId());
                orderdetails.setDetailProductid(detailProductidNew);
            }
            orderdetails = em.merge(orderdetails);
            if (detailOrderidOld != null && !detailOrderidOld.equals(detailOrderidNew)) {
                detailOrderidOld.getOrderdetailsList().remove(orderdetails);
                detailOrderidOld = em.merge(detailOrderidOld);
            }
            if (detailOrderidNew != null && !detailOrderidNew.equals(detailOrderidOld)) {
                detailOrderidNew.getOrderdetailsList().add(orderdetails);
                detailOrderidNew = em.merge(detailOrderidNew);
            }
            if (detailProductidOld != null && !detailProductidOld.equals(detailProductidNew)) {
                detailProductidOld.getOrderdetailsList().remove(orderdetails);
                detailProductidOld = em.merge(detailProductidOld);
            }
            if (detailProductidNew != null && !detailProductidNew.equals(detailProductidOld)) {
                detailProductidNew.getOrderdetailsList().add(orderdetails);
                detailProductidNew = em.merge(detailProductidNew);
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
                Integer id = orderdetails.getDetailid();
                if (findOrderdetails(id) == null) {
                    throw new NonexistentEntityException("The orderdetails with id " + id + " no longer exists.");
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
            Orderdetails orderdetails;
            try {
                orderdetails = em.getReference(Orderdetails.class, id);
                orderdetails.getDetailid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orderdetails with id " + id + " no longer exists.", enfe);
            }
            Orders detailOrderid = orderdetails.getDetailOrderid();
            if (detailOrderid != null) {
                detailOrderid.getOrderdetailsList().remove(orderdetails);
                detailOrderid = em.merge(detailOrderid);
            }
            Products detailProductid = orderdetails.getDetailProductid();
            if (detailProductid != null) {
                detailProductid.getOrderdetailsList().remove(orderdetails);
                detailProductid = em.merge(detailProductid);
            }
            em.remove(orderdetails);
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

    public List<Orderdetails> findOrderdetailsEntities() {
        return findOrderdetailsEntities(true, -1, -1);
    }

    public List<Orderdetails> findOrderdetailsEntities(int maxResults, int firstResult) {
        return findOrderdetailsEntities(false, maxResults, firstResult);
    }

    private List<Orderdetails> findOrderdetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Orderdetails.class));
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

    public Orderdetails findOrderdetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Orderdetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrderdetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Orderdetails> rt = cq.from(Orderdetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
