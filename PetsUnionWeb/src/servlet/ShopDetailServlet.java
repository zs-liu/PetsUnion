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
import tools.URICoder;
import bean.ServiceBean;

@WebServlet(name = "ShopDetailServlet")
public class ShopDetailServlet extends HttpServlet {

    public ShopDetailServlet() {
        super();
    }

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int flag = Integer.parseInt(request.getParameter("flag"));
        if (flag == ShopDetailServletPara.fullFlag) {
            String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
            String petsType = URICoder.getURLDecoderString(request.getParameter("petsType"));
            String serviceType = URICoder.getURLDecoderString(request.getParameter("serviceType"));
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
            String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
            ShopBean shop = ShopService.getServicesByShop(shopName);

            if (shop == null) {
                JSONObject jsonResponse = new JSONObject();
                jsonResponse.put("errorMessage", "InvalidRequest");
                jsonResponse.put("returnPath", "/404.jsp");
                response.setCharacterEncoding("utf-8");
                PrintWriter out = response.getWriter();
                out.println(jsonResponse.toString());
                return;
            }

            JSONObject json = shop.toJSON();

            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(json.toString());

        } else {
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("errorMessage", "InvalidRequest");
            jsonResponse.put("returnPath", "/404.jsp");
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
        }
    }

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
