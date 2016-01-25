/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Servlet;
import Utils.Mail;
import Utils.DBUtils;
import Utils.Utils;
import java.io.IOException;
import java.sql.Connection;
import java.util.Random;
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
@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class Register extends HttpServlet {

    
    String GeneratePassword()
    {
        Random rand = new Random();
        String[] str = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "K", "J", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"};
        StringBuilder build = new StringBuilder();
        for (int i = 0; i <= 5; i++)
        {
            int  n = rand.nextInt(str.length) + 0;
            build.append(str[n]);
        }
        return build.toString();
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
        String username = request.getParameter("username");
        String password = GeneratePassword();
        String email = request.getParameter("email");
        String firstname = request.getParameter("firstname"); 
        String lastname = request.getParameter("lastname");
        String addresses = request.getParameter("addresses");
        String phone = request.getParameter("phone");
        Connection conn = Utils.getStoredConnection(session);
        int check = DBUtils.CheckUsername(conn, username);
        String errorString = null;
        if ("administrator".equals(username))
        {
            check = 1;
        }
        
        if (check == 0)
        {
            int IDUser = DBUtils.SaveUserInfo(conn, username, firstname, lastname, addresses, phone, email, password, 0, 0, 0);
            
            StringBuilder build = new StringBuilder();
            build.append("Your password is: ");
            build.append(password);
            build.append("\nPlease click this link to validate: http://localhost:8080/ImageShopping/Validate?IDUser=");
            build.append(IDUser);
                    
            Mail.SendMail("TVH.CTVP13", "vy19thach14hoang03", "tvh.ctvp13@gmail.com", email, "Validate your account.", build.toString());
            errorString = "You have successfully registered, please check your email.";
            session.setAttribute("message", errorString);
            session.setAttribute("message", "You have sucessfully registered.");
            response.sendRedirect(request.getContextPath() + "/Congratulation");
        }
        else
        {
            errorString = "Your username has been used.";
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
