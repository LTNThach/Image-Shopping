/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Thach
 */
public class SQLServerConnUtils {
    public static Connection GetConnection() throws ClassNotFoundException, SQLException
    {  
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        String connectionUrl = "jdbc:sqlserver://localhost;servername=USER;database=ImageShopping;integratedSecurity=true;";
        Connection connect = DriverManager.getConnection(connectionUrl);
        
        return connect;
    }
    
    public static void CloseQuietly(Connection conn) 
    {
       try 
       {
           conn.close();
       } 
       catch (Exception ex) 
       {
           System.out.println(ex.toString());
       }
    }
    
    public static void RollbackQuietly(Connection conn) 
    {
       try 
       {
           conn.rollback();
       } 
       catch (Exception ex) 
       {
           System.out.println(ex.toString());
       }
    }
}
