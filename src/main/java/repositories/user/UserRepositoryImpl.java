package repositories.user;

import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import models.User;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private EntityManagerFactory emf;

    public UserRepositoryImpl() {
        this.emf = Persistence.createEntityManagerFactory("postgres");
    }


    private void executeInTransaction(Runnable action) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        try {
            action.run();
            em.getTransaction().commit();
        } catch (Exception e) {
            em.getTransaction().rollback();
            throw e;
        } finally {
            em.close();
        }
    }



    @Override
    public User findById(Long id) {
        EntityManager em = emf.createEntityManager();
        try {
            return em.find(User.class, id);
        } finally {
            em.close();
        }
    }


    @Override
    public User create(User user) {
        EntityManager entityManager = emf.createEntityManager();
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            if (entityManager.getTransaction().isActive()) {
                entityManager.getTransaction().rollback();
            }
            throw e;
        } finally {
            entityManager.close();
        }
        return user;
    }


    @Override
    public User update(User user) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        em.merge(user);
        em.getTransaction().commit();
        em.close();
        return user;
    }


    @Override
    public void delete(Long userId) {
        EntityManager em = emf.createEntityManager();
        em.getTransaction().begin();
        User user = em.find(User.class, userId);
        if (user != null) {
            em.remove(user);
        }
        em.getTransaction().commit();
        em.close();
    }

    @Override
    public User findByName(String name) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.name = :name", User.class);
            query.setParameter("name", name);
            List<User> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            em.close();
        }
    }

    @Override
    public List<User> findByManager(Boolean manager) {
        EntityManager em = emf.createEntityManager();
        try {
            TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.manager = :manager", User.class);
            query.setParameter("manager", manager);
            return query.getResultList();
        } finally {
            em.close();
        }
    }


    @Override
    public List<User> findAll() {
        EntityManager entityManager = emf.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
        } finally {
            entityManager.close();
        }
    }
}
