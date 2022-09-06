package repository.impl;

import model.Customer;
import repository.BaseRepository;
import repository.ICustomerRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CustomerRepository implements ICustomerRepository {
    private final String SELECT_ALL = "select * from customer where is_delete=0;";
    private final String INSERT_CUSTOMER = "insert into customer(customer_name, customer_birthday, customer_gender, " +
            "customer_id_card, customer_phone, customer_email, customer_address, customer_type_id) " +
            "values(?,?,?,?,?,?,?,?);";
    private final String DELETE_CUSTOMER = "call sp_delete_by_id(?);";
    private final String FIND_BY_ID = "select * from customer where customer_id = ?;";
    private final String UPDATE_CUSTOMER = "call sp_update_customer(?,?,?,?,?,?,?,?,?);";
    private final String FIND_CUSTOMER = "select * from customer where customer_name like ? and customer_address like ? and customer_phone like ? and is_delete = 0";


    @Override
    public List<Customer> findAll() {
        List<Customer> customers = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_ALL);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");//lấy dữ liệu từ sql, phải đúng tên trong bảng
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");

                Customer customer = new Customer(id, name, birthday, gender, idCard, phone, email, address, customerTypeId);
                customers.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customers;
    }

    @Override
    public boolean createCustomer(Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_CUSTOMER);
            statement.setString(1, customer.getName());
            statement.setString(2, customer.getBirthday());
            statement.setInt(3, customer.getGender());
            statement.setString(4, customer.getIdCard());
            statement.setString(5, customer.getPhone());
            statement.setString(6, customer.getEmail());
            statement.setString(7, customer.getAddress());
            statement.setInt(8, customer.getCustomerTypeId());
            int num = statement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public boolean deleteCustomer(int id) {
        boolean rowDelete = false;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_CUSTOMER);
            callableStatement.setInt(1, id);
            rowDelete = callableStatement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDelete;
    }

    @Override
    public Customer findById(int id) {
        Customer customer = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement statement = connection.prepareCall(FIND_BY_ID);
            statement.setInt(1, id);
            System.out.println(statement);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phone = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String address = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                customer = new Customer(id,name, birthday, gender, idCard, phone, email, address, customerTypeId);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return customer;
    }

    @Override
    public boolean updateCustomer(int id, Customer customer) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement statement = connection.prepareCall(UPDATE_CUSTOMER);
            statement.setInt(1, customer.getId());
            statement.setString(2, customer.getName());
            statement.setString(3, customer.getBirthday());
            statement.setInt(4, customer.getGender());
            statement.setString(5, customer.getIdCard());
            statement.setString(6, customer.getPhone());
            statement.setString(7, customer.getEmail());
            statement.setString(8, customer.getAddress());
            statement.setInt(9, customer.getCustomerTypeId());
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Customer> find(String name, String address, String phone) {
        List<Customer> customerList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(FIND_CUSTOMER);
            preparedStatement.setString(1, "%" + name + "%");
            preparedStatement.setString(2, "%" + address + "%");
            preparedStatement.setString(3, "%" + phone + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("customer_id");
                String nameCustomer = resultSet.getString("customer_name");
                String birthday = resultSet.getString("customer_birthday");
                int gender = resultSet.getInt("customer_gender");
                String idCard = resultSet.getString("customer_id_card");
                String phoneNumber = resultSet.getString("customer_phone");
                String email = resultSet.getString("customer_email");
                String customerAddress = resultSet.getString("customer_address");
                int customerTypeId = resultSet.getInt("customer_type_id");
                Customer customer = new Customer(id,nameCustomer,birthday,gender,idCard,phoneNumber,email,customerAddress,customerTypeId);
                customerList.add(customer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return customerList;
    }
}
