package repository;

import model.User;

import java.util.List;

public interface IUserRepository {
    List<User> findAll();

    boolean editUser(int id, User user);

    boolean deleteUser(int id);

    boolean save(User user);

    List<User> findByName(String name);

    User findById(int id);

    List<User> sortByName();

}
