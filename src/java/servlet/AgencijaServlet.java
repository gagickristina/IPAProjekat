/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.Agencija;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
public class AgencijaServlet extends HttpServlet {

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
   String dburl="jdbc:mysql://localhost:3306/ketering_sluzba";
        String user = "root";
        String pass = "";

        HttpSession sesija = request.getSession();
        ArrayList<Agencija>listaAgencija = new ArrayList<Agencija>();

        try{

          Class.forName("com.mysql.jdbc.Driver");
          Connection konekcija = DriverManager.getConnection(dburl,user,pass);
          String upit = "SELECT * from agencija";
          PreparedStatement ps = konekcija.prepareStatement(upit);
          ResultSet rs = ps.executeQuery();
          while(rs.next()){
              Agencija a = new Agencija(); 
              a.setIdAgencije(rs.getInt("idAgencije"));
              a.setNaziv(rs.getString("naziv"));
              a.setOpis(rs.getString("opis"));
             
              listaAgencija.add(a);
             }
           konekcija.close();
           ps.close();
           sesija.setAttribute("agencija",listaAgencija);

           request.getRequestDispatcher("agencija.jsp").forward(request, response);
        }
        catch(ClassNotFoundException | SQLException ex){

            request.setAttribute("error", ex.getMessage());
             request.setAttribute("poruka", "Morate se ulogovati kako bi koristili naše usluge.");
            request.getRequestDispatcher("login.jsp").forward(request, response);


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
