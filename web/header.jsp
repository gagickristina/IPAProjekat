<%-- 
    Document   : header
    Created on : Aug 18, 2022, 3:52:54 PM
    Author     : m
--%>

<%@page import="bean.Korisnik"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
            HttpSession sesija = request.getSession();
            Korisnik korisnik = (Korisnik)sesija.getAttribute("korisnik");
            int privilegija;
            if(korisnik==null)
            {
                privilegija=0;
            }
            else   //U slucaju da se korisnik loguje
            {
                int privilegije = korisnik.getPrivilegije();
                if( privilegije==1)
                {
                privilegija=1;
                }
                else if(privilegije==2)
                {
                privilegija=2;
                }
                else if(privilegije==3)
                {
                privilegija=3;
                }
                else
                {
                    privilegija=0;
                }
            }
            
            sesija.setAttribute("privilegije", privilegija);
           
            
        %>
        
        

        
          <%if(privilegija==1){ %>
          
                  <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10">
                                <div class="main-menu d-none d-lg-block">
                                    <nav>
                                        <ul class="mein_menu_list" id="navigation">
                                            <li><a href="about.jsp">O nama</a></li>
                                            <li><a href="AgencijaServlet">Ketering agencije</a></li>
                                        

                                            <div class="logo-img d-none d-lg-block">
                                                <a href="index.jsp">
                                                    <img src="img/logo.png" alt="">
                                                </a>
                                            </div>
                                            <li><a href="gallery.jsp">Galerija</a></li>
                                            
                                            <li> <a href="#.jsp"> Korisnik: <%=korisnik.getIme() %> -> <%= korisnik.getPoeni() %> poena <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                 
                                                    <li><a href="PregledRezervacijeKorisnik">Korpa</a></li>
                                                    
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 d-none d-lg-block">
                                <div class="custom_order">
                                    <a href="Logout" class="boxed_btn_white">Izloguj se</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                            <div class="logo-img-small d-sm-block d-md-block d-lg-none">
                                <a href="index.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->
          
          <%}%>
          
          
           <%if(privilegija==2){ %>
          
                  <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10">
                                <div class="main-menu d-none d-lg-block">
                                    <nav>
                                        <ul class="mein_menu_list" id="navigation">
                                            <li><a href="about.jsp">O nama</a></li>
                                            <li><a href="AgencijaServlet">Ketering agencije</a></li>
                                            

                                            <div class="logo-img d-none d-lg-block">
                                                <a href="index.jsp">
                                                    <img src="img/logo.png" alt="">
                                                </a>
                                            </div>
                                            <li><a href="gallery.jsp">Galerija</a></li>
                                            
                                            <li> <a href="#.jsp"> Menadžer: <%=korisnik.getIme() %> <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                 
                                                    <li><a href="PregledRezervacijeZaposleni">Porudžbine</a></li>
                                                    <li><a href="PregledAgencija">Ketering agencije</a></li>
                                                    
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 d-none d-lg-block">
                                <div class="custom_order">
                                    <a href="Logout" class="boxed_btn_white">Izloguj se</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                            <div class="logo-img-small d-sm-block d-md-block d-lg-none">
                                <a href="index.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->
          
          <%}%>
          
                <%if(privilegija==3){ %>
          
                  <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10">
                                <div class="main-menu d-none d-lg-block">
                                    <nav>
                                        <ul class="mein_menu_list" id="navigation">
                                            <li><a href="about.jsp">O nama</a></li>
                                            <li><a href="AgencijaServlet">Ketering agencije</a></li>
                                           

                                            <div class="logo-img d-none d-lg-block">
                                                <a href="index.jsp">
                                                    <img src="img/logo.png" alt="">
                                                </a>
                                            </div>
                                            <li><a href="gallery.jsp">Galerija</a></li>
                                            
                                            <li> <a href="#.jsp"> Admin: <%=korisnik.getIme() %> <i class="ti-angle-down"></i></a>
                                                <ul class="submenu">
                                                 
                                                    <li><a href="PregledKorisnika">Korisnici</a></li>
                                                    <li><a href="PregledAgencija">Ketering Agencije</a></li>
                                                    <li><a href="PregledRezervacijeZaposleni">Porudžbine</a></li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 d-none d-lg-block">
                                <div class="custom_order">
                                    <a href="Logout" class="boxed_btn_white">Izloguj se</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                            <div class="logo-img-small d-sm-block d-md-block d-lg-none">
                                <a href="index.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->
          
          <%}%>
          
                   <%if(privilegija==0){ %>
        <!-- header-start -->
        <header>
            <div class="header-area ">
                <div id="sticky-header" class="main-header-area">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-xl-10 col-lg-10">
                                <div class="main-menu d-none d-lg-block">
                                    <nav>
                                        <ul class="mein_menu_list" id="navigation">
                                            <li><a href="about.jsp">O nama</a></li>
                                            <li><a href="AgencijaServlet">Ketering agencije</a></li>
                                           

                                            <div class="logo-img d-none d-lg-block">
                                                <a href="index.jsp">
                                                    <img src="img/logo.png" alt="">
                                                </a>
                                            </div>
                                            <li><a href="gallery.jsp">Galerija</a></li>
                                            
                                        </ul>
                                    </nav>
                                </div>
                            </div>
                            <div class="col-xl-2 col-lg-2 d-none d-lg-block">
                                <div class="custom_order">
                                    <a href="login.jsp" class="boxed_btn_white">Prijavite se</a>
                                </div>
                            </div>
                            <div class="col-12">
                                <div class="mobile_menu d-block d-lg-none"></div>
                            </div>
                            <div class="logo-img-small d-sm-block d-md-block d-lg-none">
                                <a href="index.jsp">
                                    <img src="img/logo.png" alt="">
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        <!-- header-end -->
        <%}%>
    </body>
</html>
