package repository.impl;

import model.Customer;
import model.CustomerType;
import repository.BaseRepository;
import repository.ICustomerTypeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerTypeRepository implements ICustomerTypeRepository {
    private static final String FIND_ALL = "select * from customer_type;";
    private static final String FIND_BY_ID = "select * from customer_type  where customer_type_id = ?;";

    @Override
    public List<CustomerType> findAll() {
        List<CustomerType> customerTypes = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(FIND_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_type_id");
                String name = resultSet.getString("customer_type_name");
                CustomerType customerType = new CustomerType(id, name);
                customerTypes.add(customerType);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customerTypes;
    }

    @Override
    public boolean createCustomerType(CustomerType customerType) {
        return false;
    }

    @Override
    public boolean deleteCustomerType(int id) {
        return false;
    }
}

