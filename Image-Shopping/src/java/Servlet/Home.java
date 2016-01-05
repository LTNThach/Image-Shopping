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
import Utils.SQLServerConnUtils;
import Utils.Utils;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Comparator;
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
@WebServlet(name = "Home", urlPatterns = {"/Home"})
public class Home extends HttpServlet {
    
     public Home() {
       super();
   }
     
    static class ComparatorView implements Comparator<Photo> {
        @Override
        public int compare(Photo p1, Photo p2) {
            if ((p1.getNombreVu() - p2.getNombreVu()) != 0)
                return p1.getNombreVu() > p2.getNombreVu() ? -1:1;
            return 0;
        }
    }
    
    static class ComparatorPurchase implements Comparator<Photo> {
        @Override
        public int compare(Photo p1, Photo p2) {
            if ((p1.getNombreAchat() - p2.getNombreAchat()) != 0)
                return p1.getNombreAchat() > p2.getNombreAchat() ? -1:1;
            return 0;
        }
    }
    
    static class ComparatorLike implements Comparator<Photo> {
        @Override
        public int compare(Photo p1, Photo p2) {
            if ((p1.getNombreAimer() - p2.getNombreAimer()) != 0)
                return p1.getNombreAimer() > p2.getNombreAimer() ? -1:1;
            return 0;
        }
    }
    
    static class ComparatorPoint implements Comparator<Photo> {
        @Override
        public int compare(Photo p1, Photo p2) {
            if ((p1.getPoint() - p2.getPoint()) != 0)
                return p1.getPoint() > p2.getPoint() ? -1:1;
            return 0;
        }
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
        HttpSession session = request.getSession();
        String errorString = (String) session.getAttribute("errorString");
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        Connection conn = Utils.getStoredConnection(session);
        String sort = request.getParameter("SortBy");
        
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
        
        ArrayList<Photo> ListPhoto = DBUtils.SearchHotImage(conn);
        ArrayList<Utilisateur> ListUtilisateur = DBUtils.SearchHotUser(conn);
        ArrayList<Photo> ListInCart = null;
        ArrayList<Photo> ListLike = null;
        ArrayList<Photo> ListBuy = null;
        int Sum = 0;
        ArrayList<Album> ListAlbumUserLogined = new ArrayList<Album>();
        ArrayList<Photo> ListPhotoOfUser = new ArrayList<Photo>();
        
        if (loginedUser != null)
        {
            errorString = null;
            ListAlbumUserLogined = DBUtils.LoadListAlbum(conn, loginedUser.getIDU());
            ListLike = DBUtils.SearchPhotoAime(conn, loginedUser.getIDU());
            ListBuy = DBUtils.SearchPhotoAchete(conn, loginedUser.getIDU());
            ListInCart = DBUtils.SearchPhoto(conn, loginedUser.getIDU());
            
            if (ListInCart != null)
            {
                for (Photo p : ListInCart)
                {
                    Sum = Sum + p.getPrix();
                }
            }   

            if (ListAlbumUserLogined != null)
            {
                for (Album album : ListAlbumUserLogined)
                {
                    ListPhotoOfUser.addAll(DBUtils.LoadImage(conn, album.getIDA(), loginedUser.getIDU()));
                }
            }
        }
       
        request.setAttribute("ListUtilisateur", ListUtilisateur);
        request.setAttribute("ListPhoto", ListPhoto);
        request.setAttribute("ListBuy", ListBuy);
        request.setAttribute("ListLike", ListLike);
        
        request.setAttribute("ListPhotoOfUser", ListPhotoOfUser);
        request.setAttribute("errorString", errorString);
        request.setAttribute("ListInCart", ListInCart);
        request.setAttribute("Sum", Sum);
        request.setAttribute("ListAlbumUserLogined", ListAlbumUserLogined);
        
        RequestDispatcher view = request.getRequestDispatcher("home.jsp");
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
        doGet(request, response);
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
