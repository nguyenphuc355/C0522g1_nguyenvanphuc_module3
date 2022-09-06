package service;

import model.Employee;

import java.util.List;

public interface IEmployeeService {
    List<Employee> findAll();

    boolean createEmployee(Employee employee);

    boolean deleteEmployee(int id);

    Employee findById(int id);

    boolean updateEmployee(Employee employee);

    List<Employee> search(String nameSearch, String addressSearch, String phoneSearch);

}
