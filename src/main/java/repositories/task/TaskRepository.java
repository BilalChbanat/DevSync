package repositories.task;

import models.Task;
import java.util.List;

public interface TaskRepository {

    void create(Task task);
    Task findById(Long id);
    List<Task> findAll();
    void update(Task task);
    void delete(Long id);
    List<Task> findByStatus(String status);
    List<Task> findByAssignedUser(Long userId);
}
