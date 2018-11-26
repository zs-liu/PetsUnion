package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

import service.ShopService;
import tools.StaticPara.ShopDetailServletPara;
import bean.ServiceBean;

@WebServlet(name = "ShopDetailServlet")
public class ShopDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(request.getParameter("flag"));
        if (flag == ShopDetailServletPara.fullFlag) {
            String shopName = request.getParameter("shopName");
            String petsType = request.getParameter("petsType");
            String serviceType = request.getParameter("serviceType");
            List<ServiceBean> serviceList= ShopService.getServicesByShop(shopName,petsType,serviceType);
        } else if (flag == ShopDetailServletPara.updateFlag) {
            String shopName = request.getParameter("shopName");

        } else {

        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
