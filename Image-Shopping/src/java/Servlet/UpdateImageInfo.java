/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.Photo;
import Class.Utilisateur;
import Utils.DBUtils;
import Utils.Utils;
import java.io.IOException;
import java.sql.Connection;
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
@WebServlet(name = "UpdateImageInfo", urlPatterns = {"/UpdateImageInfo"})
public class UpdateImageInfo extends HttpServlet {
    
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
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        int IDP = Integer.parseInt(request.getParameter("IDP"));
        Photo p = DBUtils.GetInfoPhoto(conn, IDP);
        String strIDA = request.getParameter("IDA");
        int IDA = 0;
        if (strIDA != null && !strIDA.isEmpty())
        {
            IDA = Integer.parseInt(strIDA);
            if (IDA == p.getIDA())
            {
                IDA = 0;
            }
        }
        String name = request.getParameter("name");
        if (name == null || name.isEmpty())
        {
            name = null;
        }
        String theloai = request.getParameter("theloai");
        if (theloai == null || theloai.isEmpty() || "NoChange".equals(theloai))
        {
            theloai = null;
        }
        String noidung = request.getParameter("noidung");
        if (noidung == null || noidung.isEmpty())
        {
            noidung = null;
        }
        String strGia = request.getParameter("gia");
        int gia = 0;
        if (strGia != null && !strGia.isEmpty())
        {
            gia = Integer.parseInt(strGia);
        }
        
        int check = DBUtils.UpdatePhotoInfo(conn, loginedUser.getIDU(), IDP, IDA, name, theloai, noidung, gia);
        String errorString = null;
        if (check == 0)
        {
            errorString = "Can not change image's info (SQL Problem).";
        }
        session.setAttribute("errorString", errorString);
        
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
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
