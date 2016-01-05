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
@WebServlet(name = "ViewAlbum", urlPatterns = {"/ViewAlbum"})
public class ViewAlbum extends HttpServlet {

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
        ArrayList<Photo> ListPhotoOfUser = new ArrayList<Photo>();
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        Connection conn = Utils.getStoredConnection(session);
        int IDA = Integer.parseInt(request.getParameter("IDA"));
        int IDU = Integer.parseInt(request.getParameter("IDU"));
        String NomAlbum = request.getParameter("NomAlbum");
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        Utilisateur user = DBUtils.GetUserInfo(conn, IDU);
        String errorString = (String) session.getAttribute("errorString");
        ArrayList<Photo> ListInCart = null;
        int Sum = 0;
        ArrayList<Album> ListAlbumUserLogined = new ArrayList<Album>();
        
        if (loginedUser != null)
        {
            ListPhoto = DBUtils.LoadImage(conn, IDA, loginedUser.getIDU());
            ListPhotoOfUser = (ArrayList<Photo>) ListPhoto.clone();
            ListInCart = DBUtils.SearchPhoto(conn, loginedUser.getIDU());
            ListAlbumUserLogined = DBUtils.LoadListAlbum(conn, loginedUser.getIDU());
        }
        else
        {
            ListPhoto = DBUtils.LoadImage(conn, IDA, 0);
        }
        
        request.setAttribute("user", user);
        request.setAttribute("ListPhoto", ListPhoto);
        request.setAttribute("NomAlbum", NomAlbum);
        
        request.setAttribute("ListPhotoOfUser", ListPhotoOfUser);
        request.setAttribute("errorString", errorString);
        request.setAttribute("ListInCart", ListInCart);
        request.setAttribute("Sum", Sum);
        request.setAttribute("ListAlbumUserLogined", ListAlbumUserLogined);
        
        RequestDispatcher view = request.getRequestDispatcher("viewalbum.jsp");
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
