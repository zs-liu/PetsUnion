package servlet;

import bean.ShopBean;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "SearchShopServlet")
public class SearchShopServlet extends HttpServlet {

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String petsType = request.getParameter("petsType");
        String serviceType = request.getParameter("serviceType");
        List<ShopBean> shopList = ShopService.getShop(petsType, serviceType);
        JSONObject json = new JSONObject();
        JSONArray shopJsonList = new JSONArray();

        for (ShopBean shop : shopList) {
            shopJsonList.put(shop.toJSON());
        }

        json.put("shop", shopJsonList);
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.println(json.toString());
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
