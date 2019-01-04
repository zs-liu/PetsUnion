package servlet;

import service.ShopService;
import tools.StaticPara.ShopDetailUpdateServletPara;
import tools.StaticPara.SqlPara;
import tools.URICoder;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ShopDetailUpdateServlet")
public class ShopDetailUpdateServlet extends HttpServlet {

    public ShopDetailUpdateServlet() {
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
        JSONObject jsonResponse = new JSONObject();
        if (flag == ShopDetailUpdateServletPara.priceInsert || flag == ShopDetailUpdateServletPara.priceDelete) {
            String returnPath = request.getParameter("returnPath");
            String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
            JSONArray serviceTable = new JSONArray(URICoder.getURLDecoderString(request.getParameter("serviceTable")));
            //HttpSession session = request.getSession();
            //if (!session.getAttribute("shopName").equals(shopName)) return;
            for (int i = 0; i < serviceTable.length(); i++) {
                JSONObject service = serviceTable.getJSONObject(i);
                String serviceIntro = service.getString("serviceIntro");
                String serviceType = service.getString("serviceType");
                String petsType = service.getString("petsType");
                String price = service.getString("price");

                int result = -1;
                if (flag == ShopDetailUpdateServletPara.priceInsert) {
                    result = ShopService.updateServiceByShop(shopName, serviceIntro, serviceType, petsType, price);
                } else {
                    result = ShopService.deleteServiceByShop(shopName, serviceIntro, serviceType, petsType, price);
                }

                if (result == SqlPara.sqlError) {
                    jsonResponse.put("errorMessage", "SqlError");
                    jsonResponse.put("returnPath", "/404.jsp");
                    break;
                }
            }
            if (returnPath != null) {
                jsonResponse.put("errorMessage", "Success");
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("errorMessage", "Success");
                jsonResponse.put("returnPath", "/shopDetailUpdate.jsp");
            }

        } else if (flag == ShopDetailUpdateServletPara.basic) {
            String returnPath = request.getParameter("returnPath");
            String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
            String instruction = URICoder.getURLDecoderString(request.getParameter("instruction"));
            String shopImgUrl = request.getParameter(" shopImgUrl");
            String address = URICoder.getURLDecoderString(request.getParameter("address"));
            String shopHours = URICoder.getURLDecoderString(request.getParameter("shopHours"));
            String shopTel = request.getParameter("shopTel");
            //HttpSession session = request.getSession();
            //if (!session.getAttribute("shopName").equals(shopName)) return;

            int result = ShopService.updateInfoByShop(shopName, instruction, shopImgUrl, address, shopHours, shopTel);
            if (result == SqlPara.success) {
                jsonResponse.put("errorMessage", "Success");
                if (returnPath != null) {
                    jsonResponse.put("returnPath", returnPath);
                } else {
                    jsonResponse.put("returnPath", "/shopDetailUpdate.jsp");
                }
            } else if (result == SqlPara.sqlError) {
                jsonResponse.put("errorMessage", "SqlError");
                jsonResponse.put("returnPath", "/404.jsp");
            }

        } else {
            jsonResponse.put("errorMessage", "InvalidRequest");
            jsonResponse.put("returnPath", "/404.jsp");
        }
        response.setCharacterEncoding("utf-8");
        PrintWriter out = response.getWriter();
        out.println(jsonResponse.toString());
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
