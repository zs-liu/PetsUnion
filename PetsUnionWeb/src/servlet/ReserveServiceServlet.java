package servlet;

import tools.StaticPara.SqlPara;
import service.ReservationService;
import tools.URICoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String returnPath = request.getParameter("returnPath");
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

        if (result ==  SqlPara.success) {
            if (returnPath != null) {
                request.getRequestDispatcher(returnPath).forward(request, response);
            } else {
                request.getRequestDispatcher("/index.jsp").forward(request, response);
            }
        } else if (result == SqlPara.sqlError) {
            request.setAttribute("errorMessage", "SqlError");
            request.getRequestDispatcher("/404.jsp").forward(request, response);
        } else if (result == SqlPara.invalid) {
            request.setAttribute("errorMessage", "Invalid");
            request.getRequestDispatcher("/reserveService.jsp").forward(request, response);
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
