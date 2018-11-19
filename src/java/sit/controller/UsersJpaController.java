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
import sit.model.AccountHistory;
import java.util.ArrayList;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.transaction.UserTransaction;
import sit.controller.exceptions.IllegalOrphanException;
import sit.controller.exceptions.NonexistentEntityException;
import sit.controller.exceptions.PreexistingEntityException;
import sit.controller.exceptions.RollbackFailureException;
import sit.model.OrderDetails;
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
        if (users.getAccountHistoryList() == null) {
            users.setAccountHistoryList(new ArrayList<AccountHistory>());
        }
        if (users.getOrderDetailsList() == null) {
            users.setOrderDetailsList(new ArrayList<OrderDetails>());
        }
        EntityManager em = null;
        try {
            utx.begin();
            em = getEntityManager();
            List<AccountHistory> attachedAccountHistoryList = new ArrayList<AccountHistory>();
            for (AccountHistory accountHistoryListAccountHistoryToAttach : users.getAccountHistoryList()) {
                accountHistoryListAccountHistoryToAttach = em.getReference(accountHistoryListAccountHistoryToAttach.getClass(), accountHistoryListAccountHistoryToAttach.getHistoryid());
                attachedAccountHistoryList.add(accountHistoryListAccountHistoryToAttach);
            }
            users.setAccountHistoryList(attachedAccountHistoryList);
            List<OrderDetails> attachedOrderDetailsList = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListOrderDetailsToAttach : users.getOrderDetailsList()) {
                orderDetailsListOrderDetailsToAttach = em.getReference(orderDetailsListOrderDetailsToAttach.getClass(), orderDetailsListOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsList.add(orderDetailsListOrderDetailsToAttach);
            }
            users.setOrderDetailsList(attachedOrderDetailsList);
            em.persist(users);
            for (AccountHistory accountHistoryListAccountHistory : users.getAccountHistoryList()) {
                Users oldHistoryUseridOfAccountHistoryListAccountHistory = accountHistoryListAccountHistory.getHistoryUserid();
                accountHistoryListAccountHistory.setHistoryUserid(users);
                accountHistoryListAccountHistory = em.merge(accountHistoryListAccountHistory);
                if (oldHistoryUseridOfAccountHistoryListAccountHistory != null) {
                    oldHistoryUseridOfAccountHistoryListAccountHistory.getAccountHistoryList().remove(accountHistoryListAccountHistory);
                    oldHistoryUseridOfAccountHistoryListAccountHistory = em.merge(oldHistoryUseridOfAccountHistoryListAccountHistory);
                }
            }
            for (OrderDetails orderDetailsListOrderDetails : users.getOrderDetailsList()) {
                Users oldDetailUseridOfOrderDetailsListOrderDetails = orderDetailsListOrderDetails.getDetailUserid();
                orderDetailsListOrderDetails.setDetailUserid(users);
                orderDetailsListOrderDetails = em.merge(orderDetailsListOrderDetails);
                if (oldDetailUseridOfOrderDetailsListOrderDetails != null) {
                    oldDetailUseridOfOrderDetailsListOrderDetails.getOrderDetailsList().remove(orderDetailsListOrderDetails);
                    oldDetailUseridOfOrderDetailsListOrderDetails = em.merge(oldDetailUseridOfOrderDetailsListOrderDetails);
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
            List<AccountHistory> accountHistoryListOld = persistentUsers.getAccountHistoryList();
            List<AccountHistory> accountHistoryListNew = users.getAccountHistoryList();
            List<OrderDetails> orderDetailsListOld = persistentUsers.getOrderDetailsList();
            List<OrderDetails> orderDetailsListNew = users.getOrderDetailsList();
            List<String> illegalOrphanMessages = null;
            for (AccountHistory accountHistoryListOldAccountHistory : accountHistoryListOld) {
                if (!accountHistoryListNew.contains(accountHistoryListOldAccountHistory)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain AccountHistory " + accountHistoryListOldAccountHistory + " since its historyUserid field is not nullable.");
                }
            }
            for (OrderDetails orderDetailsListOldOrderDetails : orderDetailsListOld) {
                if (!orderDetailsListNew.contains(orderDetailsListOldOrderDetails)) {
                    if (illegalOrphanMessages == null) {
                        illegalOrphanMessages = new ArrayList<String>();
                    }
                    illegalOrphanMessages.add("You must retain OrderDetails " + orderDetailsListOldOrderDetails + " since its detailUserid field is not nullable.");
                }
            }
            if (illegalOrphanMessages != null) {
                throw new IllegalOrphanException(illegalOrphanMessages);
            }
            List<AccountHistory> attachedAccountHistoryListNew = new ArrayList<AccountHistory>();
            for (AccountHistory accountHistoryListNewAccountHistoryToAttach : accountHistoryListNew) {
                accountHistoryListNewAccountHistoryToAttach = em.getReference(accountHistoryListNewAccountHistoryToAttach.getClass(), accountHistoryListNewAccountHistoryToAttach.getHistoryid());
                attachedAccountHistoryListNew.add(accountHistoryListNewAccountHistoryToAttach);
            }
            accountHistoryListNew = attachedAccountHistoryListNew;
            users.setAccountHistoryList(accountHistoryListNew);
            List<OrderDetails> attachedOrderDetailsListNew = new ArrayList<OrderDetails>();
            for (OrderDetails orderDetailsListNewOrderDetailsToAttach : orderDetailsListNew) {
                orderDetailsListNewOrderDetailsToAttach = em.getReference(orderDetailsListNewOrderDetailsToAttach.getClass(), orderDetailsListNewOrderDetailsToAttach.getDetailid());
                attachedOrderDetailsListNew.add(orderDetailsListNewOrderDetailsToAttach);
            }
            orderDetailsListNew = attachedOrderDetailsListNew;
            users.setOrderDetailsList(orderDetailsListNew);
            users = em.merge(users);
            for (AccountHistory accountHistoryListNewAccountHistory : accountHistoryListNew) {
                if (!accountHistoryListOld.contains(accountHistoryListNewAccountHistory)) {
                    Users oldHistoryUseridOfAccountHistoryListNewAccountHistory = accountHistoryListNewAccountHistory.getHistoryUserid();
                    accountHistoryListNewAccountHistory.setHistoryUserid(users);
                    accountHistoryListNewAccountHistory = em.merge(accountHistoryListNewAccountHistory);
                    if (oldHistoryUseridOfAccountHistoryListNewAccountHistory != null && !oldHistoryUseridOfAccountHistoryListNewAccountHistory.equals(users)) {
                        oldHistoryUseridOfAccountHistoryListNewAccountHistory.getAccountHistoryList().remove(accountHistoryListNewAccountHistory);
                        oldHistoryUseridOfAccountHistoryListNewAccountHistory = em.merge(oldHistoryUseridOfAccountHistoryListNewAccountHistory);
                    }
                }
            }
            for (OrderDetails orderDetailsListNewOrderDetails : orderDetailsListNew) {
                if (!orderDetailsListOld.contains(orderDetailsListNewOrderDetails)) {
                    Users oldDetailUseridOfOrderDetailsListNewOrderDetails = orderDetailsListNewOrderDetails.getDetailUserid();
                    orderDetailsListNewOrderDetails.setDetailUserid(users);
                    orderDetailsListNewOrderDetails = em.merge(orderDetailsListNewOrderDetails);
                    if (oldDetailUseridOfOrderDetailsListNewOrderDetails != null && !oldDetailUseridOfOrderDetailsListNewOrderDetails.equals(users)) {
                        oldDetailUseridOfOrderDetailsListNewOrderDetails.getOrderDetailsList().remove(orderDetailsListNewOrderDetails);
                        oldDetailUseridOfOrderDetailsListNewOrderDetails = em.merge(oldDetailUseridOfOrderDetailsListNewOrderDetails);
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
            List<AccountHistory> accountHistoryListOrphanCheck = users.getAccountHistoryList();
            for (AccountHistory accountHistoryListOrphanCheckAccountHistory : accountHistoryListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Users (" + users + ") cannot be destroyed since the AccountHistory " + accountHistoryListOrphanCheckAccountHistory + " in its accountHistoryList field has a non-nullable historyUserid field.");
            }
            List<OrderDetails> orderDetailsListOrphanCheck = users.getOrderDetailsList();
            for (OrderDetails orderDetailsListOrphanCheckOrderDetails : orderDetailsListOrphanCheck) {
                if (illegalOrphanMessages == null) {
                    illegalOrphanMessages = new ArrayList<String>();
                }
                illegalOrphanMessages.add("This Users (" + users + ") cannot be destroyed since the OrderDetails " + orderDetailsListOrphanCheckOrderDetails + " in its orderDetailsList field has a non-nullable detailUserid field.");
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
            System.out.println(e);
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
