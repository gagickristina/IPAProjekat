/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import bean.Korisnik;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author m
 */
public class Registracija extends HttpServlet {

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

        String ime = request.getParameter("ime"),
                prezime = request.getParameter("prezime"),
                adresa=request.getParameter("adresa"),
                grad=request.getParameter("grad"),
                korisnickoIme = request.getParameter("korisnickoIme"),
                lozinka = request.getParameter("lozinka"),
                lozinkaPotvrda = request.getParameter("lozinkaPotvrda"),
                email = request.getParameter("email");

        String dburl = "jdbc:mysql://localhost:3306/ketering_sluzba",
                user = "root",
                pass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(dburl, user, pass);
            Statement st = con.createStatement();
            ResultSet rezultat;
            String upit = "SELECT korisnickoIme FROM korisnik";
            rezultat = st.executeQuery(upit);

            while (rezultat.next()) {
                if (korisnickoIme.equals(rezultat.getString("korisnickoIme"))) {
                    request.setAttribute("msg", "Korisnicko ime vec postoji");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                }
            }
            st.close();
            con.close();

        } catch (IOException | ClassNotFoundException | SQLException | ServletException e) {
            request.setAttribute("poruka", e.getMessage());
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }

        if (ime != null && ime.length() > 0 && prezime != null && prezime.length() > 0 && korisnickoIme != null && korisnickoIme.length() > 0 && lozinka != null && lozinka.length() > 0 && lozinkaPotvrda != null && lozinkaPotvrda.length() > 0 && email != null && email.length() > 0 &&
                adresa != null && adresa.length() > 0 && grad != null && grad.length() > 0) {
            if (lozinka.equals(lozinkaPotvrda)) {
                try {

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection con = DriverManager.getConnection(dburl, user, pass);
                    Statement st = con.createStatement();
                    String upit = "INSERT INTO korisnik(ime,prezime,adresa,grad,korisnickoIme,lozinka,email)" + "VALUES('" + ime + "','" + prezime + "','"+adresa+ "','" +grad+"','"+ korisnickoIme + "','" + lozinka + "','" + email + "')";
                    st.executeUpdate(upit);
                    st.close();
                    con.close();
                    request.setAttribute("poruka", "Uspešno ste se registrovali. Pokušajte da se ulogujete.");
                    request.getRequestDispatcher("login.jsp").forward(request, response);
                } catch (Exception e) {
                    request.setAttribute("poruka", e);
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }
            } else {
                request.setAttribute("msg", "Lozinke se ne poklapaju");
                request.getRequestDispatcher("registracija.jsp").forward(request, response);
            }
        } else {
            request.setAttribute("msg", "Morate popuniti sva polja");
            request.getRequestDispatcher("registracija.jsp").forward(request, response);
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
