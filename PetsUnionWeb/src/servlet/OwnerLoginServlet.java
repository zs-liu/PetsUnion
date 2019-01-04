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
import service.OwnerService;
import bean.OwnerBean;
import tools.StaticPara.LoginRegisterPara;
import tools.URICoder;

@WebServlet(name = "OwnerLoginServlet")
public class OwnerLoginServlet extends HttpServlet {

    public OwnerLoginServlet() {
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
        String userPw = URICoder.getURLDecoderString(request.getParameter("userPw"));
        String returnPath = request.getParameter("returnPath");

        OwnerBean owner = new OwnerBean(userId);
        owner.setOwnerPw(userPw);

        JSONObject jsonResponse = new JSONObject();
        int result = OwnerService.loginCheck(owner);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("loggedId", owner.getOwnerId());
            session.setAttribute("loggedName", owner.getOwnerName());
            session.setAttribute("loggedTel", owner.getOwnerTel());
            session.setAttribute("loggedType", "petsOwner");

            jsonResponse.put("errorMessage", "Success");
            if (returnPath != null) {
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("returnPath", "/index.jsp");
            }

        } else if (result == LoginRegisterPara.loginWrongPassword
                || result == LoginRegisterPara.invalid) {
            jsonResponse.put("errorMessage", "WrongPassword");
            jsonResponse.put("returnPath", "/ownerLogin.jsp");
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
