<%-- 
    Document   : dodajUsluguForma
    Created on : Aug 25, 2022, 7:16:18 PM
    Author     : m
--%>

<%@page import="bean.Agencija"%>
<%@page import="bean.Korisnik"%>
<%@page import="bean.Usluga"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

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
        <!-- <link rel="stylesheet" href="css/responsive.css"> -->
    </head>

    <body>

        <!--[if lte IE 9]>
                <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
            <![endif]-->

        <!-- header-start -->
        <jsp:include page="header.jsp" ></jsp:include>
            <!-- header-end -->

            <!-- breadcam_area_start -->
            <div class="breadcam_area breadcam_bg_1 zigzag_bg_2">
                <div class="breadcam_inner">
                    <div class="breadcam_text">
                        <h3>Dodajte uslugu</h3>

                    </div>
                </div>
            </div>
            <!-- breadcam_area_end -->


            <section class="sample-text-area">
                <div class="container box_1170">



                    <div class="row">
                        <div class="col-lg-8 col-md-8">
                            <h3 class="mb-30">Usluga</h3>
                            <form action="DodajUsluguForma" method="post">


                                <div class="mt-10">
                                    <input type="text" name="naziv"  placeholder="Naziv usluge"
                                       required
                                       class="single-input">
                            </div>
                            <div class="mt-10">
                                <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="opis" placeholder="Opis usluge"></textarea>
                            </div>

                           

                            <div class="mt-10">
                                <input type="number" name="cena"  placeholder="Dodajte cenu"
                                       required
                                       class="single-input">
                            </div>
                                
                                <div class="mt-10">
                                    <input type="number" name="idAgencije"  placeholder="Dodajte id agencije" max="6" min="1"
                                       required
                                       class="single-input">
                            </div>
                     






                            <div class="mt-10">

                                <br>
                                <input type="submit" value="Potvrdi" class="genric-btn info">
                                

                            </div>

                    </div>
                    </form>

                </div>
                <br> 
                <a href="PregledAgencija" > <button class="btn btn-info">Vrati se</button></a>
            </div>

        </div>


    </section>


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

