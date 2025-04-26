package Controller;

import Models.inforTransaction.Transaction;
import Models.inforTransaction.TransactionHistory;
import Services.ServiceProduct;
import Services.ServiceTransactionHistory;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet(
        value = "/transactionHistory"
)
public class displayTransactionHistory extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        Transaction transaction = new Transaction();
        ServiceTransactionHistory serviceTransactionHistory = new ServiceTransactionHistory();

           try {
        HttpSession session = req.getSession(true);
               Integer idUser = (Integer) session.getAttribute("idUser");
               if (idUser == null) {
                   resp.sendRedirect("Account/login.jsp");
                   return;
               }
            serviceTransactionHistory.selectTransactionHistory(idUser,transaction);
            session.setAttribute("transactions", transaction);
            req.getRequestDispatcher("getWish").forward(req, resp);



        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

         }
    }

