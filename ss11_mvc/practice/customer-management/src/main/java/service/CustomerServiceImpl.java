package service;

import model.Customer;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class CustomerServiceImpl implements ICustomerService {
    private static Map<Integer, Customer> customerMap ;
    static {
        customerMap = new HashMap<>();
        customerMap.put(1,new Customer(1,"Nam","NamHuynh@gmail.com","Quảng Nam"));
        customerMap.put(2,new Customer(2,"Tý","NamHuynh@gmail.com","Quảng Nam"));
        customerMap.put(3,new Customer(3,"Thuyên","NamHuynh@gmail.com","Quảng Nam"));
        customerMap.put(4,new Customer(4,"Lợi","NamHuynh@gmail.com","Quảng Nam"));
        customerMap.put(5,new Customer(5,"Trí","NamHuynh@gmail.com","Quảng Nam"));
    }

    @Override
    public List<Customer> findAll() {
        return new ArrayList<>(customerMap.values());
    }

    @Override
    public void save(Customer customer) {
        customerMap.put(customer.getId(),customer);
    }

    @Override
    public Customer findById(int id) {
        return customerMap.get(id);
    }

    @Override
    public void update(int id, Customer customer) {
        customerMap.put(id,customer);
    }

    @Override
    public void remove(int id) {
        customerMap.remove(id);
    }
}
