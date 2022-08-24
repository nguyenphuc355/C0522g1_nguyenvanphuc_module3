import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "CalculatorServlet", value = "/CalculatorServlet")
public class CalculatorServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double fistOperator = Double.parseDouble(request.getParameter("fistOperand"));
        double secondOperator = Double.parseDouble(request.getParameter("secondOperand"));
        char operator = request.getParameter("operator").charAt(0);

        double addition = fistOperator + secondOperator;
        double subtraction = fistOperator - secondOperator;
        double multiplication = fistOperator * secondOperator;
        double division = fistOperator / secondOperator;
        

        RequestDispatcher requestDispatcher = request.getRequestDispatcher("/result.jsp");
        request.setAttribute("fistOperator",fistOperator);
        request.setAttribute("secondOperator",secondOperator);
        request.setAttribute("addition",addition);
        request.setAttribute("subtraction",subtraction);
        request.setAttribute("multiplication",multiplication);
        request.setAttribute("division",division);
        request.setAttribute("operator",operator);
        requestDispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
