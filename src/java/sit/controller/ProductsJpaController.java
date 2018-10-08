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
import sit.model.Productcategories;
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
        if (products.getOrderdetailsList() == null) {
            products.setOrderdetailsList(new ArrayList<Orderdetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Productcategories productCategotyid = products.getProductCategotyid();
            if (productCategotyid != null) {
                productCategotyid = em.getReference(productCategotyid.getClass(), productCategotyid.getCategoryId());
                products.setProductCategotyid(productCategotyid);
            }
            List<Orderdetails> attachedOrderdetailsList = new ArrayList<Orderdetails>();
            for (Orderdetails orderdetailsListOrderdetailsToAttach : products.getOrderdetailsList()) {
                orderdetailsListOrderdetailsToAttach = em.getReference(orderdetailsListOrderdetailsToAttach.getClass(), orderdetailsListOrderdetailsToAttach.getDetailid());
                attachedOrderdetailsList.add(orderdetailsListOrderdetailsToAttach);
            }
            products.setOrderdetailsList(attachedOrderdetailsList);
            em.persist(products);
            if (productCategotyid != null) {
                productCategotyid.getProductsList().add(products);
                productCategotyid = em.merge(productCategotyid);
            }
            for (Orderdetails orderdetailsListOrderdetails : products.getOrderdetailsList()) {
                Products oldDetailProductidOfOrderdetailsListOrderdetails = orderdetailsListOrderdetails.getDetailProductid();
                orderdetailsListOrderdetails.setDetailProductid(products);
                orderdetailsListOrderdetails = em.merge(orderdetailsListOrderdetails);
                if (oldDetailProductidOfOrderdetailsListOrderdetails != null) {
                    oldDetailProductidOfOrderdetailsListOrderdetails.getOrderdetailsList().remove(orderdetailsListOrderdetails);
                    oldDetailProductidOfOrderdetailsListOrderdetails = em.merge(oldDetailProductidOfOrderdetailsListOrderdetails);
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
            Productcategories productCategotyidOld = persistentProducts.getProductCategotyid();
            Productcategories productCategotyidNew = products.getProductCategotyid();
            List<Orderdetails> orderdetailsListOld = persistentProducts.getOrderdetailsList();
            List<Orderdetails> orderdetailsListNew = products.getOrderdetailsList();
            List<String> illegalOrphanMessages = null;
            for (Orderdetails orderdetailsListOldOrderdetails : orderdetailsListOld) {
                if (!orderdetailsListNew.contains(orderdetailsListOldOrderdetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Orderdetails " + orderdetailsListOldOrderdetails + " since its detailProductid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            if (productCategotyidNew != null) {
                productCategotyidNew = em.getReference(productCategotyidNew.getClass(), productCategotyidNew.getCategoryId());
                products.setProductCategotyid(productCategotyidNew);
            }
            List<Orderdetails> attachedOrderdetailsListNew = new ArrayList<Orderdetails>();
            for (Orderdetails orderdetailsListNewOrderdetailsToAttach : orderdetailsListNew) {
                orderdetailsListNewOrderdetailsToAttach = em.getReference(orderdetailsListNewOrderdetailsToAttach.getClass(), orderdetailsListNewOrderdetailsToAttach.getDetailid());
                attachedOrderdetailsListNew.add(orderdetailsListNewOrderdetailsToAttach);
            }
            orderdetailsListNew = attachedOrderdetailsListNew;
            products.setOrderdetailsList(orderdetailsListNew);
            products = em.merge(products);
            if (productCategotyidOld != null && !productCategotyidOld.equals(productCategotyidNew)) {
                productCategotyidOld.getProductsList().remove(products);
                productCategotyidOld = em.merge(productCategotyidOld);
            }
            if (productCategotyidNew != null && !productCategotyidNew.equals(productCategotyidOld)) {
                productCategotyidNew.getProductsList().add(products);
                productCategotyidNew = em.merge(productCategotyidNew);
            }
            for (Orderdetails orderdetailsListNewOrderdetails : orderdetailsListNew) {
                if (!orderdetailsListOld.contains(orderdetailsListNewOrderdetails)) {
                    Products oldDetailProductidOfOrderdetailsListNewOrderdetails = orderdetailsListNewOrderdetails.getDetailProductid();
                    orderdetailsListNewOrderdetails.setDetailProductid(products);
                    orderdetailsListNewOrderdetails = em.merge(orderdetailsListNewOrderdetails);
                    if (oldDetailProductidOfOrderdetailsListNewOrderdetails != null && !oldDetailProductidOfOrderdetailsListNewOrderdetails.equals(products)) {
                        oldDetailProductidOfOrderdetailsListNewOrderdetails.getOrderdetailsList().remove(orderdetailsListNewOrderdetails);
                        oldDetailProductidOfOrderdetailsListNewOrderdetails = em.merge(oldDetailProductidOfOrderdetailsListNewOrderdetails);
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
            List<Orderdetails> orderdetailsListOrphanCheck = products.getOrderdetailsList();
            for (Orderdetails orderdetailsListOrphanCheckOrderdetails : orderdetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Products (" + products + ") cannot be destroyed since the Orderdetails " + orderdetailsListOrphanCheckOrderdetails + " in its orderdetailsList field has a non-nullable detailProductid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            Productcategories productCategotyid = products.getProductCategotyid();
            if (productCategotyid != null) {
                productCategotyid.getProductsList().remove(products);
                productCategotyid = em.merge(productCategotyid);
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
