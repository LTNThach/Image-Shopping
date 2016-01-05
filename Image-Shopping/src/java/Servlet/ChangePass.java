/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import Class.Utilisateur;
import Utils.DBUtils;
import Utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thach
 */
@WebServlet(name = "ChangePass", urlPatterns = {"/ChangePass"})
public class ChangePass extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        RequestDispatcher view = request.getRequestDispatcher("changepass.jsp");
        view.forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        String errorString = null;
        String password = request.getParameter("password");
        String repassword = request.getParameter("repassword");
        int IDUser = user.getIDU();

        if (repassword.equals(password))
        {
            int check = DBUtils.ChangePassword(conn, IDUser, password);
            if (check == 0)
            {
                errorString = "Can not change password (SQL Problem).";
            }
            check = DBUtils.ChangeStatusUser(conn, IDUser, 1);
            if (check == 0)
            {
                errorString = "Can not change status user (SQL Problem).";
            }
            
            session.setAttribute("errorString", errorString);
            user = DBUtils.GetUserInfo(conn, IDUser);
            Utils.storeLoginedUser(session, user);
            session.setAttribute("message", "Your account is now activated. Please return to home page.");
            response.sendRedirect(request.getContextPath() + "/Congratulation");
        }
        else
        {
            errorString = "Your password re-entered is incorrect.";
            session.setAttribute("errorString", errorString);
            RequestDispatcher view = request.getRequestDispatcher("changepass.jsp");
            view.forward(request, response);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
