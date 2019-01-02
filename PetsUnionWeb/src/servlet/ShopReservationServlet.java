package servlet;

import bean.ReservationBean;
import org.json.JSONArray;
import org.json.JSONObject;
import service.ReservationService;
import tools.StaticPara.ReservationStatusPara;
import tools.URICoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet(name = "ShopReservationServlet")
public class ShopReservationServlet extends HttpServlet {

    public ShopReservationServlet() {
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
        String shopName = URICoder.getURLDecoderString(request.getParameter("shopName"));
        int status = Integer.parseInt(request.getParameter("status"));
        if (status == ReservationStatusPara.toDo || status == ReservationStatusPara.haveDone
                || status == ReservationStatusPara.confirm || status == ReservationStatusPara.delete) {
            List<ReservationBean> reservationList = ReservationService.searchForShop(shopName, status);

            JSONObject json = new JSONObject();
            JSONArray reservationJsonList = new JSONArray();

            for (ReservationBean reservation : reservationList) {
                reservationJsonList.put(reservation.toJSON());
            }
            json.put("reservation", reservationJsonList);
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(json.toString());
        } else {
            JSONObject jsonResponse = new JSONObject();
            jsonResponse.put("errorMessage", "InvalidReservationStatus");
            jsonResponse.put("returnPath", "/404.jsp");
            response.setCharacterEncoding("utf-8");
            PrintWriter out = response.getWriter();
            out.println(jsonResponse.toString());
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
