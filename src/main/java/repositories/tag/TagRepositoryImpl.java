package repositories.tag;

import models.Tag;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Persistence;

import java.util.List;

public class TagRepositoryImpl implements TagRepository {
    private EntityManagerFactory entityManagerFactory;
    private EntityManager entityManager;

    public TagRepositoryImpl() {
        this.entityManagerFactory = Persistence.createEntityManagerFactory("postgres");
        this.entityManager = entityManagerFactory.createEntityManager();
    }

    @Override
    public Tag create(Tag tag) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            entityManager.persist(tag);
            transaction.commit();
            return tag;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public Tag findById(Long id) {
        return entityManager.find(Tag.class, id);
    }

    @Override
    public List<Tag> findAll() {
        return entityManager.createQuery("SELECT t FROM Tag t", Tag.class).getResultList();
    }

    @Override
    public Tag update(Tag tag) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Tag updatedTag = entityManager.merge(tag);
            transaction.commit();
            return updatedTag;
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
            return null;
        }
    }

    @Override
    public void delete(Long id) {
        EntityTransaction transaction = entityManager.getTransaction();
        try {
            transaction.begin();
            Tag tag = findById(id);
            if (tag != null) {
                entityManager.remove(tag);
            }
            transaction.commit();
        } catch (Exception e) {
            if (transaction.isActive()) {
                transaction.rollback();
            }
            e.printStackTrace();
        }
    }

    @Override
    public List<Tag> findByName(String name) {
        return entityManager.createQuery("SELECT t FROM Tag t WHERE LOWER(t.name) = LOWER(:name)", Tag.class)
                .setParameter("name", name)
                .getResultList();
    }

    public void close() {
        if (entityManager != null) {
            entityManager.close();
        }
        if (entityManagerFactory != null) {
            entityManagerFactory.close();
        }
    }
}
