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
import sit.model.ProductCategories;

/**
 *
 * @author Firsty
 */
public class ProductCategoriesJpaController implements Serializable {

    public ProductCategoriesJpaController(UserTransaction utx, EntityManagerFactory emf) {
        this.utx = utx;
        this.emf = emf;
    }
    private UserTransaction utx = null;
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public void create(ProductCategories productCategories) throws PreexistingEntityException, RollbackFailureException, Exception {
        if (productCategories.getProductsList() == null) {
            productCategories.setProductsList(new ArrayList<Products>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<Products> attachedProductsList = new ArrayList<Products>();
            for (Products productsListProductsToAttach : productCategories.getProductsList()) {
                productsListProductsToAttach = em.getReference(productsListProductsToAttach.getClass(), productsListProductsToAttach.getProductId());
                attachedProductsList.add(productsListProductsToAttach);
            }
            productCategories.setProductsList(attachedProductsList);
            em.persist(productCategories);
            for (Products productsListProducts : productCategories.getProductsList()) {
                ProductCategories oldProductCategotyidOfProductsListProducts = productsListProducts.getProductCategotyid();
                productsListProducts.setProductCategotyid(productCategories);
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
            if (findProductCategories(productCategories.getCategoryId()) != null) {
                throw new PreexistingEntityException("ProductCategories " + productCategories + " already exists.", ex);
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(ProductCategories productCategories) throws IllegalOrphanException, NonexistentEntityException, RollbackFailureException, Exception {
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            ProductCategories persistentProductCategories = em.find(ProductCategories.class, productCategories.getCategoryId());
            List<Products> productsListOld = persistentProductCategories.getProductsList();
            List<Products> productsListNew = productCategories.getProductsList();
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
            productCategories.setProductsList(productsListNew);
            productCategories = em.merge(productCategories);
            for (Products productsListNewProducts : productsListNew) {
                if (!productsListOld.contains(productsListNewProducts)) {
                    ProductCategories oldProductCategotyidOfProductsListNewProducts = productsListNewProducts.getProductCategotyid();
                    productsListNewProducts.setProductCategotyid(productCategories);
                    productsListNewProducts = em.merge(productsListNewProducts);
                    if (oldProductCategotyidOfProductsListNewProducts != null && !oldProductCategotyidOfProductsListNewProducts.equals(productCategories)) {
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
                Integer id = productCategories.getCategoryId();
                if (findProductCategories(id) == null) {
                    throw new NonexistentEntityException("The productCategories with id " + id + " no longer exists.");
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
            ProductCategories productCategories;
            try {
                productCategories = em.getReference(ProductCategories.class, id);
                productCategories.getCategoryId();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The productCategories with id " + id + " no longer exists.", enfe);
            }
            List<String> illegalOrphanMessages = null;
            List<Products> productsListOrphanCheck = productCategories.getProductsList();
            for (Products productsListOrphanCheckProducts : productsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This ProductCategories (" + productCategories + ") cannot be destroyed since the Products " + productsListOrphanCheckProducts + " in its productsList field has a non-nullable productCategotyid field.");
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            em.remove(productCategories);
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

    public List<ProductCategories> findProductCategoriesEntities() {
        return findProductCategoriesEntities(true, -1, -1);
    }

    public List<ProductCategories> findProductCategoriesEntities(int maxResults, int firstResult) {
        return findProductCategoriesEntities(false, maxResults, firstResult);
    }

    private List<ProductCategories> findProductCategoriesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(ProductCategories.class));
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

    public ProductCategories findProductCategories(Integer id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(ProductCategories.class, id);
        } finally {
            em.close();
        }
    }

    public int getProductCategoriesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<ProductCategories> rt = cq.from(ProductCategories.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
