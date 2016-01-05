/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Utils;

import Class.Album;
import Class.Photo;
import Class.Rapport;
import Class.Utilisateur;
import java.io.InputStream;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Vy Nguyen
 */
public class DBUtils {  
    public static int CheckUsername(Connection conn, String username)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_CheckUsername(?, ?)}");
            cstmt.setString(1, username);
            cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(2);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int CheckUsernameAndPassword(Connection conn, String username, String password)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_CheckUsernameAndPassword(?, ?, ?)}");
            cstmt.setString(1, username);
            cstmt.setString(2, password);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int ChangeStatusUser(Connection conn, int IDU, int status)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_ChangeStatusUser(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, status);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int SaveUserInfo(Connection conn, String username, String firstname,
            String lastname, String address, String telephone, String mail, String password,
            int status, int reportNumber, int sellNumber)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SaveUserInfo(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            cstmt.setString(1, username);
            cstmt.setString(2, firstname);
            cstmt.setString(3, lastname);
            cstmt.setString(4, address);
            cstmt.setString(5, telephone);
            cstmt.setString(6, mail);
            cstmt.setString(7, password);
            cstmt.setInt(8, status);
            cstmt.setInt(9, reportNumber);
            cstmt.setInt(10, sellNumber);
            cstmt.registerOutParameter(11, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(11);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int ChangePassword(Connection conn, int IDU, String password)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_ChangePassword(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setString(2, password);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int DeleteReport(Connection conn, int IDR, int cas)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_DeleteRapport(?, ?, ?)}");
            cstmt.setInt(1, IDR);
            cstmt.setInt(2, cas);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int ChangeAlbum(Connection conn, int IDA, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_ChangeAlbum(?, ?, ?)}");
            cstmt.setInt(1, IDA);
            cstmt.setInt(2, IDP);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int AddToCart(Connection conn, int IDU, int IDP, int status)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_AddToCart(?, ?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.setInt(3, status);
            cstmt.registerOutParameter(4, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(4);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int DeleteProductCart(Connection conn, int IDU, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_DeleteProductCart(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int ChangeStatusProductCart(Connection conn, int IDU, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_ChangeStatusProductCart(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int UpdateLike(Connection conn, int IDP, int IDU)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_UpdateLike(?, ?, ?)}");
            cstmt.setInt(1, IDP);
            cstmt.setInt(2, IDU);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int InsertPhoto_1(Connection conn, int IDA, String name,
            String theloai, String noidung, int gia, InputStream dulieu, long len)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_InsertPhoto_1(?, ?, ?, ?, ?, ?, ?)}");
            cstmt.setInt(1, IDA);
            cstmt.setString(2, name);
            cstmt.setString(3, theloai);
            cstmt.setString(4, noidung);
            cstmt.setInt(5, gia);
            cstmt.setBinaryStream(6, dulieu, len);
            cstmt.registerOutParameter(7, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(7);
        }
        catch (Exception ex)
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int InsertPhoto_2(Connection conn, String tenalbum, int IDU, String name,
            String theloai, String noidung, int gia, InputStream dulieu, long len)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_InsertPhoto_2(?, ?, ?, ?, ?, ?, ?, ?)}");
            cstmt.setString(1, tenalbum);
            cstmt.setInt(2, IDU);
            cstmt.setString(3, name);
            cstmt.setString(4, theloai);
            cstmt.setString(5, noidung);
            cstmt.setInt(6, gia);
            cstmt.setBinaryStream(7, dulieu, len);
            cstmt.registerOutParameter(8, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(8);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int UpdateView(Connection conn, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_UpdateView(?, ?)}");
            cstmt.setInt(1, IDP);
            cstmt.registerOutParameter(2, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(2);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int CheckLike(Connection conn, int IDU, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_CheckLike(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int CheckBuy(Connection conn, int IDU, int IDP)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_CheckBuy(?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int InsertReport(Connection conn, int IDP, int loai)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_InsertReport(?, ?, ?)}");
            cstmt.setInt(1, IDP);
            cstmt.setInt(2, loai);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int UpdatePhotoInfo(Connection conn, int IDU, int IDP, int IDA,
            String name, String theloai, String noidung, int gia)
    {
        int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_UpdatePhotoInfo(?, ?, ?, ?, ?, ?, ?, ?)}");
            cstmt.setInt(1, IDU);
            cstmt.setInt(2, IDP);
            cstmt.setInt(3, IDA);
            cstmt.setString(4, name);
            cstmt.setString(5, theloai);
            cstmt.setString(6, noidung);
            cstmt.setInt(7, gia);
            cstmt.registerOutParameter(8, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(8);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static int DeletePhoto(Connection conn, int IDP, int IDU)
    {
       int check = 0;
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_DeletePhoto(?, ?, ?)}");
            cstmt.setInt(1, IDP);
            cstmt.setInt(2, IDU);
            cstmt.registerOutParameter(3, java.sql.Types.INTEGER);
            cstmt.execute();
            check = cstmt.getInt(3);
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return check;
    }
    
    public static ArrayList<Photo> SearchHotImage(Connection conn)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchHotImage}");
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static Photo GetInfoPhoto(Connection conn, int IDP)
    {
        Photo p = new Photo();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_GetInfoPhoto(?)}");
            cstmt.setInt(1, IDP);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                { 
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return p;
    }
    
    public static ArrayList<Photo> SearchCategories(Connection conn, int IDUser, String categorie)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchCategories(?, ?)}");
            cstmt.setInt(1, IDUser);
            cstmt.setString(2, categorie);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Photo> SearchContent(Connection conn, int IDUser, String content)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchContent(?, ?)}");
            cstmt.setInt(1, IDUser);
            cstmt.setString(2, content);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Photo> SearchUsername(Connection conn, int IDUser, String username)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchUsername(?, ?)}");
            cstmt.setInt(1, IDUser);
            cstmt.setString(2, username);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Photo> SearchImageName(Connection conn, int IDUser, String name)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchImageName(?, ?)}");
            cstmt.setInt(1, IDUser);
            cstmt.setString(2, name);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Utilisateur> SearchHotUser(Connection conn)
    {
        ArrayList<Utilisateur> ListUtilisateur = new ArrayList<Utilisateur>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchHotUser}");
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Utilisateur u = new Utilisateur();
                    u.setIDU(rs.getInt("IDU"));
                    u.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    u.setNom(rs.getString("Nom"));
                    u.setPrenom(rs.getString("Prenom"));
                    u.setAdresse(rs.getString("Adresse"));
                    u.setNumeroTelephone(rs.getString("NumeroTelephone"));
                    u.setEmail(rs.getString("Email"));
                    u.setMotdePasse(rs.getString("MotdePasse"));
                    u.setEtatActiver(rs.getInt("EtatActiver"));
                    u.setNombreRapport(rs.getInt("NombreRapport"));
                    u.setNombreVendu(rs.getInt("NombreVendu"));
                    u.setListAlbum(null);
                    ListUtilisateur.add(u);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListUtilisateur;
    }
    
    public static ArrayList<Album> LoadListAlbum(Connection conn, int IDUser)
    {
        ArrayList<Album> ListAlbum = new ArrayList<Album>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_LoadListAlbum(?)}");
            cstmt.setInt(1, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Album a = new Album();
                    a.setIDA(rs.getInt("IDA"));
                    a.setIDU(rs.getInt("IDU"));
                    a.setNomAlbum(rs.getString("NomAlbum"));
                    a.setListPhoto(null);
                    ListAlbum.add(a);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListAlbum;
    }
    
    public static ArrayList<Photo> SearchPhotoAchete(Connection conn, int IDUser)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchPhotoAchete(?)}");
            cstmt.setInt(1, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Photo> SearchPhotoAime(Connection conn, int IDUser)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchPhotoAime(?)}");
            cstmt.setInt(1, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Photo> SearchPhoto(Connection conn, int IDUser)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchPhoto(?)}");
            cstmt.setInt(1, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
    
    public static ArrayList<Rapport> LoadReport(Connection conn)
    {
        ArrayList<Rapport> ListRapport = new ArrayList<Rapport>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_LoadReport}");
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Rapport r = new Rapport();
                    r.setIDR(rs.getInt("IDR"));
                    r.setIDP(rs.getInt("IDP"));
                    r.setTypeErreur(rs.getInt("TypeErreur"));
                    r.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    r.setNomPhoto(rs.getString("NomPhoto"));
                    r.setData(rs.getBytes("Data"));
                    ListRapport.add(r);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListRapport;  
    }
    
    public static Utilisateur SearchUser(Connection conn, String username)
    {
        Utilisateur u = new Utilisateur();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_SearchUser(?)}");
            cstmt.setString(1, username);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {                   
                    u.setIDU(rs.getInt("IDU"));
                    u.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    u.setNom(rs.getString("Nom"));
                    u.setPrenom(rs.getString("Prenom"));
                    u.setAdresse(rs.getString("Adresse"));
                    u.setNumeroTelephone(rs.getString("NumeroTelephone"));
                    u.setEmail(rs.getString("Email"));
                    u.setMotdePasse(rs.getString("MotdePasse"));
                    u.setEtatActiver(rs.getInt("EtatActiver"));
                    u.setNombreRapport(rs.getInt("NombreRapport"));
                    u.setNombreVendu(rs.getInt("NombreVendu"));
                    u.setListAlbum(null);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return u;
    }
    
    public static Utilisateur GetUserInfo(Connection conn, int IDUser)
    {
        Utilisateur u = new Utilisateur();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_GetUserInfo(?)}");
            cstmt.setInt(1, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    u.setIDU(rs.getInt("IDU"));
                    u.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    u.setNom(rs.getString("Nom"));
                    u.setPrenom(rs.getString("Prenom"));
                    u.setAdresse(rs.getString("Adresse"));
                    u.setEmail(rs.getString("Email"));
                    u.setNumeroTelephone(rs.getString("NumeroTelephone"));
                    u.setMotdePasse(rs.getString("MotdePasse"));
                    u.setEtatActiver(rs.getInt("EtatActiver"));
                    u.setNombreRapport(rs.getInt("NombreRapport"));
                    u.setNombreVendu(rs.getInt("NombreVendu"));
                    u.setListAlbum(null);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return u;
    }
    
    public static ArrayList<Photo> LoadImage(Connection conn, int IDAlbum, int IDUser)
    {
        ArrayList<Photo> ListPhoto = new ArrayList<Photo>();
        try 
        {
            CallableStatement cstmt = conn.prepareCall("{call sp_LoadImage(?, ?)}");
            cstmt.setInt(1, IDAlbum);
            cstmt.setInt(2, IDUser);
            ResultSet rs = cstmt.executeQuery();
            if (rs != null)
            {
                while (rs.next())
                {
                    Photo p = new Photo();
                    p.setNomUtilisateur(rs.getString("NomUtilisateur"));
                    p.setNomAlbum(rs.getString("NomAlbum"));
                    p.setNomPhoto(rs.getString("NomPhoto"));
                    p.setIDP(rs.getInt("IDP"));
                    p.setIDA(rs.getInt("IDA"));
                    p.setIDU(rs.getInt("IDU"));
                    p.setContenu(rs.getString("Contenu"));
                    p.setSupprime(rs.getInt("Supprime"));
                    p.setPhotoType(rs.getString("PhotoType"));
                    p.setData(rs.getBytes("Data"));
                    p.setNombreVu(rs.getInt("NombreVu"));
                    p.setNombreAchat(rs.getInt("NombreAchat"));
                    p.setNombreAimer(rs.getInt("NombreAimer"));
                    p.setPoint(rs.getInt("Point"));
                    p.setPrix(rs.getInt("Prix"));
                    ListPhoto.add(p);
                }
            } 
        }
        catch (Exception ex) 
        {
            System.out.println(ex.toString());
        }
        
        return ListPhoto;
    }
}
