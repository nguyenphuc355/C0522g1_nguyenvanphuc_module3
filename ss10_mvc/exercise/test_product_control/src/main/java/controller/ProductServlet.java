package controller;

import model.Product;
import service.IProductService;
import service.impl.ProductService;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "ProductServlet", value = "/Product")
public class ProductServlet extends HttpServlet {
    private IProductService productService = new ProductService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null){
            action ="";
        }
        switch (action){
            case "create":
                break;
            case "edit":
                break;
            case "search":
                searchByName(request,response);
                break;
        }
    }

    private void searchByName(HttpServletRequest request, HttpServletResponse response) {
        List<Product> products = new ArrayList<>();
        String name = request.getParameter("name");
        for (Product product :productService.findAll()) {
            if (product.getName().contains(name)){
                products.add(product);
            }
        }
        request.setAttribute("products",products);
        RequestDispatcher requestDispatcher = request.getRequestDispatcher("view/search.jsp");
        try {
            requestDispatcher.forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
