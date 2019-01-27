import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.DoubleSummaryStatistics;

public class BmiServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String weight = request.getParameter("weight");
        String height = request.getParameter("height");

        double bim = calculateBIM(Double.parseDouble(height),Double.parseDouble(weight));
        String result;
        if(bim < 18.5){
            result = "体重过低";
        }else if(bim < 24){
            result = "正常范围";
        }else if(bim < 28) {
            result = "肥胖前期";
        }else if(bim < 30){
            result = "II肥胖";
        }else{
            result = "I肥胖";
        }

        request.setAttribute("bim",bim);
        request.setAttribute("result",result);
        response.setHeader("BMI",String.valueOf(bim));
        RequestDispatcher dispatcher = request.getRequestDispatcher("index.jsp");
        dispatcher.forward(request,response);
    }

    private double calculateBIM(double v, double v1) {
        return v1/(v*v);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
