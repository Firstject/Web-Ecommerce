/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sit.controller;

import java.io.Serializable;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import sit.model.Users;
import sit.model.Orderdetails;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import sit.controller.exceptions.IllegalOrphanException;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.Orders;

/**
 *
 * @author Firsty
 */
public class OrdersJpaController implements Serializable {

    public OrdersJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Orders orders) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (orders.getOrderdetailsList() == null) {
            orders.setOrderdetailsList(new ArrayList<Orderdetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Users orderUserid = orders.getOrderUserid();
            if (orderUserid != null) {
                orderUserid = em.getReference(orderUserid.getClass(), orderUserid.getUserid());
                orders.setOrderUserid(orderUserid);
            }
            List<Orderdetails> attachedOrderdetailsList = new ArrayList<Orderdetails>();
            for (Orderdetails orderdetailsListOrderdetailsToAttach : orders.getOrderdetailsList()) {
                orderdetailsListOrderdetailsToAttach = em.getReference(orderdetailsListOrderdetailsToAttach.getClass(), orderdetailsListOrderdetailsToAttach.getDetailid());
                attachedOrderdetailsList.add(orderdetailsListOrderdetailsToAttach);
            }
            orders.setOrderdetailsList(attachedOrderdetailsList);
            em.persist(orders);
            if (orderUserid != null) {
                orderUserid.getOrdersList().add(orders);
                orderUserid = em.merge(orderUserid);
            }
            for (Orderdetails orderdetailsListOrderdetails : orders.getOrderdetailsList()) {
                Orders oldDetailOrderidOfOrderdetailsListOrderdetails = orderdetailsListOrderdetails.getDetailOrderid();
                orderdetailsListOrderdetails.setDetailOrderid(orders);
                orderdetailsListOrderdetails = em.merge(orderdetailsListOrderdetails);
                if (oldDetailOrderidOfOrderdetailsListOrderdetails != null) {
                    oldDetailOrderidOfOrderdetailsListOrderdetails.getOrderdetailsList().remove(orderdetailsListOrderdetails);
                    oldDetailOrderidOfOrderdetailsListOrderdetails = em.merge(oldDetailOrderidOfOrderdetailsListOrderdetails);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findOrders(orders.getOrderId()) != null) {
                throw new PreexistingEntityException("Orders " + orders + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Orders orders) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders persistentOrders = em.find(Orders.class, orders.getOrderId());
            Users orderUseridOld = persistentOrders.getOrderUserid();
            Users orderUseridNew = orders.getOrderUserid();
            List<Orderdetails> orderdetailsListOld = persistentOrders.getOrderdetailsList();
            List<Orderdetails> orderdetailsListNew = orders.getOrderdetailsList();
            List<String> illegalOrphanMessages = null;
            for (Orderdetails orderdetailsListOldOrderdetails : orderdetailsListOld) {
                if (!orderdetailsListNew.contains(orderdetailsListOldOrderdetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Orderdetails " + orderdetailsListOldOrderdetails + " since its detailOrderid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (orderUseridNew != null) {
                orderUseridNew = em.getReference(orderUseridNew.getClass(), orderUseridNew.getUserid());
                orders.setOrderUserid(orderUseridNew);
            }
            List<Orderdetails> attachedOrderdetailsListNew = new ArrayList<Orderdetails>();
            for (Orderdetails orderdetailsListNewOrderdetailsToAttach : orderdetailsListNew) {
                orderdetailsListNewOrderdetailsToAttach = em.getReference(orderdetailsListNewOrderdetailsToAttach.getClass(), orderdetailsListNewOrderdetailsToAttach.getDetailid());
                attachedOrderdetailsListNew.add(orderdetailsListNewOrderdetailsToAttach);
            }
            orderdetailsListNew = attachedOrderdetailsListNew;
            orders.setOrderdetailsList(orderdetailsListNew);
            orders = em.merge(orders);
            if (orderUseridOld != null && !orderUseridOld.equals(orderUseridNew)) {
                orderUseridOld.getOrdersList().remove(orders);
                orderUseridOld = em.merge(orderUseridOld);
            }
            if (orderUseridNew != null && !orderUseridNew.equals(orderUseridOld)) {
                orderUseridNew.getOrdersList().add(orders);
                orderUseridNew = em.merge(orderUseridNew);
            }
            for (Orderdetails orderdetailsListNewOrderdetails : orderdetailsListNew) {
                if (!orderdetailsListOld.contains(orderdetailsListNewOrderdetails)) {
                    Orders oldDetailOrderidOfOrderdetailsListNewOrderdetails = orderdetailsListNewOrderdetails.getDetailOrderid();
                    orderdetailsListNewOrderdetails.setDetailOrderid(orders);
                    orderdetailsListNewOrderdetails = em.merge(orderdetailsListNewOrderdetails);
                    if (oldDetailOrderidOfOrderdetailsListNewOrderdetails != null && !oldDetailOrderidOfOrderdetailsListNewOrderdetails.equals(orders)) {
                        oldDetailOrderidOfOrderdetailsListNewOrderdetails.getOrderdetailsList().remove(orderdetailsListNewOrderdetails);
                        oldDetailOrderidOfOrderdetailsListNewOrderdetails = em.merge(oldDetailOrderidOfOrderdetailsListNewOrderdetails);
                    }
                }
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
                Integer id = orders.getOrderId();
                if (findOrders(id) == null) {
                    throw new NonexistentEntityException("The orders with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(Integer id) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Orders orders;
            try {
                orders = em.getReference(Orders.class, id);
                orders.getOrderId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The orders with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Orderdetails> orderdetailsListOrphanCheck = orders.getOrderdetailsList();
            for (Orderdetails orderdetailsListOrphanCheckOrderdetails : orderdetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Orders (" + orders + ") cannot be destroyed since the Orderdetails " + orderdetailsListOrphanCheckOrderdetails + " in its orderdetailsList field has a non-nullable detailOrderid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Users orderUserid = orders.getOrderUserid();
            if (orderUserid != null) {
                orderUserid.getOrdersList().remove(orders);
                orderUserid = em.merge(orderUserid);
            }
            em.remove(orders);
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

    public List<Orders> findOrdersEntities() {
        return findOrdersEntities(true, -1, -1);
    }

    public List<Orders> findOrdersEntities(int maxResults, int firstResult) {
        return findOrdersEntities(false, maxResults, firstResult);
    }

    private List<Orders> findOrdersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Orders.class));
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

    public Orders findOrders(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Orders.class, id);
        } finally {
            em.close();
        }
    }

    public int getOrdersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Orders> rt = cq.from(Orders.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
