package controller;

import model.Customer;
import model.CustomerType;
import service.ICustomerService;
import service.ICustomerTypeService;
import service.impl.CustomerService;
import service.impl.CustomerTypeService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/Customer")
public class CustomerServlet extends HttpServlet {
    private ICustomerService customerService = new CustomerService();
    private ICustomerTypeService customerTypeService = new CustomerTypeService();

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
            case "delete":
                deleteCustomer(request, response);
                break;
            case "update":
                showUpdateForm(request, response);
                break;
            case "view":
                viewCustomer(request,response);
                break;
            case "search":
                searchCustomer(request,response);
                break;
            default:
                showListCustomer(request, response);
        }
    }

    private void searchCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("nameSearch");
        String address = request.getParameter("addressSearch");
        String phone = request.getParameter("phoneSearch");
        List<Customer> customerList = customerService.find(name,address,phone);
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        request.setAttribute("customerList",customerList);
        request.setAttribute("customerTypeList",customerTypeList);
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customerList.jsp");
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void viewCustomer(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        int id = Integer.parseInt(request.getParameter("id"));
        Customer customer = customerService.findById(id);
        RequestDispatcher dispatcher;
        if (customer == null) {
            dispatcher = request.getRequestDispatcher("/error-404.jsp");
        } else {
            request.setAttribute("customer", customer);
            dispatcher = request.getRequestDispatcher("customer/view.jsp");
            request.setAttribute("customerTypeList",customerTypeList);
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showUpdateForm(HttpServletRequest request, HttpServletResponse response) {
       int id = Integer.parseInt(request.getParameter("id"));
       List<CustomerType> customerTypeList = customerTypeService.findAll();
       Customer customer = customerService.findById(id);
       RequestDispatcher dispatcher;
       if (customer == null){
           dispatcher = request.getRequestDispatcher("error-404.jsp");
       }else {
           request.setAttribute("customer",customer);
           dispatcher = request.getRequestDispatcher("/customer/update.jsp");
           request.setAttribute("customerTypeList",customerTypeList);
       }
        try {
            dispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }

    }

    private void deleteCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean check = customerService.deleteCustomer(id);
        String mess = " delete failed";
        if (check) {
            mess = "successful delete";
        }
        request.setAttribute("mess", mess);
        showListCustomer(request, response);

    }


    private void showCreateForm(HttpServletRequest request, HttpServletResponse response) {
        List<CustomerType> customerTypeList = customerTypeService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/create.jsp");
        request.setAttribute("customerTypeList",customerTypeList);
        try {
            dispatcher.forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void showListCustomer(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("customer/customerList.jsp");
        List<Customer> customers = customerService.findAll();
        List<CustomerType> customerTypes = customerTypeService.findAll();
        request.setAttribute("customerList", customers);
        request.setAttribute("customerTypeList", customerTypes);
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
                creatCustomer(request, response);
                break;
            case "update":
                updateCustomer(request,response);
                break;

        }
    }

    private void updateCustomer(HttpServletRequest request, HttpServletResponse response) {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerTypeId = Integer.parseInt(request.getParameter("customerTypeId"));
        Customer customer = new Customer(id,name,birthday,gender,idCard,phone,email,address,customerTypeId);
        boolean check =customerService.updateCustomer(id,customer);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("customer/update.jsp");
        String mess = "Update Employee successfully.";
        if (!check) {
            mess = "Update Employee failed.";
        }
        request.setAttribute("mess",mess);
        request.setAttribute("check",check);
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }

    private void creatCustomer(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name");
        String birthday = request.getParameter("dateOfBirth");
        int gender = Integer.parseInt(request.getParameter("gender"));
        String idCard = request.getParameter("idCard");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String address = request.getParameter("address");
        int customerType = Integer.parseInt(request.getParameter("customerType"));

        Customer customer = new Customer(name, birthday, gender, idCard, phone, email, address, customerType);
        boolean check = customerService.createCustomer(customer);
        String mess = "thêm mới thành công";
        if (!check) {
            mess = " thêm mới không thành công";
        }
        request.setAttribute("mess", mess);
        showCreateForm(request, response);
    }
}
