package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import service.ShopService;
import tools.StaticPara.LoginRegisterPara;

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
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String tel = request.getParameter("tel");
        String returnPath = request.getParameter("returnPath");
        int result = ShopService.registerCheck(id, name, password, tel);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("registered", name);

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
