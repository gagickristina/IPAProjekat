/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.Agencija;
import bean.Usluga;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author m
 */
public class PregledUsluga extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         request.setCharacterEncoding("UTF-8");
              
                String agencija = request.getParameter("idAgencije");

       String dburl="jdbc:mysql://localhost:3306/ketering_sluzba";
        String user = "root";
        String pass = "";

        HttpSession sesija = request.getSession();
        ArrayList<Agencija>listaAgencija = new ArrayList<Agencija>();

        try{
           Class.forName("com.mysql.jdbc.Driver");
          Connection konekcija = DriverManager.getConnection(dburl,user,pass);
          String upit = "SELECT * from usluga INNER JOIN agencija ON usluga.idAgen = agencija.idAgencije where idAgencije  = ?";
           PreparedStatement ps = konekcija.prepareStatement(upit);
            int agBr = Integer.parseInt(agencija);
            ps.setInt(1,agBr);
            Agencija ag = new Agencija();

            ArrayList<Usluga>listaUs = new ArrayList<Usluga>();

            ResultSet rs = ps.executeQuery();

            while(rs.next()){
                Usluga po = new Usluga();
                ag.setIdAgencije(rs.getInt("idAgencije"));
                ag.setNaziv(rs.getString("naziv"));
                ag.setOpis(rs.getString("opis"));
                
                po.setIdUsluge(rs.getInt("idUsluge"));
                po.setIdAgencije(rs.getInt("idAgencije"));
                po.setCena(rs.getInt("cena"));
                po.setOpis(rs.getString("opis"));
                po.setNaziv(rs.getString("naziv"));
                listaUs.add(po);
               }

            //Zatvaranje konekcije
            konekcija.close();
            ps.close();
            sesija.setAttribute("agencija",ag);
            sesija.setAttribute("usluga",listaUs);
            request.getRequestDispatcher("ispisUsluga.jsp").forward(request, response);
        }
        catch(Exception ex){

            request.setAttribute("error", ex.getMessage());
             request.setAttribute("poruka", "Nema usluga");
            request.getRequestDispatcher("error.jsp").forward(request, response);

        }
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
        processRequest(request, response);
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
        processRequest(request, response);
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
