/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;
import Class.Utilisateur;
import java.sql.Connection;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Thach
 */
public class Utils {
    public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";
    // Lưu trữ thông tin người dùng đã login vào Session
    public static void storeLoginedUser(HttpSession session, Utilisateur loginedUser) {
        // Trên JSP có thể truy cập ${loginedUser}
        session.setAttribute("loginedUser", loginedUser);
    }
 
   // Lấy thông tin người dùng đã login trong session.
    public static Utilisateur getLoginedUser(HttpSession session) {
        Utilisateur loginedUser = (Utilisateur) session.getAttribute("loginedUser");
        return loginedUser;
    }
   
   // Lưu trữ Connection vào một thuộc tính của request.
   // Thông tin lưu trữ chỉ tồn tại trong thời gian yêu cầu (request)
   // cho tới khi dữ liệu được trả về trình duyệt người dùng.
    public static void storeConnection(HttpSession session, Connection conn) {
        session.setAttribute(ATT_NAME_CONNECTION, conn);
    }
 
   // Lấy đối tượng Connection đã được lưu trữ trong 1 thuộc tính của request.
    public static Connection getStoredConnection(HttpSession session) {
        Connection conn = (Connection) session.getAttribute(ATT_NAME_CONNECTION);
        return conn;
    }
}
