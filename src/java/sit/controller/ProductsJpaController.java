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
import sit.model.ProductStats;
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
import sit.model.Wishlists;
import sit.model.OrderDetails;
import sit.model.Products;
import sit.model.Products_;

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
        if (products.getProductStatsList() == null) {
            products.setProductStatsList(new ArrayList<ProductStats>());
        }
        if (products.getWishlistsList() == null) {
            products.setWishlistsList(new ArrayList<Wishlists>());
        }
        if (products.getOrderDetailsList() == null) {
            products.setOrderDetailsList(new ArrayList<OrderDetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<ProductStats> attachedProductStatsList = new ArrayList<ProductStats>();
            for (ProductStats productStatsListProductStatsToAttach : products.getProductStatsList()) {
                productStatsListProductStatsToAttach = em.getReference(productStatsListProductStatsToAttach.getClass(), productStatsListProductStatsToAttach.getProductstatsid());
                attachedProductStatsList.add(productStatsListProductStatsToAttach);
            }
            products.setProductStatsList(attachedProductStatsList);
            List<Wishlists> attachedWishlistsList = new ArrayList<Wishlists>();
            for (Wishlists wishlistsListWishlistsToAttach : products.getWishlistsList()) {
                wishlistsListWishlistsToAttach = em.getReference(wishlistsListWishlistsToAttach.getClass(), wishlistsListWishlistsToAttach.getWishlistid());
                attachedWishlistsList.add(wishlistsListWishlistsToAttach);
            }
            products.setWishlistsList(attachedWishlistsList);
            List<OrderDetails> attachedOrderDetailsList = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListOrderDetailsToAttach : products.getOrderDetailsList()) {
                orderDetailsListOrderDetailsToAttach = em.getReference(orderDetailsListOrderDetailsToAttach.getClass(), orderDetailsListOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsList.add(orderDetailsListOrderDetailsToAttach);
            }
            products.setOrderDetailsList(attachedOrderDetailsList);
            em.persist(products);
            for (ProductStats productStatsListProductStats : products.getProductStatsList()) {
                Products oldProductstatsProductidOfProductStatsListProductStats = productStatsListProductStats.getProductstatsProductid();
                productStatsListProductStats.setProductstatsProductid(products);
                productStatsListProductStats = em.merge(productStatsListProductStats);
                if (oldProductstatsProductidOfProductStatsListProductStats != null) {
                    oldProductstatsProductidOfProductStatsListProductStats.getProductStatsList().remove(productStatsListProductStats);
                    oldProductstatsProductidOfProductStatsListProductStats = em.merge(oldProductstatsProductidOfProductStatsListProductStats);
                }
            }
            for (Wishlists wishlistsListWishlists : products.getWishlistsList()) {
                Products oldWishlistProductidOfWishlistsListWishlists = wishlistsListWishlists.getWishlistProductid();
                wishlistsListWishlists.setWishlistProductid(products);
                wishlistsListWishlists = em.merge(wishlistsListWishlists);
                if (oldWishlistProductidOfWishlistsListWishlists != null) {
                    oldWishlistProductidOfWishlistsListWishlists.getWishlistsList().remove(wishlistsListWishlists);
                    oldWishlistProductidOfWishlistsListWishlists = em.merge(oldWishlistProductidOfWishlistsListWishlists);
                }
            }
            for (OrderDetails orderDetailsListOrderDetails : products.getOrderDetailsList()) {
                Products oldDetailProductidOfOrderDetailsListOrderDetails = orderDetailsListOrderDetails.getDetailProductid();
                orderDetailsListOrderDetails.setDetailProductid(products);
                orderDetailsListOrderDetails = em.merge(orderDetailsListOrderDetails);
                if (oldDetailProductidOfOrderDetailsListOrderDetails != null) {
                    oldDetailProductidOfOrderDetailsListOrderDetails.getOrderDetailsList().remove(orderDetailsListOrderDetails);
                    oldDetailProductidOfOrderDetailsListOrderDetails = em.merge(oldDetailProductidOfOrderDetailsListOrderDetails);
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
            List<ProductStats> productStatsListOld = persistentProducts.getProductStatsList();
            List<ProductStats> productStatsListNew = products.getProductStatsList();
            List<Wishlists> wishlistsListOld = persistentProducts.getWishlistsList();
            List<Wishlists> wishlistsListNew = products.getWishlistsList();
            List<OrderDetails> orderDetailsListOld = persistentProducts.getOrderDetailsList();
            List<OrderDetails> orderDetailsListNew = products.getOrderDetailsList();
            List<String> illegalOrphanMessages = null;
            for (ProductStats productStatsListOldProductStats : productStatsListOld) {
                if (!productStatsListNew.contains(productStatsListOldProductStats)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain ProductStats " + productStatsListOldProductStats + " since its productstatsProductid field is not nullable.");
                }
            }
            for (Wishlists wishlistsListOldWishlists : wishlistsListOld) {
                if (!wishlistsListNew.contains(wishlistsListOldWishlists)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Wishlists " + wishlistsListOldWishlists + " since its wishlistProductid field is not nullable.");
                }
            }
            for (OrderDetails orderDetailsListOldOrderDetails : orderDetailsListOld) {
                if (!orderDetailsListNew.contains(orderDetailsListOldOrderDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain OrderDetails " + orderDetailsListOldOrderDetails + " since its detailProductid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<ProductStats> attachedProductStatsListNew = new ArrayList<ProductStats>();
            for (ProductStats productStatsListNewProductStatsToAttach : productStatsListNew) {
                productStatsListNewProductStatsToAttach = em.getReference(productStatsListNewProductStatsToAttach.getClass(), productStatsListNewProductStatsToAttach.getProductstatsid());
                attachedProductStatsListNew.add(productStatsListNewProductStatsToAttach);
            }
            productStatsListNew = attachedProductStatsListNew;
            products.setProductStatsList(productStatsListNew);
            List<Wishlists> attachedWishlistsListNew = new ArrayList<Wishlists>();
            for (Wishlists wishlistsListNewWishlistsToAttach : wishlistsListNew) {
                wishlistsListNewWishlistsToAttach = em.getReference(wishlistsListNewWishlistsToAttach.getClass(), wishlistsListNewWishlistsToAttach.getWishlistid());
                attachedWishlistsListNew.add(wishlistsListNewWishlistsToAttach);
            }
            wishlistsListNew = attachedWishlistsListNew;
            products.setWishlistsList(wishlistsListNew);
            List<OrderDetails> attachedOrderDetailsListNew = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListNewOrderDetailsToAttach : orderDetailsListNew) {
                orderDetailsListNewOrderDetailsToAttach = em.getReference(orderDetailsListNewOrderDetailsToAttach.getClass(), orderDetailsListNewOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsListNew.add(orderDetailsListNewOrderDetailsToAttach);
            }
            orderDetailsListNew = attachedOrderDetailsListNew;
            products.setOrderDetailsList(orderDetailsListNew);
            products = em.merge(products);
            for (ProductStats productStatsListNewProductStats : productStatsListNew) {
                if (!productStatsListOld.contains(productStatsListNewProductStats)) {
                    Products oldProductstatsProductidOfProductStatsListNewProductStats = productStatsListNewProductStats.getProductstatsProductid();
                    productStatsListNewProductStats.setProductstatsProductid(products);
                    productStatsListNewProductStats = em.merge(productStatsListNewProductStats);
                    if (oldProductstatsProductidOfProductStatsListNewProductStats != null && !oldProductstatsProductidOfProductStatsListNewProductStats.equals(products)) {
                        oldProductstatsProductidOfProductStatsListNewProductStats.getProductStatsList().remove(productStatsListNewProductStats);
                        oldProductstatsProductidOfProductStatsListNewProductStats = em.merge(oldProductstatsProductidOfProductStatsListNewProductStats);
                    }
                }
            }
            for (Wishlists wishlistsListNewWishlists : wishlistsListNew) {
                if (!wishlistsListOld.contains(wishlistsListNewWishlists)) {
                    Products oldWishlistProductidOfWishlistsListNewWishlists = wishlistsListNewWishlists.getWishlistProductid();
                    wishlistsListNewWishlists.setWishlistProductid(products);
                    wishlistsListNewWishlists = em.merge(wishlistsListNewWishlists);
                    if (oldWishlistProductidOfWishlistsListNewWishlists != null && !oldWishlistProductidOfWishlistsListNewWishlists.equals(products)) {
                        oldWishlistProductidOfWishlistsListNewWishlists.getWishlistsList().remove(wishlistsListNewWishlists);
                        oldWishlistProductidOfWishlistsListNewWishlists = em.merge(oldWishlistProductidOfWishlistsListNewWishlists);
                    }
                }
            }
            for (OrderDetails orderDetailsListNewOrderDetails : orderDetailsListNew) {
                if (!orderDetailsListOld.contains(orderDetailsListNewOrderDetails)) {
                    Products oldDetailProductidOfOrderDetailsListNewOrderDetails = orderDetailsListNewOrderDetails.getDetailProductid();
                    orderDetailsListNewOrderDetails.setDetailProductid(products);
                    orderDetailsListNewOrderDetails = em.merge(orderDetailsListNewOrderDetails);
                    if (oldDetailProductidOfOrderDetailsListNewOrderDetails != null && !oldDetailProductidOfOrderDetailsListNewOrderDetails.equals(products)) {
                        oldDetailProductidOfOrderDetailsListNewOrderDetails.getOrderDetailsList().remove(orderDetailsListNewOrderDetails);
                        oldDetailProductidOfOrderDetailsListNewOrderDetails = em.merge(oldDetailProductidOfOrderDetailsListNewOrderDetails);
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
            List<ProductStats> productStatsListOrphanCheck = products.getProductStatsList();
            for (ProductStats productStatsListOrphanCheckProductStats : productStatsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Products (" + products + ") cannot be destroyed since the ProductStats " + productStatsListOrphanCheckProductStats + " in its productStatsList field has a non-nullable productstatsProductid field.");
            }
            List<Wishlists> wishlistsListOrphanCheck = products.getWishlistsList();
            for (Wishlists wishlistsListOrphanCheckWishlists : wishlistsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Products (" + products + ") cannot be destroyed since the Wishlists " + wishlistsListOrphanCheckWishlists + " in its wishlistsList field has a non-nullable wishlistProductid field.");
            }
            List<OrderDetails> orderDetailsListOrphanCheck = products.getOrderDetailsList();
            for (OrderDetails orderDetailsListOrphanCheckOrderDetails : orderDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Products (" + products + ") cannot be destroyed since the OrderDetails " + orderDetailsListOrphanCheckOrderDetails + " in its orderDetailsList field has a non-nullable detailProductid field.");
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
                    cb.like(cb.lower(e.<String>get("productCategory")), "%" + ("All".equals(category) || "".equals(category) ? "" : category.toLowerCase()) + "%"),
                    cb.between(e.<Double>get(Products_.productPrice), min, max)
            );
            Query query = em.createQuery(cq);
            return query.getResultList();
        } catch (Exception e) {
            System.out.println(e);
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
