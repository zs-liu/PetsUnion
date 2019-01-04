package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

import bean.OwnerBean;
import org.json.JSONObject;
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

        JSONObject jsonResponse = new JSONObject();
        int result = OwnerService.registerCheck(owner);

        if (result == LoginRegisterPara.success) {

            HttpSession session = request.getSession();
            session.setAttribute("registered", userId);

            jsonResponse.put("errorMessage", "Success");
            if (returnPath != null) {
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("returnPath", "/index.jsp");
            }

        } else if (result == LoginRegisterPara.registerExistsName) {
            jsonResponse.put("errorMessage", "IdExists");
            jsonResponse.put("returnPath","/ownerRegister.jsp");
        } else if (result == LoginRegisterPara.invalid) {
            jsonResponse.put("errorMessage", "NameOrPasswordNull");
            jsonResponse.put("returnPath","/ownerRegister.jsp");
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
        doGet(request, response);
    }
}
