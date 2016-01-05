/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import Class.Album;
import Class.Utilisateur;
import Utils.Utils;
import Utils.DBUtils;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
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
@WebServlet(name = "LogIn", urlPatterns = {"/LogIn"})
public class LogIn extends HttpServlet {
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
        response.sendRedirect(request.getContextPath() + "/Home");
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
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        if ("administrator".equals(username) && "administrator".equals(password))
        {
            response.sendRedirect(request.getContextPath() + "/HomeAdmin");
            return;
        }
        
        String errorString = null;
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        
        int check = DBUtils.CheckUsernameAndPassword(conn, username, password);
        String referer = request.getHeader("Referer");
        
        switch (check) 
        {
            case 1:
                Utilisateur user = DBUtils.SearchUser(conn, username);
                ArrayList<Album> ListAlbum = DBUtils.LoadListAlbum(conn, user.getIDU());
                user.setListAlbum(ListAlbum);
                errorString = null; 
                session.setAttribute("errorString", errorString);
                Utils.storeLoginedUser(session, user);
                response.sendRedirect(referer);
                break;
            case 0:
                errorString = "Username or password is invalid."; 
                session.setAttribute("errorString", errorString);
                response.sendRedirect(referer);
                break;
            default:
                errorString = "Your account is not activated or has been locked by administrator.";
                session.setAttribute("errorString", errorString);
                response.sendRedirect(referer);
                break;
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
