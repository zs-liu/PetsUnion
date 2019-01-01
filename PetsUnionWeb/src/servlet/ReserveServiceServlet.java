package servlet;

import org.json.JSONObject;
import tools.StaticPara.SqlPara;
import service.ReservationService;
import tools.URICoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "ReserveServiceServlet")
public class ReserveServiceServlet extends HttpServlet {

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String returnPath = URICoder.getURLDecoderString(request.getParameter("returnPath"));
        String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
        String userId = URICoder.getURLDecoderString(request.getParameter("userId"));
        String petsOwnerTel = request.getParameter("petsOwnerTel");
        String petsType = URICoder.getURLDecoderString(request.getParameter("petsType"));
        String serviceType = URICoder.getURLDecoderString(request.getParameter("serviceType"));
        String serBeginTime = URICoder.getURLDecoderString(request.getParameter("serBeginTime"));
        String serEndTime = URICoder.getURLDecoderString(request.getParameter("serEndTime"));
        String comment = URICoder.getURLDecoderString(request.getParameter("comment"));

        int result = ReservationService.insert(shopName, userId, petsOwnerTel, petsType, serviceType,
                serBeginTime, serEndTime, comment);

        JSONObject jsonResponse = new JSONObject();
        if (result ==  SqlPara.success) {
            jsonResponse.put("errorMessage", "Success");
            if (returnPath != null) {
                jsonResponse.put("returnPath", returnPath);
            } else {
                jsonResponse.put("returnPath", "/index.jsp");
            }
        } else if (result == SqlPara.sqlError) {
            jsonResponse.put("errorMessage", "SqlError");
            jsonResponse.put("returnPath", "/404.jsp");
        } else if (result == SqlPara.invalid) {
            jsonResponse.put("errorMessage", "Invalid");
            jsonResponse.put("returnPath", "/reserveService.jsp");
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
