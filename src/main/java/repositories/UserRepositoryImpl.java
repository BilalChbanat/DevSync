package repositories;

import models.User;
import utils.DatabaseConnect;
import jakarta.persistence.EntityManager;
import jakarta.persistence.TypedQuery;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private EntityManager em;

    public UserRepositoryImpl() {
        this.em = DatabaseConnect.getInstance().getEntityManager();
    }

    @Override
    public List<User> findAll() {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
        return query.getResultList();
    }

    @Override
    public User findById(Long id) {
        return em.find(User.class, id);
    }

    @Override
    public User create(User user) {
        em.getTransaction().begin();
        em.persist(user);
        em.getTransaction().commit();
        return user;
    }

    @Override
    public User update(User user) {
        em.getTransaction().begin();
        User updatedUser = em.merge(user);
        em.getTransaction().commit();
        return updatedUser;
    }

    @Override
    public void delete(Long id) {
        em.getTransaction().begin();
        User user = em.find(User.class, id);
        if (user != null) {
            em.remove(user);
        }
        em.getTransaction().commit();
    }

    @Override
    public User findByName(String name) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.name = :name", User.class);
        query.setParameter("name", name);
        List<User> results = query.getResultList();
        return results.isEmpty() ? null : results.get(0);
    }

    @Override
    public List<User> findByManager(Boolean manager) {
        TypedQuery<User> query = em.createQuery("SELECT u FROM User u WHERE u.manager = :manager", User.class);
        query.setParameter("manager", manager);
        return query.getResultList();
    }
}