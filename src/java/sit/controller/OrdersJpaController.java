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
import sit.model.Products;
import sit.model.OrderDetails;
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
        if (orders.getOrderDetailsList() == null) {
            orders.setOrderDetailsList(new ArrayList<OrderDetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Products orderProductid = orders.getOrderProductid();
            if (orderProductid != null) {
                orderProductid = em.getReference(orderProductid.getClass(), orderProductid.getProductId());
                orders.setOrderProductid(orderProductid);
            }
            List<OrderDetails> attachedOrderDetailsList = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListOrderDetailsToAttach : orders.getOrderDetailsList()) {
                orderDetailsListOrderDetailsToAttach = em.getReference(orderDetailsListOrderDetailsToAttach.getClass(), orderDetailsListOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsList.add(orderDetailsListOrderDetailsToAttach);
            }
            orders.setOrderDetailsList(attachedOrderDetailsList);
            em.persist(orders);
            if (orderProductid != null) {
                orderProductid.getOrdersList().add(orders);
                orderProductid = em.merge(orderProductid);
            }
            for (OrderDetails orderDetailsListOrderDetails : orders.getOrderDetailsList()) {
                Orders oldDetailOrderidOfOrderDetailsListOrderDetails = orderDetailsListOrderDetails.getDetailOrderid();
                orderDetailsListOrderDetails.setDetailOrderid(orders);
                orderDetailsListOrderDetails = em.merge(orderDetailsListOrderDetails);
                if (oldDetailOrderidOfOrderDetailsListOrderDetails != null) {
                    oldDetailOrderidOfOrderDetailsListOrderDetails.getOrderDetailsList().remove(orderDetailsListOrderDetails);
                    oldDetailOrderidOfOrderDetailsListOrderDetails = em.merge(oldDetailOrderidOfOrderDetailsListOrderDetails);
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
            Products orderProductidOld = persistentOrders.getOrderProductid();
            Products orderProductidNew = orders.getOrderProductid();
            List<OrderDetails> orderDetailsListOld = persistentOrders.getOrderDetailsList();
            List<OrderDetails> orderDetailsListNew = orders.getOrderDetailsList();
            List<String> illegalOrphanMessages = null;
            for (OrderDetails orderDetailsListOldOrderDetails : orderDetailsListOld) {
                if (!orderDetailsListNew.contains(orderDetailsListOldOrderDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain OrderDetails " + orderDetailsListOldOrderDetails + " since its detailOrderid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (orderProductidNew != null) {
                orderProductidNew = em.getReference(orderProductidNew.getClass(), orderProductidNew.getProductId());
                orders.setOrderProductid(orderProductidNew);
            }
            List<OrderDetails> attachedOrderDetailsListNew = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListNewOrderDetailsToAttach : orderDetailsListNew) {
                orderDetailsListNewOrderDetailsToAttach = em.getReference(orderDetailsListNewOrderDetailsToAttach.getClass(), orderDetailsListNewOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsListNew.add(orderDetailsListNewOrderDetailsToAttach);
            }
            orderDetailsListNew = attachedOrderDetailsListNew;
            orders.setOrderDetailsList(orderDetailsListNew);
            orders = em.merge(orders);
            if (orderProductidOld != null && !orderProductidOld.equals(orderProductidNew)) {
                orderProductidOld.getOrdersList().remove(orders);
                orderProductidOld = em.merge(orderProductidOld);
            }
            if (orderProductidNew != null && !orderProductidNew.equals(orderProductidOld)) {
                orderProductidNew.getOrdersList().add(orders);
                orderProductidNew = em.merge(orderProductidNew);
            }
            for (OrderDetails orderDetailsListNewOrderDetails : orderDetailsListNew) {
                if (!orderDetailsListOld.contains(orderDetailsListNewOrderDetails)) {
                    Orders oldDetailOrderidOfOrderDetailsListNewOrderDetails = orderDetailsListNewOrderDetails.getDetailOrderid();
                    orderDetailsListNewOrderDetails.setDetailOrderid(orders);
                    orderDetailsListNewOrderDetails = em.merge(orderDetailsListNewOrderDetails);
                    if (oldDetailOrderidOfOrderDetailsListNewOrderDetails != null && !oldDetailOrderidOfOrderDetailsListNewOrderDetails.equals(orders)) {
                        oldDetailOrderidOfOrderDetailsListNewOrderDetails.getOrderDetailsList().remove(orderDetailsListNewOrderDetails);
                        oldDetailOrderidOfOrderDetailsListNewOrderDetails = em.merge(oldDetailOrderidOfOrderDetailsListNewOrderDetails);
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
            List<OrderDetails> orderDetailsListOrphanCheck = orders.getOrderDetailsList();
            for (OrderDetails orderDetailsListOrphanCheckOrderDetails : orderDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Orders (" + orders + ") cannot be destroyed since the OrderDetails " + orderDetailsListOrphanCheckOrderDetails + " in its orderDetailsList field has a non-nullable detailOrderid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Products orderProductid = orders.getOrderProductid();
            if (orderProductid != null) {
                orderProductid.getOrdersList().remove(orders);
                orderProductid = em.merge(orderProductid);
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
