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
public class Utilisateur {
    private int IDU;
    private String NomUtilisateur;
    private String Nom;
    private String Prenom;
    private String Adresse;
    private String NumeroTelephone;
    private String Email;
    private String MotdePasse;
    private int EtatActiver;
    private int NombreRapport;
    private int NombreVendu;
    private ArrayList<Album> listA;
    
    public int getIDU()
    {
        return IDU;
    }
    
    public String getNomUtilisateur()
    {
        return NomUtilisateur;
    }
    
    public String getNom()
    {
        return Nom;
    }
    
    public String getPreNom()
    {
        return Prenom;
    }
    
    public String getAdresse()
    {
        return Adresse;
    }
    
    public String getNumeroTelephone()
    {
        return NumeroTelephone;
    }
    
    public String getEmail()
    {
        return Email;
    }
    
    public String getMotdePasse()
    {
        return MotdePasse;
    }
    
    public int getEtatActiver()
    {
        return EtatActiver;
    }
    
    public int getNombreRapport()
    {
        return NombreRapport;
    }
    
    public int getNombreVendu()
    {
        return NombreVendu;
    }
    
    public ArrayList<Album> getListAlbum()
    {
        return listA;
    }
    
    public void setIDU(int IDUser)
    {
        this.IDU = IDUser;
    }
    
    public void setNomUtilisateur(String username)
    {
        this.NomUtilisateur = username;
    }
    
    public void setNom(String firstname)
    {
        this.Nom = firstname;
    }
    
    public void setPrenom(String lastname)
    {
        this.Prenom = lastname;
    }
    
    public void setAdresse(String address)
    {
        this.Adresse = address;
    }
    
    public void setNumeroTelephone(String telephoneNumber)
    {
        this.NumeroTelephone = telephoneNumber;
    }
    
    public void setEmail(String mail)
    {
        this.Email = mail;
    }
    
    public void setMotdePasse(String password)
    {
        this.MotdePasse = password;
    }
    
    public void setEtatActiver(int activateStatus)
    {
        this.EtatActiver = activateStatus;
    }
    
    public void setNombreRapport(int reportNumber)
    {
        this.NombreRapport = reportNumber;
    }
    
    public void setNombreVendu(int soldNumber)
    {
        this.NombreVendu = soldNumber;
    }
    
    public void setListAlbum(ArrayList<Album> listAlbum)
    {
        this.listA = listAlbum;
    }
}
