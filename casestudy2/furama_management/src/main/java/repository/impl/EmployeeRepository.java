package repository.impl;

import model.Customer;
import model.Employee;
import repository.BaseRepository;
import repository.IEmployeeRepository;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EmployeeRepository implements IEmployeeRepository {
    private final String SELECT_EMPLOYEE = "select * from employee where is_delete=0;";

    private final String INSERT_EMPLOYEE = "insert into employee(employee_name, employee_birthday, employee_id_card, " +
            "employee_salary, employee_phone, employee_email, employee_address, position_id, education_degree_id, division_id)\n" +
            "values (?,?,?,?,?,?,?,?,?,?);";

    private final String FIND_BY_ID = "select * from employee where employee_id = ?;";

    private final String UPDATE_EMPLOYEE = "update employee set employee_name = ?,employee_birthday =?,employee_id_card =?," +
            "employee_salary = ?,employee_phone =?,employee_email =?,employee_address =?," +
            "position_id =?,education_degree_id =?,division_id =? where employee_id =?;";

    private final String DELETE_EM = "delete from employee where employee_id = ?;";

    private final String SEARCH_EMPLOYEE = "select * from employee where employee_name like ? and employee_address like ? and employee_phone like ? and is_delete = 0;";

    @Override
    public List<Employee> findAll() {
        List<Employee> employees = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(SELECT_EMPLOYEE);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");//lấy dữ liệu từ sql, phải đúng tên trong bảng
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int positionId = resultSet.getInt("position_id");
                int educationDegreeId = resultSet.getInt("education_degree_id");
                int divisionId = resultSet.getInt("division_id");

                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, positionId, educationDegreeId, divisionId);
                employees.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employees;
    }

    @Override
    public boolean createEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(INSERT_EMPLOYEE);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getBirthday());
            statement.setString(3, employee.getIdCard());
            statement.setDouble(4, employee.getSalary());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getAddress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            int num = statement.executeUpdate();
            return (num == 1);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return false;
    }

    @Override
    public boolean deleteEmployee(int id) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(DELETE_EM);
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public Employee findById(int id) {
        Employee employee = null;
        Connection connection = BaseRepository.getConnectDB();
        try {
            CallableStatement callableStatement = connection.prepareCall(FIND_BY_ID);
            callableStatement.setInt(1, id);
            System.out.println(callableStatement);
            ResultSet resultSet = callableStatement.executeQuery();
            while (resultSet.next()) {
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int position = resultSet.getInt("position_id");
                int educationDegree = resultSet.getInt("education_degree_id");
                int division = resultSet.getInt("division_id");
                employee = new Employee(id,name, birthday, idCard, salary, phone, email, address, position, educationDegree, division);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employee;
    }

    @Override
    public boolean updateEmployee(Employee employee) {
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement statement = connection.prepareStatement(UPDATE_EMPLOYEE);
            statement.setString(1, employee.getName());
            statement.setString(2, employee.getBirthday());
            statement.setString(3, employee.getIdCard());
            statement.setDouble(4, employee.getSalary());
            statement.setString(5, employee.getPhone());
            statement.setString(6, employee.getEmail());
            statement.setString(7, employee.getAddress());
            statement.setInt(8, employee.getPositionId());
            statement.setInt(9, employee.getEducationDegreeId());
            statement.setInt(10, employee.getDivisionId());
            statement.setInt(11, employee.getId());

            return statement.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    @Override
    public List<Employee> search(String nameSearch, String addressSearch, String phoneSearch) {
        List<Employee> employeeList = new ArrayList<>();
        Connection connection = BaseRepository.getConnectDB();
        try {
            PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_EMPLOYEE);
            preparedStatement.setString(1, "%" + nameSearch + "%");
            preparedStatement.setString(2, "%" + addressSearch + "%");
            preparedStatement.setString(3, "%" + phoneSearch + "%");
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                int id = resultSet.getInt("employee_id");
                String name = resultSet.getString("employee_name");
                String birthday = resultSet.getString("employee_birthday");
                String idCard = resultSet.getString("employee_id_card");
                double salary = resultSet.getDouble("employee_salary");
                String phone = resultSet.getString("employee_phone");
                String email = resultSet.getString("employee_email");
                String address = resultSet.getString("employee_address");
                int position = resultSet.getInt("position_id");
                int educationDegree = resultSet.getInt("education_degree_id");
                int division = resultSet.getInt("division_id");
                Employee employee = new Employee(id, name, birthday, idCard, salary, phone, email, address, position, educationDegree, division);
                employeeList.add(employee);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return employeeList;
    }
}
