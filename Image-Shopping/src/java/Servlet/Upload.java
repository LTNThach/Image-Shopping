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
import java.io.InputStream;
import java.sql.Connection;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Thach
 */
@MultipartConfig(maxFileSize = 16177215)
@WebServlet(name = "Upload", urlPatterns = {"/Upload"})
public class Upload extends HttpServlet {

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
        String errorString = null;
        HttpSession session = request.getSession();
        Connection conn = Utils.getStoredConnection(session);
        Utilisateur loginedUser = Utils.getLoginedUser(session);
        String strIDA = request.getParameter("IDA");
        
        int IDA = 0;
        if (strIDA != null)
        {
            IDA = Integer.parseInt(strIDA);
        }
        
        String tenalbum = request.getParameter("tenalbum");
        String name = request.getParameter("name");
        String theloai = request.getParameter("theloai");
        String noidung = request.getParameter("noidung");
        int gia = Integer.parseInt(request.getParameter("gia"));
        InputStream inputStream = null;
        
        Part filePart = request.getPart("photo");
        if (filePart != null) 
        {
            inputStream = filePart.getInputStream();
            String mimeType = filePart.getContentType();
            if ("image/png".equals(mimeType) || "image/jpg".equals(mimeType) || "image/jpeg".equals(mimeType))
            {
                if (strIDA != null)
                {
                    int check = DBUtils.InsertPhoto_1(conn, IDA, name, theloai, noidung, gia, inputStream, filePart.getSize());
                    if (check == 0)
                    {
                        errorString = "Can not insert photo (SQL Problem).";
                    }
                }
                else
                {
                    int check = DBUtils.InsertPhoto_2(conn, tenalbum, loginedUser.getIDU(), name, theloai, noidung, gia, inputStream, filePart.getSize());
                    if (check == 0)
                    {
                        errorString = "Can not insert photo (SQL Problem).";
                    }
                }
            }
            else
            {
                errorString = "Uploaded file must be png or jpg.";
            }
        }
        else
        {
            errorString = "Upload failed, please try again.";
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
