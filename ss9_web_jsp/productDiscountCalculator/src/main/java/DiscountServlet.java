import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "DiscountServlet ", value = "/display-discount")
public class DiscountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String productDescription = request.getParameter("productDescription");
        double price = Double.parseDouble(request.getParameter("listPrice"));
        double discount = Double.parseDouble(request.getParameter("discountPercent"));

        double amount = price * discount * 0.01;
        double discountPrice = price - amount;

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("result.jsp");
        request.setAttribute("product", productDescription);
        request.setAttribute("amount", amount);
        request.setAttribute("discountPrice", discountPrice);

        requestDispatcher.forward(request, response);


    }
}
