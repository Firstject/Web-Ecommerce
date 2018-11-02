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
import sit.model.OrderDetails;
import sit.model.Orders;
import sit.model.Products;

/**
 *
 * @author Firsty
 */
public class OrderDetailsJpaController implements Serializable {

    public OrderDetailsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(OrderDetails orderDetails) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders detailOrderid = orderDetails.getDetailOrderid();
            if (detailOrderid != null) {
                detailOrderid = em.getReference(detailOrderid.getClass(), detailOrderid.getOrderId());
                orderDetails.setDetailOrderid(detailOrderid);
            }
            Products detailProductid = orderDetails.getDetailProductid();
            if (detailProductid != null) {
                detailProductid = em.getReference(detailProductid.getClass(), detailProductid.getProductId());
                orderDetails.setDetailProductid(detailProductid);
            }
            em.persist(orderDetails);
            if (detailOrderid != null) {
                detailOrderid.getOrderDetailsList().add(orderDetails);
                detailOrderid = em.merge(detailOrderid);
            }
            if (detailProductid != null) {
                detailProductid.getOrderDetailsList().add(orderDetails);
                detailProductid = em.merge(detailProductid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findOrderDetails(orderDetails.getDetailid()) != null) {
                throw new PreexistingEntityException("OrderDetails " + orderDetails + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(OrderDetails orderDetails) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            OrderDetails persistentOrderDetails = em.find(OrderDetails.class, orderDetails.getDetailid());
            Orders detailOrderidOld = persistentOrderDetails.getDetailOrderid();
            Orders detailOrderidNew = orderDetails.getDetailOrderid();
            Products detailProductidOld = persistentOrderDetails.getDetailProductid();
            Products detailProductidNew = orderDetails.getDetailProductid();
            if (detailOrderidNew != null) {
                detailOrderidNew = em.getReference(detailOrderidNew.getClass(), detailOrderidNew.getOrderId());
                orderDetails.setDetailOrderid(detailOrderidNew);
            }
            if (detailProductidNew != null) {
                detailProductidNew = em.getReference(detailProductidNew.getClass(), detailProductidNew.getProductId());
                orderDetails.setDetailProductid(detailProductidNew);
            }
            orderDetails = em.merge(orderDetails);
            if (detailOrderidOld != null && !detailOrderidOld.equals(detailOrderidNew)) {
                detailOrderidOld.getOrderDetailsList().remove(orderDetails);
                detailOrderidOld = em.merge(detailOrderidOld);
            }
            if (detailOrderidNew != null && !detailOrderidNew.equals(detailOrderidOld)) {
                detailOrderidNew.getOrderDetailsList().add(orderDetails);
                detailOrderidNew = em.merge(detailOrderidNew);
            }
            if (detailProductidOld != null && !detailProductidOld.equals(detailProductidNew)) {
                detailProductidOld.getOrderDetailsList().remove(orderDetails);
                detailProductidOld = em.merge(detailProductidOld);
            }
            if (detailProductidNew != null && !detailProductidNew.equals(detailProductidOld)) {
                detailProductidNew.getOrderDetailsList().add(orderDetails);
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
                Integer id = orderDetails.getDetailid();
                if (findOrderDetails(id) == null) {
                    throw new NonexistentEntityException("The orderDetails with id " + id + " no longer exists.");
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
            OrderDetails orderDetails;
            try {
                orderDetails = em.getReference(OrderDetails.class, id);
                orderDetails.getDetailid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orderDetails with id " + id + " no longer exists.", enfe);
            }
            Orders detailOrderid = orderDetails.getDetailOrderid();
            if (detailOrderid != null) {
                detailOrderid.getOrderDetailsList().remove(orderDetails);
                detailOrderid = em.merge(detailOrderid);
            }
            Products detailProductid = orderDetails.getDetailProductid();
            if (detailProductid != null) {
                detailProductid.getOrderDetailsList().remove(orderDetails);
                detailProductid = em.merge(detailProductid);
            }
            em.remove(orderDetails);
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

    public List<OrderDetails> findOrderDetailsEntities() {
        return findOrderDetailsEntities(true, -1, -1);
    }

    public List<OrderDetails> findOrderDetailsEntities(int maxResults, int firstResult) {
        return findOrderDetailsEntities(false, maxResults, firstResult);
    }

    private List<OrderDetails> findOrderDetailsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(OrderDetails.class));
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

    public OrderDetails findOrderDetails(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(OrderDetails.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrderDetailsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<OrderDetails> rt = cq.from(OrderDetails.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
