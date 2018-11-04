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
import javax.transaction.UserTransaction;
import sit.controller.exceptions.IllegalOrphanException;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.Wishlists;
import sit.model.Orders;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class UsersJpaController implements Serializable {

    public UsersJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Users users) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (users.getProductStatsList() == null) {
            users.setProductStatsList(new ArrayList<ProductStats>());
        }
        if (users.getWishlistsList() == null) {
            users.setWishlistsList(new ArrayList<Wishlists>());
        }
        if (users.getOrdersList() == null) {
            users.setOrdersList(new ArrayList<Orders>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<ProductStats> attachedProductStatsList = new ArrayList<ProductStats>();
            for (ProductStats productStatsListProductStatsToAttach : users.getProductStatsList()) {
                productStatsListProductStatsToAttach = em.getReference(productStatsListProductStatsToAttach.getClass(), productStatsListProductStatsToAttach.getProductstatsid());
                attachedProductStatsList.add(productStatsListProductStatsToAttach);
            }
            users.setProductStatsList(attachedProductStatsList);
            List<Wishlists> attachedWishlistsList = new ArrayList<Wishlists>();
            for (Wishlists wishlistsListWishlistsToAttach : users.getWishlistsList()) {
                wishlistsListWishlistsToAttach = em.getReference(wishlistsListWishlistsToAttach.getClass(), wishlistsListWishlistsToAttach.getWishlistid());
                attachedWishlistsList.add(wishlistsListWishlistsToAttach);
            }
            users.setWishlistsList(attachedWishlistsList);
            List<Orders> attachedOrdersList = new ArrayList<Orders>();
            for (Orders ordersListOrdersToAttach : users.getOrdersList()) {
                ordersListOrdersToAttach = em.getReference(ordersListOrdersToAttach.getClass(), ordersListOrdersToAttach.getOrderId());
                attachedOrdersList.add(ordersListOrdersToAttach);
            }
            users.setOrdersList(attachedOrdersList);
            em.persist(users);
            for (ProductStats productStatsListProductStats : users.getProductStatsList()) {
                Users oldProductstatsUseridOfProductStatsListProductStats = productStatsListProductStats.getProductstatsUserid();
                productStatsListProductStats.setProductstatsUserid(users);
                productStatsListProductStats = em.merge(productStatsListProductStats);
                if (oldProductstatsUseridOfProductStatsListProductStats != null) {
                    oldProductstatsUseridOfProductStatsListProductStats.getProductStatsList().remove(productStatsListProductStats);
                    oldProductstatsUseridOfProductStatsListProductStats = em.merge(oldProductstatsUseridOfProductStatsListProductStats);
                }
            }
            for (Wishlists wishlistsListWishlists : users.getWishlistsList()) {
                Users oldWishlistUseridOfWishlistsListWishlists = wishlistsListWishlists.getWishlistUserid();
                wishlistsListWishlists.setWishlistUserid(users);
                wishlistsListWishlists = em.merge(wishlistsListWishlists);
                if (oldWishlistUseridOfWishlistsListWishlists != null) {
                    oldWishlistUseridOfWishlistsListWishlists.getWishlistsList().remove(wishlistsListWishlists);
                    oldWishlistUseridOfWishlistsListWishlists = em.merge(oldWishlistUseridOfWishlistsListWishlists);
                }
            }
            for (Orders ordersListOrders : users.getOrdersList()) {
                Users oldOrderUseridOfOrdersListOrders = ordersListOrders.getOrderUserid();
                ordersListOrders.setOrderUserid(users);
                ordersListOrders = em.merge(ordersListOrders);
                if (oldOrderUseridOfOrdersListOrders != null) {
                    oldOrderUseridOfOrdersListOrders.getOrdersList().remove(ordersListOrders);
                    oldOrderUseridOfOrdersListOrders = em.merge(oldOrderUseridOfOrdersListOrders);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findUsers(users.getUserid()) != null) {
                throw new PreexistingEntityException("Users " + users + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Users users) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Users persistentUsers = em.find(Users.class, users.getUserid());
            List<ProductStats> productStatsListOld = persistentUsers.getProductStatsList();
            List<ProductStats> productStatsListNew = users.getProductStatsList();
            List<Wishlists> wishlistsListOld = persistentUsers.getWishlistsList();
            List<Wishlists> wishlistsListNew = users.getWishlistsList();
            List<Orders> ordersListOld = persistentUsers.getOrdersList();
            List<Orders> ordersListNew = users.getOrdersList();
            List<String> illegalOrphanMessages = null;
            for (ProductStats productStatsListOldProductStats : productStatsListOld) {
                if (!productStatsListNew.contains(productStatsListOldProductStats)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain ProductStats " + productStatsListOldProductStats + " since its productstatsUserid field is not nullable.");
                }
            }
            for (Wishlists wishlistsListOldWishlists : wishlistsListOld) {
                if (!wishlistsListNew.contains(wishlistsListOldWishlists)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Wishlists " + wishlistsListOldWishlists + " since its wishlistUserid field is not nullable.");
                }
            }
            for (Orders ordersListOldOrders : ordersListOld) {
                if (!ordersListNew.contains(ordersListOldOrders)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Orders " + ordersListOldOrders + " since its orderUserid field is not nullable.");
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
            users.setProductStatsList(productStatsListNew);
            List<Wishlists> attachedWishlistsListNew = new ArrayList<Wishlists>();
            for (Wishlists wishlistsListNewWishlistsToAttach : wishlistsListNew) {
                wishlistsListNewWishlistsToAttach = em.getReference(wishlistsListNewWishlistsToAttach.getClass(), wishlistsListNewWishlistsToAttach.getWishlistid());
                attachedWishlistsListNew.add(wishlistsListNewWishlistsToAttach);
            }
            wishlistsListNew = attachedWishlistsListNew;
            users.setWishlistsList(wishlistsListNew);
            List<Orders> attachedOrdersListNew = new ArrayList<Orders>();
            for (Orders ordersListNewOrdersToAttach : ordersListNew) {
                ordersListNewOrdersToAttach = em.getReference(ordersListNewOrdersToAttach.getClass(), ordersListNewOrdersToAttach.getOrderId());
                attachedOrdersListNew.add(ordersListNewOrdersToAttach);
            }
            ordersListNew = attachedOrdersListNew;
            users.setOrdersList(ordersListNew);
            users = em.merge(users);
            for (ProductStats productStatsListNewProductStats : productStatsListNew) {
                if (!productStatsListOld.contains(productStatsListNewProductStats)) {
                    Users oldProductstatsUseridOfProductStatsListNewProductStats = productStatsListNewProductStats.getProductstatsUserid();
                    productStatsListNewProductStats.setProductstatsUserid(users);
                    productStatsListNewProductStats = em.merge(productStatsListNewProductStats);
                    if (oldProductstatsUseridOfProductStatsListNewProductStats != null && !oldProductstatsUseridOfProductStatsListNewProductStats.equals(users)) {
                        oldProductstatsUseridOfProductStatsListNewProductStats.getProductStatsList().remove(productStatsListNewProductStats);
                        oldProductstatsUseridOfProductStatsListNewProductStats = em.merge(oldProductstatsUseridOfProductStatsListNewProductStats);
                    }
                }
            }
            for (Wishlists wishlistsListNewWishlists : wishlistsListNew) {
                if (!wishlistsListOld.contains(wishlistsListNewWishlists)) {
                    Users oldWishlistUseridOfWishlistsListNewWishlists = wishlistsListNewWishlists.getWishlistUserid();
                    wishlistsListNewWishlists.setWishlistUserid(users);
                    wishlistsListNewWishlists = em.merge(wishlistsListNewWishlists);
                    if (oldWishlistUseridOfWishlistsListNewWishlists != null && !oldWishlistUseridOfWishlistsListNewWishlists.equals(users)) {
                        oldWishlistUseridOfWishlistsListNewWishlists.getWishlistsList().remove(wishlistsListNewWishlists);
                        oldWishlistUseridOfWishlistsListNewWishlists = em.merge(oldWishlistUseridOfWishlistsListNewWishlists);
                    }
                }
            }
            for (Orders ordersListNewOrders : ordersListNew) {
                if (!ordersListOld.contains(ordersListNewOrders)) {
                    Users oldOrderUseridOfOrdersListNewOrders = ordersListNewOrders.getOrderUserid();
                    ordersListNewOrders.setOrderUserid(users);
                    ordersListNewOrders = em.merge(ordersListNewOrders);
                    if (oldOrderUseridOfOrdersListNewOrders != null && !oldOrderUseridOfOrdersListNewOrders.equals(users)) {
                        oldOrderUseridOfOrdersListNewOrders.getOrdersList().remove(ordersListNewOrders);
                        oldOrderUseridOfOrdersListNewOrders = em.merge(oldOrderUseridOfOrdersListNewOrders);
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
                Integer id = users.getUserid();
                if (findUsers(id) == null) {
                    throw new NonexistentEntityException("The users with id " + id + " no longer exists.");
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
            Users users;
            try {
                users = em.getReference(Users.class, id);
                users.getUserid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The users with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<ProductStats> productStatsListOrphanCheck = users.getProductStatsList();
            for (ProductStats productStatsListOrphanCheckProductStats : productStatsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Users (" + users + ") cannot be destroyed since the ProductStats " + productStatsListOrphanCheckProductStats + " in its productStatsList field has a non-nullable productstatsUserid field.");
            }
            List<Wishlists> wishlistsListOrphanCheck = users.getWishlistsList();
            for (Wishlists wishlistsListOrphanCheckWishlists : wishlistsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Users (" + users + ") cannot be destroyed since the Wishlists " + wishlistsListOrphanCheckWishlists + " in its wishlistsList field has a non-nullable wishlistUserid field.");
            }
            List<Orders> ordersListOrphanCheck = users.getOrdersList();
            for (Orders ordersListOrphanCheckOrders : ordersListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Users (" + users + ") cannot be destroyed since the Orders " + ordersListOrphanCheckOrders + " in its ordersList field has a non-nullable orderUserid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(users);
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

    public List<Users> findUsersEntities() {
        return findUsersEntities(true, -1, -1);
    }

    public List<Users> findUsersEntities(int maxResults, int firstResult) {
        return findUsersEntities(false, maxResults, firstResult);
    }

    private List<Users> findUsersEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Users.class));
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

    public Users findUsers(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Users.class, id);
        } finally {
            em.close();
        }
    }
    
    public Users findUsername(String username) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Users.findByUsername");
            query.setParameter("username", "%" + username.toLowerCase() + "%");
            return (Users) query.getSingleResult();
        } catch (Exception e) {
            
        } finally {
            em.close();
        }
        return null;
    }
    
    public Users findEmail(String email) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createNamedQuery("Users.findByEmail");
            query.setParameter("email", "%" + email.toLowerCase() + "%");
            return (Users) query.getSingleResult();
        } catch (Exception e) {} finally {
            em.close();
        }
        return null;
    }

    public int getUsersCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Users> rt = cq.from(Users.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
