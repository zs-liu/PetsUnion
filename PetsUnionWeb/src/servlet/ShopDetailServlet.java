package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import tools.StaticPara.ShopDetailServletPara;

@WebServlet(name = "ShopDetailServlet")
public class ShopDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(request.getParameter("flag"));
        if (flag == ShopDetailServletPara.fullFlag) {
            int shopID = Integer.parseInt(request.getParameter("shopID"));
            int petCategory = Integer.parseInt(request.getParameter("petCategory"));
            int serviceCategory = Integer.parseInt(request.getParameter("serviceCategory"));

            
        } else if (flag == ShopDetailServletPara.scheduleFlag) {

        } else if (flag == ShopDetailServletPara.updateFlag) {

        } else {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
