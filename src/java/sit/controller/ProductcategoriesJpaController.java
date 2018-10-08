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
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import sit.controller.exceptions.IllegalOrphanException;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.Productcategories;

/**
 *
 * @author Firsty
 */
public class ProductcategoriesJpaController implements Serializable {

    public ProductcategoriesJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(Productcategories productcategories) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (productcategories.getProductsList() == null) {
            productcategories.setProductsList(new ArrayList<Products>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Products> attachedProductsList = new ArrayList<Products>();
            for (Products productsListProductsToAttach : productcategories.getProductsList()) {
                productsListProductsToAttach = em.getReference(productsListProductsToAttach.getClass(), productsListProductsToAttach.getProductId());
                attachedProductsList.add(productsListProductsToAttach);
            }
            productcategories.setProductsList(attachedProductsList);
            em.persist(productcategories);
            for (Products productsListProducts : productcategories.getProductsList()) {
                Productcategories oldProductCategotyidOfProductsListProducts = productsListProducts.getProductCategotyid();
                productsListProducts.setProductCategotyid(productcategories);
                productsListProducts = em.merge(productsListProducts);
                if (oldProductCategotyidOfProductsListProducts != null) {
                    oldProductCategotyidOfProductsListProducts.getProductsList().remove(productsListProducts);
                    oldProductCategotyidOfProductsListProducts = em.merge(oldProductCategotyidOfProductsListProducts);
                }
            }
            utx.commit();
        } catch (Exception ex) {
            try {
                utx.rollback();
            } catch (Exception re) {
                throw new RollbackFailureException("An error occurred attempting to roll back the transaction.", re);
            }
            if (findProductcategories(productcategories.getCategoryId()) != null) {
                throw new PreexistingEntityException("Productcategories " + productcategories + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(Productcategories productcategories) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            Productcategories persistentProductcategories = em.find(Productcategories.class, productcategories.getCategoryId());
            List<Products> productsListOld = persistentProductcategories.getProductsList();
            List<Products> productsListNew = productcategories.getProductsList();
            List<String> illegalOrphanMessages = null;
            for (Products productsListOldProducts : productsListOld) {
                if (!productsListNew.contains(productsListOldProducts)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain Products " + productsListOldProducts + " since its productCategotyid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<Products> attachedProductsListNew = new ArrayList<Products>();
            for (Products productsListNewProductsToAttach : productsListNew) {
                productsListNewProductsToAttach = em.getReference(productsListNewProductsToAttach.getClass(), productsListNewProductsToAttach.getProductId());
                attachedProductsListNew.add(productsListNewProductsToAttach);
            }
            productsListNew = attachedProductsListNew;
            productcategories.setProductsList(productsListNew);
            productcategories = em.merge(productcategories);
            for (Products productsListNewProducts : productsListNew) {
                if (!productsListOld.contains(productsListNewProducts)) {
                    Productcategories oldProductCategotyidOfProductsListNewProducts = productsListNewProducts.getProductCategotyid();
                    productsListNewProducts.setProductCategotyid(productcategories);
                    productsListNewProducts = em.merge(productsListNewProducts);
                    if (oldProductCategotyidOfProductsListNewProducts != null && !oldProductCategotyidOfProductsListNewProducts.equals(productcategories)) {
                        oldProductCategotyidOfProductsListNewProducts.getProductsList().remove(productsListNewProducts);
                        oldProductCategotyidOfProductsListNewProducts = em.merge(oldProductCategotyidOfProductsListNewProducts);
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
                Integer id = productcategories.getCategoryId();
                if (findProductcategories(id) == null) {
                    throw new NonexistentEntityException("The productcategories with id " + id + " no longer exists.");
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
            Productcategories productcategories;
            try {
                productcategories = em.getReference(Productcategories.class, id);
                productcategories.getCategoryId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The productcategories with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Products> productsListOrphanCheck = productcategories.getProductsList();
            for (Products productsListOrphanCheckProducts : productsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Productcategories (" + productcategories + ") cannot be destroyed since the Products " + productsListOrphanCheckProducts + " in its productsList field has a non-nullable productCategotyid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(productcategories);
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

    public List<Productcategories> findProductcategoriesEntities() {
        return findProductcategoriesEntities(true, -1, -1);
    }

    public List<Productcategories> findProductcategoriesEntities(int maxResults, int firstResult) {
        return findProductcategoriesEntities(false, maxResults, firstResult);
    }

    private List<Productcategories> findProductcategoriesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(Productcategories.class));
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

    public Productcategories findProductcategories(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(Productcategories.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductcategoriesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<Productcategories> rt = cq.from(Productcategories.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
