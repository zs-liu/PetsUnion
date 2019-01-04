package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.acl.Owner;

import org.json.JSONObject;
import service.ShopService;
import bean.OwnerBean;
import bean.ShopBean;
import tools.StaticPara.LoginRegisterPara;
import tools.URICoder;

@WebServlet(name = "ShopRegisterServlet")
public class ShopRegisterServlet extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopRegisterServlet() {
        super();
    }

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String ownerId = URICoder.getURLDecoderString(request.getParameter("ownerId"));
        String ownerName = URICoder.getURLDecoderString(request.getParameter("ownerName"));
        String ownerPw = URICoder.getURLDecoderString(request.getParameter("ownerPw"));
        String ownerTel = request.getParameter("ownerTel");
        String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
        String address = URICoder.getURLDecoderString(request.getParameter("address"));
        String returnPath = request.getParameter("returnPath");

        OwnerBean owner = new OwnerBean(ownerId);
        owner.setOwnerName(ownerName);
        owner.setOwnerPw(ownerPw);
        owner.setOwnerTel(ownerTel);

        ShopBean shop = new ShopBean(shopName);
        shop.setOwnerId(ownerId);
        shop.setAddress(address);

        JSONObject jsonResponse = new JSONObject();
        int result = ShopService.registerCheck(owner, shop);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("registered", owner.getOwnerName());

            jsonResponse.put("errorMessage", "Success");
            if (returnPath != null) {
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("returnPath", "/index.jsp");
            }

        } else if (result == LoginRegisterPara.registerExistsName) {
            jsonResponse.put("errorMessage", "IdExists");
            jsonResponse.put("returnPath","/shopRegister.jsp");
        } else if (result == LoginRegisterPara.registerExistsShop) {
            jsonResponse.put("errorMessage", "ShopExists");
            jsonResponse.put("returnPath","/shopRegister.jsp");
        } else if (result == LoginRegisterPara.invalid) {
            jsonResponse.put("errorMessage", "NameOrPasswordNull");
            jsonResponse.put("returnPath","/shopRegister.jsp");
        } else if (result == LoginRegisterPara.sqlError) {
            jsonResponse.put("errorMessage", "SqlError");
            jsonResponse.put("returnPath","/404.jsp");
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
