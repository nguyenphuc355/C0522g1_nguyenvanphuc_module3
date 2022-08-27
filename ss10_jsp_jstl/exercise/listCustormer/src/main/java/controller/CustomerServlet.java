package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "customerServlet", value = "/customerServlet")
public class CustomerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Customer> customerList = new ArrayList<>();
        customerList.add(new Customer("Huỳnh văn nam", "10-11-1993", "Quảng nam", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoh6z3u_vHE8ko5AtKCaEdcP7OYKtpWrkogQ&usqp=CAU"));
        customerList.add(new Customer("Huỳnh văn nam", "10-11-1993", "Quảng nam", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoh6z3u_vHE8ko5AtKCaEdcP7OYKtpWrkogQ&usqp=CAU"));
        customerList.add(new Customer("Huỳnh văn nam", "10-11-1993", "Quảng nam", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoh6z3u_vHE8ko5AtKCaEdcP7OYKtpWrkogQ&usqp=CAU"));
        customerList.add(new Customer("Huỳnh văn nam", "10-11-1993", "Quảng nam", "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRoh6z3u_vHE8ko5AtKCaEdcP7OYKtpWrkogQ&usqp=CAU"));

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/display.jsp");
        request.setAttribute("customerList", customerList);
        requestDispatcher.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
