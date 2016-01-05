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
@WebServlet(name = "ViewImage", urlPatterns = {"/ViewImage"})
public class ViewImage extends HttpServlet {

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
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        int IDP = Integer.parseInt(request.getParameter("IDP"));
        Photo photo = DBUtils.GetInfoPhoto(conn, IDP);
        String errorString = (String) session.getAttribute("errorString");
        
        DBUtils.UpdateView(conn, IDP);
        
        ArrayList<Photo> ListInCart = null;
        ArrayList<Photo> ListLike = null;
        ArrayList<Photo> ListBuy = null;
        int Sum = 0;
        ArrayList<Album> ListAlbumUserLogined = new ArrayList<Album>();
        
        if (loginedUser != null)
        {
            errorString = null;
            ListLike = DBUtils.SearchPhotoAime(conn, loginedUser.getIDU());
            ListBuy = DBUtils.SearchPhotoAchete(conn, loginedUser.getIDU());
            ListInCart = DBUtils.SearchPhoto(conn, loginedUser.getIDU());
            ListAlbumUserLogined = DBUtils.LoadListAlbum(conn, loginedUser.getIDU());
            
            if (ListInCart != null)
            {
                for (Photo p : ListInCart)
                {
                    Sum = Sum + p.getPrix();
                }
            }
            
            ArrayList<Album> ListAlbum = DBUtils.LoadListAlbum(conn, loginedUser.getIDU());
            ArrayList<Photo> ListPhotoOfUser = new ArrayList<Photo>();

            if (ListAlbum != null)
            {
                for (Album album : ListAlbum)
                {
                    ListPhotoOfUser.addAll(DBUtils.LoadImage(conn, album.getIDA(), loginedUser.getIDU()));
                }
            }
            
            if (ListPhotoOfUser != null)
            {
                ListBuy.removeAll(ListPhotoOfUser);
                ListBuy.addAll(ListPhotoOfUser);
            }
        }
        
        request.setAttribute("photo", photo);
        request.setAttribute("ListBuy", ListBuy);
        request.setAttribute("ListLike", ListLike);
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("ListInCart", ListInCart);
        request.setAttribute("Sum", Sum);
        request.setAttribute("ListAlbumUserLogined", ListAlbumUserLogined);
        
        RequestDispatcher view = request.getRequestDispatcher("viewimage.jsp");
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
