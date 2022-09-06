package repository;

import model.CustomerType;

import java.util.List;

public interface ICustomerTypeRepository {
    List<CustomerType> findAll();

    boolean createCustomerType(CustomerType customerType);

    boolean deleteCustomerType(int id);
}
