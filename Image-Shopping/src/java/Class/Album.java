/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

import java.util.ArrayList;

/**
 *
 * @author Vy Nguyen
 */
public class Album {
    private int IDA;
    private String NomAlbum;
    private int IDU;
    private ArrayList<Photo> listP;
    
    public int getIDA()
    {
        return IDA;
    }  
    
    public String getNomAlbum()
    {
        return NomAlbum;
    }
    
    public int getIDU()
    {
        return IDU;
    }
    
    public ArrayList<Photo> getListPhoto()
    {
        return listP;
    }
    
    public void setIDA(int IDAlbum)
    {
        this.IDA = IDAlbum;
    }
    
    public void setNomAlbum(String albumName)
    {
        this.NomAlbum = albumName;
    }
    
    public void setIDU(int IDUser)
    {
        this.IDU = IDUser;
    }
    
    public void setListPhoto(ArrayList<Photo> listPhoto)
    {
        this.listP = listPhoto;
    }
}
