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
public class Agencija {
    
    private int idAgencije;
    private String naziv, opis;

    public Agencija() {
        naziv="";
        opis="";
        idAgencije=0;
    }

    public Agencija(int idAgencije, String naziv, String opis) {
        this.idAgencije = idAgencije;
        this.naziv = naziv;
        this.opis = opis;
    }

    public int getIdAgencije() {
        return idAgencije;
    }

    public void setIdAgencije(int idAgencije) {
        this.idAgencije = idAgencije;
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
    
}
