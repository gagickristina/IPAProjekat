/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package bean;

/**
 *
 * @author m
 */
public class Usluga {
    
    private int idUsluge,idAgencije,cena;
    private String naziv,opis;

    public Usluga() {
        naziv="";
        opis="";
        idUsluge=0;
        idAgencije=0;
        cena=0;
      
    }

    public Usluga(int idUsluge,int idAgencije, int cena, String naziv, String opis) {
        this.idUsluge = idUsluge;
        this.idAgencije=idAgencije;
        this.cena = cena;
        this.naziv = naziv;
        this.opis = opis;
    }

  

    public int getIdUsluge() {
        return idUsluge;
    }

    public void setIdUsluge(int idUsluge) {
        this.idUsluge = idUsluge;
    }

   
    public int getCena() {
        return cena;
    }

    public void setCena(int cena) {
        this.cena = cena;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public String getOpis() {
        return opis;
    }

    public void setOpis(String opis) {
        this.opis = opis;
    }

    public int getIdAgencije() {
        return idAgencije;
    }

    public void setIdAgencije(int idAgencije) {
        this.idAgencije = idAgencije;
    }
    
    
    
    
    
    
}
