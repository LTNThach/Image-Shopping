/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;

import Class.Photo;
import Utils.DBUtils;
import Utils.Utils;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLConnection;
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
@WebServlet(name = "Download", urlPatterns = {"/Download"})
public class Download extends HttpServlet {

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
        int IDP = Integer.parseInt(request.getParameter("IDP"));
        
        Photo photo = DBUtils.GetInfoPhoto(conn, IDP);
        
        byte[] byteArr = photo.getData();
        InputStream is = new ByteArrayInputStream(byteArr);
        String mimeType = URLConnection.guessContentTypeFromStream(is);
        
        response.setContentType(mimeType);
        if ("image/png".equals(mimeType))
        {
            StringBuilder build = new StringBuilder();
            build.append("attachment;filename=");
            build.append(photo.getNomPhoto());
            build.append(".png");
            response.setHeader("Content-Disposition", build.toString());
        }
        else if ("image/jpg".equals(mimeType) || "image/jpeg".equals(mimeType))
        {
            StringBuilder build = new StringBuilder();
            build.append("attachment;filename=");
            build.append(photo.getNomPhoto());
            build.append(".jpg");
            response.setHeader("Content-Disposition", build.toString());
        }
        
        OutputStream os = response.getOutputStream();
        os.write(byteArr);
        os.flush();
	os.close();
        
        String referer = request.getHeader("Referer");
        response.sendRedirect(referer);
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
