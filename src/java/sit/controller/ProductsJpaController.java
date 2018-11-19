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
import sit.model.Orders;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.criteria.CriteriaBuilder;
import javax.transaction.UserTransaction;
import sit.controller.exceptions.IllegalOrphanException;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.Products;

/**
 *
 * @author Firsty
 */
public class ProductsJpaController implements Serializable {

    public ProductsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Products products) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (products.getOrdersList() == null) {
            products.setOrdersList(new ArrayList<Orders>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Orders> attachedOrdersList = new ArrayList<Orders>();
            for (Orders ordersListOrdersToAttach : products.getOrdersList()) {
                ordersListOrdersToAttach = em.getReference(ordersListOrdersToAttach.getClass(), ordersListOrdersToAttach.getOrderId());
                attachedOrdersList.add(ordersListOrdersToAttach);
            }
            products.setOrdersList(attachedOrdersList);
            em.persist(products);
            for (Orders ordersListOrders : products.getOrdersList()) {
                Products oldOrderProductidOfOrdersListOrders = ordersListOrders.getOrderProductid();
                ordersListOrders.setOrderProductid(products);
                ordersListOrders = em.merge(ordersListOrders);
                if (oldOrderProductidOfOrdersListOrders != null) {
                    oldOrderProductidOfOrdersListOrders.getOrdersList().remove(ordersListOrders);
                    oldOrderProductidOfOrdersListOrders = em.merge(oldOrderProductidOfOrdersListOrders);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProducts(products.getProductId()) != null) {
                throw new PreexistingEntityException("Products " + products + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Products products) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Products persistentProducts = em.find(Products.class, products.getProductId());
            List<Orders> ordersListOld = persistentProducts.getOrdersList();
            List<Orders> ordersListNew = products.getOrdersList();
            List<String> illegalOrphanMessages = null;
            for (Orders ordersListOldOrders : ordersListOld) {
                if (!ordersListNew.contains(ordersListOldOrders)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Orders " + ordersListOldOrders + " since its orderProductid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Orders> attachedOrdersListNew = new ArrayList<Orders>();
            for (Orders ordersListNewOrdersToAttach : ordersListNew) {
                ordersListNewOrdersToAttach = em.getReference(ordersListNewOrdersToAttach.getClass(), ordersListNewOrdersToAttach.getOrderId());
                attachedOrdersListNew.add(ordersListNewOrdersToAttach);
            }
            ordersListNew = attachedOrdersListNew;
            products.setOrdersList(ordersListNew);
            products = em.merge(products);
            for (Orders ordersListNewOrders : ordersListNew) {
                if (!ordersListOld.contains(ordersListNewOrders)) {
                    Products oldOrderProductidOfOrdersListNewOrders = ordersListNewOrders.getOrderProductid();
                    ordersListNewOrders.setOrderProductid(products);
                    ordersListNewOrders = em.merge(ordersListNewOrders);
                    if (oldOrderProductidOfOrdersListNewOrders != null && !oldOrderProductidOfOrdersListNewOrders.equals(products)) {
                        oldOrderProductidOfOrdersListNewOrders.getOrdersList().remove(ordersListNewOrders);
                        oldOrderProductidOfOrdersListNewOrders = em.merge(oldOrderProductidOfOrdersListNewOrders);
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
                Integer id = products.getProductId();
                if (findProducts(id) == null) {
                    throw new NonexistentEntityException("The products with id " + id + " no longer exists.");
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
            Products products;
            try {
                products = em.getReference(Products.class, id);
                products.getProductId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The products with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Orders> ordersListOrphanCheck = products.getOrdersList();
            for (Orders ordersListOrphanCheckOrders : ordersListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Products (" + products + ") cannot be destroyed since the Orders " + ordersListOrphanCheckOrders + " in its ordersList field has a non-nullable orderProductid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(products);
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

    public List<Products> findProductsEntities() {
        return findProductsEntities(true, -1, -1);
    }

    public List<Products> findProductsEntities(int maxResults, int firstResult) {
        return findProductsEntities(false, maxResults, firstResult);
    }

    private List<Products> findProductsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Products.class));
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

    public Products findProducts(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Products.class, id);
        } finally {
            em.close();
        }
    }
    
    public List<Products> findProductsByUserInputs(String searchQuery, String category, double min, double max, boolean excludeOutOfStockk) {
        EntityManager em = getEntityManager();
        List<Products> finalResult = new ArrayList<>();
        try {
            CriteriaBuilder cb = em.getCriteriaBuilder();
            CriteriaQuery<Products> cq = cb.createQuery(Products.class);
            Root<Products> e = cq.from(Products.class);
            cq.select(e);
            cq.where(
                    cb.like(cb.lower(e.<String>get("productName")), "%" + searchQuery.toLowerCase() + "%"),
                    cb.like(cb.lower(e.<String>get("productCategory")), "%" + ("All".equalsIgnoreCase(category) || "".equals(category) ? "" : category.toLowerCase()) + "%"),
                    cb.between(e.<Double>get("productPrice"), min, max)
            );
            Query query = em.createQuery(cq);
            return query.getResultList();
        } catch (Exception e) {
//            System.out.println(e);
        } finally {
            em.close();
        }
        
        return null;
    }
    

    public int getProductsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Products> rt = cq.from(Products.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
