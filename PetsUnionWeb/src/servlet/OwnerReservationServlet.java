package servlet;

import bean.ReservationBean;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ReservationService;
import tools.StaticPara.ReservationStatusPara;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "OwnerReservationServlet")
public class OwnerReservationServlet extends HttpServlet {

    public OwnerReservationServlet() {
        super();
    }

    /**
     * @param request  request from jsp
     * @param response response to jsp
     * @throws ServletException servlet exception
     * @throws IOException      ioe exception
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String userId = request.getParameter("userId");
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == ReservationStatusPara.toDo || status == ReservationStatusPara.haveDone) {
            List<ReservationBean> reservationList = ReservationService.searchForShop(userId, status);

            JSONObject json = new JSONObject();
            JSONArray reservationJsonList = new JSONArray();

            for (ReservationBean reservation : reservationList) {
                reservationJsonList.put(reservation);
            }
            json.put("reservation", reservationJsonList);
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(json.toString());
        } else {
            request.setAttribute("errorMessage", "InvalidReservationStatus");
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
