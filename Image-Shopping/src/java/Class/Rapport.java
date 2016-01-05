/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Class;

/**
 *
 * @author Vy Nguyen
 */
public class Rapport {
    private int IDR;
    private int IDP;
    private int TypeErreur;
    private String NomU;
    private String NomPhoto;
    private byte[] Data;
    
    public int getIDR()
    {
        return IDR;
    }
    
    public int getIDP()
    {
        return IDP;
    }
    
    public int getTypeErreur()
    {
        return TypeErreur;
    }
    
    public String getTypeErreurStr()
    {
        if (TypeErreur == 0)
        {
            return "Violence";
        }
        else
        {
            return "Pornographic";
        }
    }
    
    public String getNomUtilisateur()
    {
        return NomU;
    }
    
    public String getNomPhoto()
    {
        return NomPhoto;
    }
    
    public byte[] getData()
    {
        return Data;
    }
    
    public void setIDR(int IDReport)
    {
        this.IDR = IDReport;
    }
    
    public void setIDP(int IDPhoto)
    {
        this.IDP = IDPhoto;
    }
    
    public void setTypeErreur(int ErrorType)
    {
        this.TypeErreur = ErrorType;
    }
    
    public void setNomUtilisateur(String NUtilisateur)
    {
        this.NomU = NUtilisateur;
    }
    
    public void setNomPhoto(String NPhoto)
    {
        this.NomPhoto = NPhoto;
    }
    
    public void setData(byte[] data)
    {
        this.Data = data;
    }
}
