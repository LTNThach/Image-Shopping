/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.Utilisateur;
import Utils.DBUtils;
import Utils.SQLServerConnUtils;
import Utils.Utils;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
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
@WebServlet(name = "Validate", urlPatterns = {"/Validate"})
public class Validate extends HttpServlet {
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
        int IDUser = Integer.parseInt((String) request.getParameter("IDUser"));
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        
        if (conn == null)
        {
            try 
            {
                conn = SQLServerConnUtils.GetConnection();
            } catch (ClassNotFoundException | SQLException ex) 
            {
                System.out.println(ex.toString());
            }
            Utils.storeConnection(session, conn);
        }
        
        Utilisateur user = DBUtils.GetUserInfo(conn, IDUser);
       
        session.setAttribute("user", user);
        
        RequestDispatcher view = request.getRequestDispatcher("validate.jsp");
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
        String errorString = null;
        Utilisateur user = (Utilisateur) session.getAttribute("user");
        String password = request.getParameter("password");
        String epassword = user.getMotdePasse();
        
        if (epassword.equals(password))
        {
            session.setAttribute("user", user);
            response.sendRedirect(request.getContextPath() + "/ChangePass");
        }
        else
        {
            errorString = "Your password entered is not match the password in email.";
            session.setAttribute("errorString", errorString);
            String referer = request.getHeader("Referer");
            response.sendRedirect(referer);
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
