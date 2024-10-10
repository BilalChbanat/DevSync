package repositories.user;

import models.User;
import java.util.List;

public interface UserRepository {
    List<User> findAll();
    User findById(Long id);
    User create(User user);
    User update(User user);
    void delete(Long id);
    User findByName(String name);
    List<User> findByManager(Boolean manager);
    User findByEmail(String email);


}