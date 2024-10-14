package repositories.task;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.PersistenceContext;
import models.Task;

import java.util.List;

public class TaskRepositoryImpl implements TaskRepository {

    @PersistenceContext
    private EntityManager entityManager;

    public void create(Task task) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback(); // Rollback the transaction on error
            }
            e.printStackTrace();
        }
    }

    public Task findById(Long id) {
        return entityManager.find(Task.class, id);
    }

    public List<Task> findAll() {
        return entityManager.createQuery("SELECT t FROM Task t", Task.class).getResultList();
    }

    public void update(Task task) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.merge(task);
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback(); // Rollback the transaction on error
            }
            e.printStackTrace();
        }
    }

    public void delete(Long id) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Task task = entityManager.find(Task.class, id);
            if (task != null) {
                entityManager.remove(task);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback(); // Rollback the transaction on error
            }
            e.printStackTrace();
        }
    }

    public List<Task> findByStatus(String status) {
        return entityManager.createQuery("SELECT t FROM Task t WHERE t.status = :status", Task.class)
                .setParameter("status", status)
                .getResultList();
    }

    public List<Task> findByAssignedUser(Long userId) {
        return entityManager.createQuery("SELECT t FROM Task t WHERE t.assignedTo.id = :userId", Task.class)
                .setParameter("userId", userId)
                .getResultList();
    }
}
