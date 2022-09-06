package controller;

import model.Division;
import model.EducationDegree;
import model.Employee;
import model.Position;
import service.IDivisionService;
import service.IEducationDegreeService;
import service.IEmployeeService;
import service.IPositionService;
import service.impl.DivisionService;
import service.impl.EducationDegreeService;
import service.impl.EmployeeService;
import service.impl.PositionService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "EmployeeServlet", value = "/Employee")
public class EmployeeServlet extends HttpServlet {
    private IEmployeeService employeeService = new EmployeeService();
    private IDivisionService divisionService = new DivisionService();
    private IEducationDegreeService degreeService = new EducationDegreeService();
    private IPositionService positionService = new PositionService();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showCreateForm(request, response);
                break;
            case "view":
                viewEmployee(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "delete":
                deleteEmployee(request,response);
                break;
            case "search":
                searchEmployee(request,response);
                break;
            default:
                showListEmployee(request, response);
        }
    }

    private void searchEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String address = request.getParameter("addressSearch");
        String phone = request.getParameter("phoneSearch");

        List<Employee> employeeList = employeeService.search(name,address,phone);
        List<EducationDegree> educationDegreeList = degreeService.findAll();
        List<Position> positionList = positionService.findAll();
        List<Division>divisionList = divisionService.findAll();
        request.setAttribute("employeeList",employeeList);
        request.setAttribute("educationDegreeList",educationDegreeList);
        request.setAttribute("positionList",positionList);
        request.setAttribute("divisionList",divisionList);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee/employeeList.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = employeeService.deleteEmployee(id);
        String mess = "delete failed";;
        if (check){
            mess = "successful delete ";
        }
        request.setAttribute("mess",mess);
        showListEmployee(request,response);
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        List<EducationDegree> educationDegrees = degreeService.findAll();
        List<Position> positions = positionService.findAll();
        List<Division> divisions = divisionService.findAll();
        Employee employee = employeeService.findById(id);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("employee", employee);
            dispatcher = request.getRequestDispatcher("/employee/update.jsp");
            request.setAttribute("educationDegreeList", educationDegrees);
            request.setAttribute("positionList", positions);
            request.setAttribute("divisionList", divisions);

        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void viewEmployee(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = divisionService.findAll();
        List<EducationDegree> educationDegreeList = degreeService.findAll();
        List<Position> positionList = positionService.findAll();
        int id = Integer.parseInt(request.getParameter("id"));
        Employee employee = employeeService.findById(id);
        RequestDispatcher dispatcher;
        if (employee == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("employee", employee);
            request.setAttribute("divisionList", divisionList);
            request.setAttribute("educationDegreeList", educationDegreeList);
            request.setAttribute("positionList", positionList);
            dispatcher = request.getRequestDispatcher("employee/view.jsp");
            try {
                dispatcher.forward(request, response);
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }
    }

    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<Division> divisionList = divisionService.findAll();
        List<EducationDegree> educationDegreeList = degreeService.findAll();
        List<Position> positionList = positionService.findAll();
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("employee/create.jsp");
        request.setAttribute("divisionList", divisionList);
        request.setAttribute("educationDegreeList", educationDegreeList);
        request.setAttribute("positionList", positionList);
        try {
            requestDispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void showListEmployee(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("employee/employeeList.jsp");
        List<Employee> employees = employeeService.findAll();
        List<Division> divisions = divisionService.findAll();
        List<EducationDegree> educationDegrees = degreeService.findAll();
        List<Position> positions = positionService.findAll();
        request.setAttribute("employeeList", employees);
        request.setAttribute("divisionList", divisions);
        request.setAttribute("educationDegreeList", educationDegrees);
        request.setAttribute("positionList", positions);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                createEmployee(request, response);
                break;
            case "update":
                updateEmployee(request,response);
                break;
            default:
                break;

        }
    }

    private void updateEmployee(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));

        Employee employee= new Employee(id,name,dateOfBirth,idCard,salary,phone,email,address,position,educationDegree,division);

        boolean check = employeeService.updateEmployee(employee);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/employee/update.jsp");
        String mess = "Update Employee successfully.";
        if (!check){
            mess = "Update Employee failed.";
        }
        request.setAttribute("mess",mess);
        request.setAttribute("check",check);
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void createEmployee(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String dateOfBirth = request.getParameter("dateOfBirth");
        String idCard = request.getParameter("idCard");
        double salary = Double.parseDouble(request.getParameter("salary"));
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int position = Integer.parseInt(request.getParameter("position"));
        int educationDegree = Integer.parseInt(request.getParameter("educationDegree"));
        int division = Integer.parseInt(request.getParameter("division"));

        Employee employee = new Employee(name, dateOfBirth, idCard, salary, phone, email, address, position, educationDegree, division);
        boolean check = employeeService.createEmployee(employee);
        String mess = "thêm mới thành công";
        if (!check) {
            mess = "thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);


    }
}
