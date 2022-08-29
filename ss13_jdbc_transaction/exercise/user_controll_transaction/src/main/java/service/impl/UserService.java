package service.impl;

import model.User;
import repository.IUserRepository;
import repository.impl.UserRepository;
import service.IUserService;

import java.util.List;

public class UserService implements IUserService {
    private IUserRepository repository = new UserRepository();

    @Override
    public List<User> findAll() {
        return repository.findAll();
    }

    @Override
    public boolean editUser(int id, User user) {
      return   repository.editUser(id,user);
    }

    @Override
    public boolean deleteUser(int id) {
     return repository.deleteUser(id);
    }

    @Override
    public boolean save(User user) {
    return repository.save(user);
    }

    @Override
    public List<User> findByName(String name) {
      return   repository.findByName(name);

    }

    @Override
    public User findById(int id) {
        return repository.findById(id);
    }

    @Override
    public List<User> sortByName() {
        return repository.sortByName();
    }



}
