package service;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeService {
    List<CustomerType> findAll();

    boolean createCustomerType(CustomerType customerType);

    boolean deleteCustomerType(int id);
}
