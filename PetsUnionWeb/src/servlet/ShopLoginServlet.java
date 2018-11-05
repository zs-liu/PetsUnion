package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Objects;

import service.ShopService;

@WebServlet(name = "ShopLoginServlet")
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
        String name = request.getParameter("name");
        String password = request.getParameter("password");
        String returnPath = request.getParameter("returnPath");

        if (ShopService.loginCheck(name, password)) {

            HttpSession session = request.getSession();
            session.setAttribute("logged", name);

            request.getRequestDispatcher(
                    Objects.requireNonNullElse(returnPath, "/index.jsp")).forward(request, response);

        } else {
            request.setAttribute("errorMessage", "用户名或密码错误");
            request.getRequestDispatcher("/shopLogin.jsp").forward(request, response);
        }
    }

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
}
