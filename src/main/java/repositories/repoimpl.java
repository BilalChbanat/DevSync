package repositories;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import models.User;

import java.util.List;

public class repoimpl implements  repo {
    private EntityManagerFactory emf;

    public repoimpl() {
        this.emf = Persistence.createEntityManagerFactory("postgres");
    }

    @Override
    public List<User> getAll() {
        EntityManager entityManager = emf.createEntityManager();
        try {
            return entityManager.createQuery("SELECT u FROM User u", User.class).getResultList();
        } finally {
            entityManager.close();
        }
    }

}
