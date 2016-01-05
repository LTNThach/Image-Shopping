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
import java.util.Iterator;
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
@WebServlet(name = "Search", urlPatterns = {"/Search"})
public class Search extends HttpServlet {
    
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
        Utils.storeLoginedUser(session, loginedUser);
        String strSearch = request.getParameter("strSearch");
        String category = request.getParameter("category");
        String errorString = (String) session.getAttribute("errorString");
        ArrayList<Photo> ListPContent = new ArrayList<Photo>();
        ArrayList<Photo> ListPImageName = new ArrayList<Photo>();
        ArrayList<Photo> ListPUsername = new ArrayList<Photo>();
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        ArrayList<Photo> ListInCart = null;
        ArrayList<Photo> ListLike = null;
        ArrayList<Photo> ListBuy = null;
        int Sum = 0;
        int IDUser = 0;
        ArrayList<Album> ListAlbumUserLogined = new ArrayList<Album>();
        ArrayList<Photo> ListPhotoOfUser = new ArrayList<Photo>();
        
        if (loginedUser != null)
        {
            errorString = null;
            IDUser = loginedUser.getIDU();
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
            
            if (ListAlbumUserLogined != null)
            {
                for (Album album : ListAlbumUserLogined)
                {
                    ListPhotoOfUser.addAll(DBUtils.LoadImage(conn, album.getIDA(), loginedUser.getIDU()));
                }
            }
        }
        
        if ("All".equals(category) || category == null)
        {
            ListPContent = DBUtils.SearchContent(conn, IDUser, strSearch);
            ListPImageName = DBUtils.SearchImageName(conn, IDUser, strSearch);
            ListPUsername = DBUtils.SearchUsername(conn, IDUser, strSearch);
            
            ListPhoto = (ArrayList<Photo>) ListPContent.clone();
            
            ListPImageName.removeAll(ListPhoto);
            ListPhoto.addAll(ListPImageName);
            
            ListPUsername.removeAll(ListPhoto);
            ListPhoto.addAll(ListPUsername);
        }
        else
        {
            ArrayList<Photo> ListPCategory = DBUtils.SearchCategories(conn, IDUser, category);
            ListPContent = DBUtils.SearchContent(conn, IDUser, strSearch);
            ListPImageName = DBUtils.SearchImageName(conn, IDUser, strSearch);
            ListPUsername = DBUtils.SearchUsername(conn, IDUser, strSearch);
            
            ListPhoto = (ArrayList<Photo>) ListPContent.clone();
            
            ListPImageName.removeAll(ListPhoto);
            ListPhoto.addAll(ListPImageName);
            
            ListPUsername.removeAll(ListPhoto);
            ListPhoto.addAll(ListPUsername);
            
            if (!strSearch.isEmpty())
            {
                for (Iterator<Photo> it = ListPhoto.iterator(); it.hasNext(); )
                {
                    Photo p = it.next();
                    if (!ListPCategory.contains(p))
                    {
                        it.remove();
                    }
                }
            }
            else
            {
                ListPhoto = (ArrayList<Photo>) ListPCategory.clone();
            }
        }
        
        String sort = request.getParameter("SortBy");
        if (null != sort)
        {
            switch (sort) 
            {
                case "View":
                    ListPhoto.sort(new Home.ComparatorView());
                    break;
                case "Purchase":
                    ListPhoto.sort(new Home.ComparatorPurchase());
                    break;
                case "Point":
                    ListPhoto.sort(new Home.ComparatorPoint());
                    break;
                 case "Like":
                    ListPhoto.sort(new Home.ComparatorLike());
                    break;
                default:
                    break;
            }
        }
        
        request.setAttribute("strSearch", strSearch);
        request.setAttribute("category", category);
        request.setAttribute("ListPhoto", ListPhoto);
        request.setAttribute("ListBuy", ListBuy);
        request.setAttribute("ListLike", ListLike);
        
        request.setAttribute("errorString", errorString);
        request.setAttribute("ListPhotoOfUser", ListPhotoOfUser);
        request.setAttribute("ListInCart", ListInCart);
        request.setAttribute("Sum", Sum);
        request.setAttribute("ListAlbumUserLogined", ListAlbumUserLogined);
        
        RequestDispatcher view = request.getRequestDispatcher("search.jsp");
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
