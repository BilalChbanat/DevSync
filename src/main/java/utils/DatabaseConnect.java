package utils;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class DatabaseConnect {

    private static final String PERSISTENCE_UNIT_NAME = "postgres";
    private static DatabaseConnect instance;
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;

    private DatabaseConnect() {
        entityManagerFactory = Persistence.createEntityManagerFactory(PERSISTENCE_UNIT_NAME);
        entityManager = entityManagerFactory.createEntityManager();
    }

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

    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void closeEntityManager() {
        if (entityManager != null) {
            entityManager.close();
        }
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
