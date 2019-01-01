package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import org.json.JSONObject;
import service.ShopService;
import bean.OwnerBean;
import tools.StaticPara.LoginRegisterPara;
import tools.URICoder;

@WebServlet(name = "/ShopLoginServlet")
public class ShopLoginServlet extends HttpServlet {

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ShopLoginServlet() {
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
        String ownerPw = URICoder.getURLDecoderString(request.getParameter("ownerPw"));
        String returnPath = request.getParameter("returnPath");

        OwnerBean owner = new OwnerBean(ownerId);
        owner.setOwnerPw(ownerPw);

        JSONObject jsonResponse = new JSONObject();
        int result = ShopService.loginCheck(owner);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedId", owner.getOwnerId());
            session.setAttribute("loggedName", owner.getOwnerName());
            session.setAttribute("loggedTel", owner.getOwnerTel());
            session.setAttribute("shopName", owner.getShopName());
            session.setAttribute("loggedType", "shopOwner");

            jsonResponse.put("errorMessage", "Success");
            if (returnPath != null) {
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("returnPath", "/index.jsp");
            }

        } else if (result == LoginRegisterPara.loginWrongPassword
                || result == LoginRegisterPara.invalid) {
            jsonResponse.put("errorMessage", "WrongPassword");
            jsonResponse.put("returnPath", "/shopLogin.jsp");
        } else if (result == LoginRegisterPara.sqlError) {
            jsonResponse.put("errorMessage", "SqlError");
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
