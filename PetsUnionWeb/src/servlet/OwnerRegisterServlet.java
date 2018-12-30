package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import bean.OwnerBean;
import service.OwnerService;
import tools.StaticPara.LoginRegisterPara;
import tools.URICoder;

@WebServlet(name = "OwnerRegisterServlet")
public class OwnerRegisterServlet extends HttpServlet {

    public OwnerRegisterServlet() {
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
        String userId = URICoder.getURLDecoderString(request.getParameter("userId"));
        String userName = URICoder.getURLDecoderString(request.getParameter("userName"));
        String userPw = URICoder.getURLDecoderString(request.getParameter("userPw"));
        String userTel = request.getParameter("userTel");
        String returnPath = request.getParameter("returnPath");

        OwnerBean owner = new OwnerBean(userId);
        owner.setOwnerName(userName);
        owner.setOwnerPw(userPw);
        owner.setOwnerTel(userTel);

        int result = OwnerService.registerCheck(owner);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("registered", userId);

            if (returnPath != null) {
                request.getRequestDispatcher(returnPath).forward(request, response);
            } else {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } else if (result == LoginRegisterPara.registerExistsName) {
            request.setAttribute("errorMessage", "NameExists");
            request.getRequestDispatcher("/ownerRegister.jsp").forward(request, response);
        } else if (result == LoginRegisterPara.invalid) {
            request.setAttribute("errorMessage", "NameOrPasswordNull");
            request.getRequestDispatcher("/ownerRegister.jsp").forward(request, response);
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
        doGet(request, response);
    }
}
