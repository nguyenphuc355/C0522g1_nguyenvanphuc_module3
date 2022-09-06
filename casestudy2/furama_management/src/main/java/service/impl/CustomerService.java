package service.impl;

import model.Customer;
import repository.ICustomerRepository;
import repository.impl.CustomerRepository;
import service.ICustomerService;

import java.util.List;

public class CustomerService implements ICustomerService {
    private ICustomerRepository repository = new CustomerRepository();

    @Override
    public List<Customer> findAll() {
        return repository.findAll();
    }

    @Override
    public boolean createCustomer(Customer customer) {
        return repository.createCustomer(customer);
    }

    @Override
    public boolean deleteCustomer(int id) {
        return repository.deleteCustomer(id);
    }

    @Override
    public Customer findById(int id) {
        return repository.findById(id);
    }

    @Override
    public boolean updateCustomer(int id, Customer customer) {
        return repository.updateCustomer(id,customer);
    }

    @Override
    public List<Customer> find(String name, String address, String phone) {
        return repository.find(name,address,phone);
    }

}
