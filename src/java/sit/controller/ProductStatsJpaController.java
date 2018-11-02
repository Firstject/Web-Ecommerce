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
import sit.model.ProductStats;
import sit.model.Products;
import sit.model.Users;

/**
 *
 * @author Firsty
 */
public class ProductStatsJpaController implements Serializable {

    public ProductStatsJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProductStats productStats) throws PreexistingEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Products productstatsProductid = productStats.getProductstatsProductid();
            if (productstatsProductid != null) {
                productstatsProductid = em.getReference(productstatsProductid.getClass(), productstatsProductid.getProductId());
                productStats.setProductstatsProductid(productstatsProductid);
            }
            Users productstatsUserid = productStats.getProductstatsUserid();
            if (productstatsUserid != null) {
                productstatsUserid = em.getReference(productstatsUserid.getClass(), productstatsUserid.getUserid());
                productStats.setProductstatsUserid(productstatsUserid);
            }
            em.persist(productStats);
            if (productstatsProductid != null) {
                productstatsProductid.getProductStatsList().add(productStats);
                productstatsProductid = em.merge(productstatsProductid);
            }
            if (productstatsUserid != null) {
                productstatsUserid.getProductStatsList().add(productStats);
                productstatsUserid = em.merge(productstatsUserid);
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProductStats(productStats.getProductstatsid()) != null) {
                throw new PreexistingEntityException("ProductStats " + productStats + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProductStats productStats) throws NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            ProductStats persistentProductStats = em.find(ProductStats.class, productStats.getProductstatsid());
            Products productstatsProductidOld = persistentProductStats.getProductstatsProductid();
            Products productstatsProductidNew = productStats.getProductstatsProductid();
            Users productstatsUseridOld = persistentProductStats.getProductstatsUserid();
            Users productstatsUseridNew = productStats.getProductstatsUserid();
            if (productstatsProductidNew != null) {
                productstatsProductidNew = em.getReference(productstatsProductidNew.getClass(), productstatsProductidNew.getProductId());
                productStats.setProductstatsProductid(productstatsProductidNew);
            }
            if (productstatsUseridNew != null) {
                productstatsUseridNew = em.getReference(productstatsUseridNew.getClass(), productstatsUseridNew.getUserid());
                productStats.setProductstatsUserid(productstatsUseridNew);
            }
            productStats = em.merge(productStats);
            if (productstatsProductidOld != null && !productstatsProductidOld.equals(productstatsProductidNew)) {
                productstatsProductidOld.getProductStatsList().remove(productStats);
                productstatsProductidOld = em.merge(productstatsProductidOld);
            }
            if (productstatsProductidNew != null && !productstatsProductidNew.equals(productstatsProductidOld)) {
                productstatsProductidNew.getProductStatsList().add(productStats);
                productstatsProductidNew = em.merge(productstatsProductidNew);
            }
            if (productstatsUseridOld != null && !productstatsUseridOld.equals(productstatsUseridNew)) {
                productstatsUseridOld.getProductStatsList().remove(productStats);
                productstatsUseridOld = em.merge(productstatsUseridOld);
            }
            if (productstatsUseridNew != null && !productstatsUseridNew.equals(productstatsUseridOld)) {
                productstatsUseridNew.getProductStatsList().add(productStats);
                productstatsUseridNew = em.merge(productstatsUseridNew);
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
                Integer id = productStats.getProductstatsid();
                if (findProductStats(id) == null) {
                    throw new NonexistentEntityException("The productStats with id " + id + " no longer exists.");
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
            ProductStats productStats;
            try {
                productStats = em.getReference(ProductStats.class, id);
                productStats.getProductstatsid();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The productStats with id " + id + " no longer exists.", enfe);
            }
            Products productstatsProductid = productStats.getProductstatsProductid();
            if (productstatsProductid != null) {
                productstatsProductid.getProductStatsList().remove(productStats);
                productstatsProductid = em.merge(productstatsProductid);
            }
            Users productstatsUserid = productStats.getProductstatsUserid();
            if (productstatsUserid != null) {
                productstatsUserid.getProductStatsList().remove(productStats);
                productstatsUserid = em.merge(productstatsUserid);
            }
            em.remove(productStats);
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

    public List<ProductStats> findProductStatsEntities() {
        return findProductStatsEntities(true, -1, -1);
    }

    public List<ProductStats> findProductStatsEntities(int maxResults, int firstResult) {
        return findProductStatsEntities(false, maxResults, firstResult);
    }

    private List<ProductStats> findProductStatsEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProductStats.class));
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

    public ProductStats findProductStats(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProductStats.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductStatsCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProductStats> rt = cq.from(ProductStats.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
