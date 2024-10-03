package repositories;

import jakarta.persistence.EntityManager;
import models.User;
import utils.DatabaseConnect;

import java.util.HashMap;
import java.util.List;

public class UserRepositoryImpl implements UserRepository {

    private EntityManager entityManager;

    public UserRepositoryImpl() {
        this.entityManager = DatabaseConnect.getInstance().getEntityManager();
    }

    @Override
    public HashMap<String, User> findAll() {
        List<User> userList = entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
        HashMap<String, User> users = new HashMap<>();
        for (User user : userList) {
            users.put(String.valueOf(user.getId()), user);
        }
        return users;
    }

    @Override
    public User findById(int id) {
        return entityManager.find(User.class, id);
    }

    @Override
    public void create(User user) {
        try {
            entityManager.getTransaction().begin();
            entityManager.persist(user);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void update(User user) {
        try {
            entityManager.getTransaction().begin();
            entityManager.merge(user);
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }
    }

    @Override
    public void delete(int id) {
        try {
            entityManager.getTransaction().begin();
            User user = entityManager.find(User.class, id);
            if (user != null) {
                entityManager.remove(user);
            }
            entityManager.getTransaction().commit();
        } catch (Exception e) {
            entityManager.getTransaction().rollback();
            e.printStackTrace();
        }
    }
}
