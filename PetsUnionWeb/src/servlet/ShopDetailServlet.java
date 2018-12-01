package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.JSONObject;
import org.json.JSONArray;

import bean.ShopBean;
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
            List<ServiceBean> serviceList = ShopService.getServicesByShop(shopName, petsType, serviceType);

            JSONObject json = new JSONObject();

            JSONArray serviceJsonList = new JSONArray();
            for (ServiceBean service : serviceList) {
                serviceJsonList.put(service.toJSON());
            }

            json.put("service", serviceJsonList);
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(json.toString());

        } else if (flag == ShopDetailServletPara.updateFlag) {
            String shopName = request.getParameter("shopName");
            ShopBean shop = ShopService.getServicesByShop(shopName);

            JSONObject json = shop.toJSON();

            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(json.toString());
        } else {
            request.setAttribute("errorMessage", "InvalidRequest");
            request.getRequestDispatcher("/404.jsp").forward(request, response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
