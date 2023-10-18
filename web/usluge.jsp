<%-- 
    Document   : usluge
    Created on : Aug 18, 2022, 5:45:53 PM
    Author     : m
--%>

<%@page import="bean.Agencija"%>
<%@page import="bean.Usluga"%>
<%@page import="bean.Korisnik"%>
<%@page import="java.util.ArrayList"%>
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
             Agencija agencija = (Agencija)sesija.getAttribute("agencija");
         ArrayList<Usluga>  usluga = (ArrayList<Usluga>)sesija.getAttribute("usluga");
         

          
       %>
       
         <!-- header-start -->
        <jsp:include page="header.jsp" ></jsp:include>
        <!-- header-end -->

        <!-- breadcam_area_start -->
        <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
            <div class="breadcam_inner">
                <div class="breadcam_text">
                    <h3>Usluge</h3>
                   
                </div>
            </div>
        </div>
        <!-- breadcam_area_end -->
                    <!-- service_area-start -->
            <div class="service_area">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-12">
                            <div class="section_title mb-60">
                                <h3>Usluge agencije</h3>
                                <p></p>
                            </div>
                        </div>
                    </div>
                    
                    
                    
                    <div class="row">
                        
                      
                        
                        <% for(Usluga a: usluga){%>
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-dance"></i>
                                </div>
                                
                                <form action="RezervacijaServlet" method="post">
                                    
                                    
                                <h4> <%= a.getNaziv() %></h4>
                                <p> <%= a.getOpis() %></p>
                                <div class="order_prise">
                                        <span><%= a.getCena() %> dinara</span>
                                    </div>
                                <br>
                                 <input type="submit" class="btn btn-primary" value="Poruci" id="dugme">
                          <input type="hidden"  value='<%= a.getIdUsluge()%>' name="idUsluge" >
                                
                                </form>
                            </div>
                        </div>
                        <% } %>
                        
                        
                      <!--  
                        
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-cake"></i>
                                </div>
                                <h4>Ketering za svadbe</h4>
                                <p>Dopustite nama da Vam obezbedimo najlepse posluženje za Vaš poseban dan.  </p>
                                <div class="order_prise">
                                        <span>10.00</span>
                                    </div>
                                <br>
                                <a href="#" class="boxed_btn">Poruči</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-dance"></i>
                                </div>
                                <h4>Ketering za žurke</h4>
                                <p>Uz naš ketering žurka je zagarantovana!</p>
                                <div class="order_prise">
                                        <span>10.00</span>
                                    </div>
                                <br>
                                <a href="#" class="boxed_btn">Poruči</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-calendar"></i>
                                </div>
                                <h4>Ketering za promocije</h4>
                                <p>Organizujete promociju? Naše ukusno koktel posluženje je pravi izbor za Vas.</p>
                                <div class="order_prise">
                                        <span>10.00</span>
                                    </div>
                                <br>
                                <a href="#" class="boxed_btn">Poruči</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-businessman"></i>
                                </div>
                                <h4>Korporativni ketering</h4>
                                <p>Organizujete bitan događaj u firmi? Nudimo premium hranu i uslugu.</p>
                                <div class="order_prise">
                                        <span>10.00</span>
                                    </div>
                                <br>
                                <a href="#" class="boxed_btn">Poruči</a>
                            </div>
                        </div>
                        <div class="col-xl-4 col-md-6">
                            <div class="single_service">
                                <div class="service_icon">
                                    <i class="flaticon-running-man"></i>
                                </div>
                                <h4>Ketering na brzinu</h4>
                                <p>Sve ste pripremili za vaš bitan događaj, ali ste slučajno zaboravili posluženje? U pomoć Vam brzo stižemo mi!</p>
                                <div class="order_prise">
                                        <span>10.00</span>
                                    </div>
                                <br>
                                <a href="#" class="boxed_btn">Poruči</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- service_area-end -->
                    </div>
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
