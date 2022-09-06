package repository;


import model.Customer;
import model.Employee;

import java.util.List;

public interface IEmployeeRepository {
    List<Employee> findAll();

    boolean createEmployee(Employee employee);

    boolean deleteEmployee(int id);

    Employee findById(int id);

    boolean updateEmployee(Employee employee);


    List<Employee> search(String nameSearch, String addressSearch, String phoneSearch);
}
