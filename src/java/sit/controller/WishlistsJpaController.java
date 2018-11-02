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
import sit.model.Products;
import sit.model.Users;
import sit.model.Wishlists;

/**
 *
 * @author Firsty
 */
public class WishlistsJpaController implements Serializable {

    public WishlistsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Wishlists wishlists) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Products wishlistProductid = wishlists.getWishlistProductid();
            if (wishlistProductid != null) {
                wishlistProductid = em.getReference(wishlistProductid.getClass(), wishlistProductid.getProductId());
                wishlists.setWishlistProductid(wishlistProductid);
            }
            Users wishlistUserid = wishlists.getWishlistUserid();
            if (wishlistUserid != null) {
                wishlistUserid = em.getReference(wishlistUserid.getClass(), wishlistUserid.getUserid());
                wishlists.setWishlistUserid(wishlistUserid);
            }
            em.persist(wishlists);
            if (wishlistProductid != null) {
                wishlistProductid.getWishlistsList().add(wishlists);
                wishlistProductid = em.merge(wishlistProductid);
            }
            if (wishlistUserid != null) {
                wishlistUserid.getWishlistsList().add(wishlists);
                wishlistUserid = em.merge(wishlistUserid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findWishlists(wishlists.getWishlistid()) != null) {
                throw new PreexistingEntityException("Wishlists " + wishlists + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Wishlists wishlists) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Wishlists persistentWishlists = em.find(Wishlists.class, wishlists.getWishlistid());
            Products wishlistProductidOld = persistentWishlists.getWishlistProductid();
            Products wishlistProductidNew = wishlists.getWishlistProductid();
            Users wishlistUseridOld = persistentWishlists.getWishlistUserid();
            Users wishlistUseridNew = wishlists.getWishlistUserid();
            if (wishlistProductidNew != null) {
                wishlistProductidNew = em.getReference(wishlistProductidNew.getClass(), wishlistProductidNew.getProductId());
                wishlists.setWishlistProductid(wishlistProductidNew);
            }
            if (wishlistUseridNew != null) {
                wishlistUseridNew = em.getReference(wishlistUseridNew.getClass(), wishlistUseridNew.getUserid());
                wishlists.setWishlistUserid(wishlistUseridNew);
            }
            wishlists = em.merge(wishlists);
            if (wishlistProductidOld != null && !wishlistProductidOld.equals(wishlistProductidNew)) {
                wishlistProductidOld.getWishlistsList().remove(wishlists);
                wishlistProductidOld = em.merge(wishlistProductidOld);
            }
            if (wishlistProductidNew != null && !wishlistProductidNew.equals(wishlistProductidOld)) {
                wishlistProductidNew.getWishlistsList().add(wishlists);
                wishlistProductidNew = em.merge(wishlistProductidNew);
            }
            if (wishlistUseridOld != null && !wishlistUseridOld.equals(wishlistUseridNew)) {
                wishlistUseridOld.getWishlistsList().remove(wishlists);
                wishlistUseridOld = em.merge(wishlistUseridOld);
            }
            if (wishlistUseridNew != null && !wishlistUseridNew.equals(wishlistUseridOld)) {
                wishlistUseridNew.getWishlistsList().add(wishlists);
                wishlistUseridNew = em.merge(wishlistUseridNew);
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
                Integer id = wishlists.getWishlistid();
                if (findWishlists(id) == null) {
                    throw new NonexistentEntityException("The wishlists with id " + id + " no longer exists.");
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
            Wishlists wishlists;
            try {
                wishlists = em.getReference(Wishlists.class, id);
                wishlists.getWishlistid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The wishlists with id " + id + " no longer exists.", enfe);
            }
            Products wishlistProductid = wishlists.getWishlistProductid();
            if (wishlistProductid != null) {
                wishlistProductid.getWishlistsList().remove(wishlists);
                wishlistProductid = em.merge(wishlistProductid);
            }
            Users wishlistUserid = wishlists.getWishlistUserid();
            if (wishlistUserid != null) {
                wishlistUserid.getWishlistsList().remove(wishlists);
                wishlistUserid = em.merge(wishlistUserid);
            }
            em.remove(wishlists);
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

    public List<Wishlists> findWishlistsEntities() {
        return findWishlistsEntities(true, -1, -1);
    }

    public List<Wishlists> findWishlistsEntities(int maxResults, int firstResult) {
        return findWishlistsEntities(false, maxResults, firstResult);
    }

    private List<Wishlists> findWishlistsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Wishlists.class));
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

    public Wishlists findWishlists(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Wishlists.class, id);
        } finally {
            em.close();
        }
    }

    public int getWishlistsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Wishlists> rt = cq.from(Wishlists.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
