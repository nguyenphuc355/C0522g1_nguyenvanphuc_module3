package service;

import model.Customer;

import java.util.List;

public interface ICustomerService {
    List<Customer> findAll();

    boolean createCustomer(Customer customer);

    boolean deleteCustomer(int id);

    Customer findById(int id);

    boolean updateCustomer(int id, Customer customer);

    List<Customer> find(String name, String address, String phone);
}
