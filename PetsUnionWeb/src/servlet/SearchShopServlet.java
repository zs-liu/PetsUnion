package servlet;

import bean.ShopBean;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ShopService;
import tools.StaticPara.ShowPara;
import tools.URICoder;

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
        String petsType = URICoder.getURLDecoderString(request.getParameter("petsType"));
        String serviceType = URICoder.getURLDecoderString(request.getParameter("serviceType"));
        int pageNumber = Integer.parseInt(request.getParameter("page"));

        int perPage = ShowPara.perPage;
        if (request.getParameter("perPage") != null) {
            perPage = Integer.parseInt(request.getParameter("perPage"));
        }

        List<ShopBean> shopList = ShopService.getShop(petsType, serviceType, pageNumber, perPage);
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
