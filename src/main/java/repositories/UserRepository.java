package repositories;

import models.User;

import java.util.HashMap;

public interface UserRepository {
    HashMap<String, User> findAll();
    User findById(int id);
    void create(User user);
    void update(User user);
    void delete(int id);
}
