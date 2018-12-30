package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.acl.Owner;

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

        int result = ShopService.registerCheck(owner, shop);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("registered", owner.getOwnerName());

            if (returnPath != null) {
                request.getRequestDispatcher(returnPath).forward(request, response);
            } else {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } else if (result == LoginRegisterPara.registerExistsName) {
            request.setAttribute("errorMessage", "NameExists");
            request.getRequestDispatcher("/shopRegister.jsp").forward(request, response);
        } else if (result == LoginRegisterPara.invalid) {
            request.setAttribute("errorMessage", "NameOrPasswordNull");
            request.getRequestDispatcher("/shopRegister.jsp").forward(request, response);
        } else if (result == LoginRegisterPara.sqlError) {
            request.setAttribute("errorMessage", "SqlError");
            request.getRequestDispatcher("/404.jsp").forward(request, response);
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
