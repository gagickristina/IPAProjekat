<%-- 
    Document   : ispisKorisnika
    Created on : Aug 24, 2022, 8:05:09 PM
    Author     : m
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="bean.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Ketering sluzba</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- <link rel="manifest" href="site.webmanifest"> -->
        <link rel="shortcut icon" type="image/x-icon" href="img/logo.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/font-awesome.min.css">
        <link rel="stylesheet" href="css/themify-icons.css">
        <link rel="stylesheet" href="css/nice-select.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/animate.css">
        <link rel="stylesheet" href="css/slicknav.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <%
            HttpSession sesija = request.getSession();
            ArrayList<Korisnik> listaKorisnika = (ArrayList<Korisnik>) sesija.getAttribute("lista");
            String greska = (String) request.getAttribute("greska");
            if (greska != null) {%>
        <br>
        <div class="alert alert-warning" role="alert">
            <%= greska%>
        </div>
        <%} %>

        <!-- header-start -->
        <jsp:include page="header.jsp" ></jsp:include>
            <!-- header-end -->



            <!-- breadcam_area_start -->
            <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Korisnici</h3>

                    </div>
                </div>
            </div>
            <!-- breadcam_area_end -->

            <section class="sample-text-area">
                <div class="container box_1170">



                    <div class="row">



                    
                      <%  if (!listaKorisnika.isEmpty()) {%> <div class="col-md-12"> <br>
                        <table class="table table-striped" style="border: 1px white">
                            <thead>
                                <tr>
                                    <th scope="col">ID korisnika</th>                       
                                    <th scope="col">Ime</th>
                                    <th scope="col">Prezime</th>
                                    <th scope="col">Korisnicko ime</th>
                                    <th scope="col">Email</th>
                                    <th scope="col">Adresa</th>
                                    <th scope="col">Grad</th>
                                    <th scope="col">Poeni</th>



                                    <th></th>
                                </tr>
                            </thead>
                            <tbody>
                               

                                   <% for (Korisnik k: listaKorisnika) {
                                        String role = "Korisnik";
                                %>
                                <tr>
                                    <td><%= k.getIdKorisnik()%></td>
                                    <td><%= k.getIme()%></td>
                                    <td><%= k.getPrezime()%></td>
                                    <td><%= k.getKorisnickoIme()%></td>
                                    <td><%= k.getEmail()%></td>
                                    <td><%= k.getAdresa()%></td>
                                    <td><%= k.getGrad()%></td>
                                    <td><%= k.getPoeni()%></td>

                                    <td>
                                        <form action="BrisanjeKorisnika" method="post">
                                            <button type="submit" class="btn btn-info" style="color: white;background-color: purple">Obriši</button>
                                            <input type="hidden" value="<%= k.getIdKorisnik()%>" name="idKorisnika" />
                                        </form>
                                    </td>
                                   
                                </tr>
                                <%  } %>
                            </tbody>
                        </table>
                    </div>
                    <%
                        }
                    %>



                </div>
            </div>
        </container>








        <!-- footer-start -->
        <jsp:include page="footer.jsp" ></jsp:include>
        <!-- footer-end -->


        <!-- JS here -->
        <script src="js/vendor/modernizr-3.5.0.min.js"></script>
        <script src="js/vendor/jquery-1.12.4.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/isotope.pkgd.min.js"></script>
        <script src="js/ajax-form.js"></script>
        <script src="js/waypoints.min.js"></script>
        <script src="js/jquery.counterup.min.js"></script>
        <script src="js/imagesloaded.pkgd.min.js"></script>
        <script src="js/scrollIt.js"></script>
        <script src="js/jquery.scrollUp.min.js"></script>
        <script src="js/wow.min.js"></script>
        <script src="js/nice-select.min.js"></script>
        <script src="js/jquery.slicknav.min.js"></script>
        <script src="js/jquery.magnific-popup.min.js"></script>
        <script src="js/plugins.js"></script>

        <!--contact js-->
        <script src="js/contact.js"></script>
        <script src="js/jquery.ajaxchimp.min.js"></script>
        <script src="js/jquery.form.js"></script>
        <script src="js/jquery.validate.min.js"></script>
        <script src="js/mail-script.js"></script>

        <script src="js/main.js"></script>

</body>

</html>
