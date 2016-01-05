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
public class Photo {
    private int IDP;
    private int IDA;
    private int IDU;
    private String NomA;
    private String NomU;
    private String PhotoType;
    private String NomPhoto;
    private String Contenu;
    private int NombreVu;
    private int NombreAchat;
    private int Point;
    private int NombreAimer;
    private int Prix;
    private int Supprime;
    private byte[] Data;
    
    @Override
    public boolean equals(Object object) 
    {
        if (object != null && object instanceof Photo) 
        {
            Photo p = (Photo) object;
            return this.IDP == p.IDP;
        }

        return false;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 53 * hash + this.IDP;
        return hash;
    }
    
    public int getIDP()
    {
        return IDP;
    }
    
    public int getIDA()
    {
        return IDA;
    }
    
    public int getIDU()
    {
        return IDU;
    }
    
    public String getNomAlbum()
    {
        return NomA;
    }
    
    public String getNomUtilisateur()
    {
        return NomU;
    }
    
    public String getPhotoType()
    {
        if ("Paysage".equals(PhotoType))
        {
            PhotoType = "Landscape";
        }
        else if ("Faune".equals(PhotoType))
        {
            PhotoType = "Animal";
        }
        else if ("Flora".equals(PhotoType))
        {
            PhotoType = "Flower";
        }
        else if ("Construction".equals(PhotoType))
        {
            PhotoType = "Building";
        }
        else if ("Homme".equals(PhotoType))
        {
            PhotoType = "Human";
        }
        else if ("Fantaisie".equals(PhotoType))
        {
            PhotoType = "Fantasy";
        }
        else if ("Autre".equals(PhotoType))
        {
            PhotoType = "Other";
        }
        return PhotoType;
    }
    
    public String getNomPhoto()
    {
        return NomPhoto;
    }
    
    public String getContenu()
    {
        return Contenu;
    }
    
    public int getNombreVu()
    {
        return NombreVu;
    }
    
    public int getNombreAchat()
    {
        return NombreAchat;
    }
    
    public int getNombreAimer()
    {
        return NombreAimer;
    }
    
    public int getPoint()
    {
        return Point;
    }
    
    public int getPrix()
    {
        return Prix;
    }
    
    public int getSupprime()
    {
        return Supprime;
    }
    
    public byte[] getData()
    {
        return Data;
    }
    
    public void setIDP(int IDPhoto)
    {
        this.IDP = IDPhoto;
    }
    
    public void setIDA(int IDAlbum)
    {
        this.IDA = IDAlbum;
    }
    
    public void setIDU(int IDUtilisateur)
    {
        this.IDU = IDUtilisateur;
    }
    
    public void setNomAlbum(String NAlbum)
    {
        this.NomA = NAlbum;
    }
    
    public void setNomUtilisateur(String NUtilisateur)
    {
        this.NomU = NUtilisateur;
    }
    
    public void setPhotoType(String TypePhoto)
    {
        this.PhotoType = TypePhoto;
    }
    
    public void setNomPhoto(String PhotoName)
    {
        this.NomPhoto = PhotoName;
    }
    
    public void setContenu(String content)
    {
        this.Contenu = content;
    }
    
    public void setNombreVu(int viewNumber)
    {
        this.NombreVu = viewNumber;
    }
    
    public void setNombreAchat(int sellNumber)
    {
        this.NombreAchat = sellNumber;
    }
    
    public void setPoint(int mark)
    {
        this.Point = mark;
    }
    
    public void setNombreAimer(int likeNumber)
    {
        this.NombreAimer = likeNumber;
    }
    
    public void setPrix(int price)
    {
        this.Prix = price;
    }
    
    public void setSupprime(int delete)
    {
        this.Supprime = delete;
    }
    
    public void setData(byte[] data)
    {
        this.Data = data;
    }
}
