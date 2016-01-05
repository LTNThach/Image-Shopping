/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.Album;
import Class.Photo;
import Class.Utilisateur;
import Utils.DBUtils;
import Utils.Utils;
import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
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
@WebServlet(name = "ViewUser", urlPatterns = {"/ViewUser"})
public class ViewUser extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        int IDU = Integer.parseInt(request.getParameter("IDU"));
        Utilisateur user = DBUtils.GetUserInfo(conn, IDU);
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        ArrayList<Album> ListAlbum = DBUtils.LoadListAlbum(conn, IDU);
        user.setListAlbum(ListAlbum);
        String errorString = (String) session.getAttribute("errorString");      
        ArrayList<Photo> ListInCart = null;
        int Sum = 0;
        ArrayList<Album> ListAlbumUserLogined = new ArrayList<Album>();
        
         if (loginedUser != null)
        {
            errorString = null;
            ListAlbumUserLogined = DBUtils.LoadListAlbum(conn, loginedUser.getIDU());
            ListInCart = DBUtils.SearchPhoto(conn, loginedUser.getIDU());
            
            if (ListInCart != null)
            {
                for (Photo p : ListInCart)
                {
                    Sum = Sum + p.getPrix();
                }
            }
        }
        
        request.setAttribute("ListAlbum", ListAlbum);
        request.setAttribute("user", user);
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("ListInCart", ListInCart);
        request.setAttribute("Sum", Sum);
        request.setAttribute("ListAlbumUserLogined", ListAlbumUserLogined);
        
        RequestDispatcher view = request.getRequestDispatcher("viewuser.jsp");
        view.forward(request, response);
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
