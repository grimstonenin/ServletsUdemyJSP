package main.java;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"/averageController"})
public class AverageController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int num1 = Integer.parseInt(req.getParameter("number1"));
        int num2 = Integer.parseInt(req.getParameter("number2"));

        AverageCalculator calculator = new AverageCalculator();

        int result = calculator.calculate(num1,num2);

        req.setAttribute("result",result);

        req.getRequestDispatcher("result.jsp").forward(req,resp);



    }
}
