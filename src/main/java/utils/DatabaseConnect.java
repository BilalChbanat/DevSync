package utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DatabaseConnect {

    private static final String PERSISTENCE_UNIT_NAME = "postgres";  // Make sure this matches your persistence.xml configuration
    private static DatabaseConnect instance;
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;

    // Private constructor for Singleton pattern
    private DatabaseConnect() {
        entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        entityManager = entityManagerFactory.createEntityManager();
    }

    // Singleton getInstance method
    public static DatabaseConnect getInstance() {
        if (instance == null) {
            synchronized (DatabaseConnect.class) {
                if (instance == null) {
                    instance = new DatabaseConnect();
                }
            }
        }
        return instance;
    }

    // Return the EntityManager
    public EntityManager getEntityManager() {
        return entityManager;
    }

    // Close the EntityManager and EntityManagerFactory
    public void closeEntityManager() {
        if (entityManager != null) {
            entityManager.close();
        }
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
