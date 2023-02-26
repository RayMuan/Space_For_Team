<%@page import="com.space4team.booking.db.BookingDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">	
	<head>
       <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content />
        <meta name="author" content />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/styles.css" rel="stylesheet" />
          <script src="script/jquery-3.6.3.js"></script>
      <script type="text/javascript" src="script/jquery-3.6.3.js">  </script>
      <script language="javascript">
     
    </script> 
    </head>
    <body class="d-flex flex-column">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">
                    <a class="navbar-brand" href="index.html">Start Bootstrap</a>
                    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                            <li class="nav-item"><a class="nav-link" href="index.html">Home</a></li>
                            <li class="nav-item"><a class="nav-link" href="about.html">About</a></li>
                            <li class="nav-item"><a class="nav-link" href="contact.html">Contact</a></li>
                            <li class="nav-item"><a class="nav-link" href="pricing.html">Pricing</a></li>
                            <li class="nav-item"><a class="nav-link" href="faq.html">FAQ</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Blog</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="blog-home.html">Blog Home</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">Blog Post</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">Portfolio</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="portfolio-overview.html">Portfolio Overview</a></li>
                                    <li><a class="dropdown-item" href="portfolio-item.html">Portfolio Item</a></li>
                                </ul>
                            </li>
                        </ul>
                    </div>
                </div>
            </nav>
            <!-- Page content-->
            <section class="py-5">
                <div class="container px-5">
                    <!-- Contact form-->
                    <div class="bg-light rounded-3 py-5 px-4 px-md-5 mb-5">
                        <div class="text-center mb-5">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><p>&#x1F3E0</p></div>
                            <h1 class="fw-bolder">결제완료!</h1>
                            <p class="lead fw-normal text-muted mb-0">결제 내역입니다.</p>
                        </div>
                        <div class="row gx-5 justify-content-center">
                            <div class="col-lg-8 col-xl-6">    
                            <% 
								
                           BookingDTO dto = (BookingDTO)request.getAttribute("dto");
                         
                            
                            
                            
								%>		
                                <form action="SpaceUpdatePro.sp" name="form" method = "post" enctype="multipart/form-data">
                            		
                            		
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_num()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약번호</label>
                              
                                    </div>
									
                                    
                                    <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getS_num()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>공간번호</label>
                                       
                                    </div>
                                    
                                    
                                        <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_usercount()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약인원</label>
                                       
                                    </div>
                                    
                                        <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_date()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약날짜</label>
                                       
                                    </div>
                                    
                                    
                                        <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_price()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>예약금액</label>
                                       
                                    </div>
                                                                       
                                        <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_usetime()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>사용시간</label>
                                       
                                    </div>
                                    
                                    
                                        <div class="form-floating mb-3">
                                        <input class="form-control" name="name" type="text" value="<%=dto.getBk_endtime()%> "  readonly="readonly">
                                        <label for="name"><i class="bi bi-star-fill text-warning"></i>종료시간</label>
                                       
                                    </div>
                                    
                                    
                                </form>
                            </div>
                        </div>
                    </div>
                    <!-- Contact cards-->
                   <div class="row gx-5 row-cols-2 row-cols-lg-4 py-5 justify-content-center">
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-people"></i></div>
                            <div class="h5">Ask the community</div>
                            <p class="text-muted mb-0">설명적기 </p>
                        </div>
                        
                        <div class="col">
                            <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-telephone"></i></div>
                            <div class="h5">Call us</div>
                            <p class="text-muted mb-0">설명적기</p>
                        </div>
                    </div>
                </div>
            </section>
        </main>
        <!-- Footer-->
        <footer class="bg-dark py-4 mt-auto">
            <div class="container px-5">
                <div class="row align-items-center justify-content-between flex-column flex-sm-row">
                    <div class="col-auto"><div class="small m-0 text-white">Copyright &copy; Your Website 2022</div></div>
                    <div class="col-auto">
                        <a class="link-light small" href="#!">Privacy</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Terms</a>
                        <span class="text-white mx-1">&middot;</span>
                        <a class="link-light small" href="#!">Contact</a>
                    </div>
                </div>
            </div>
        </footer>


    </body>
</html> 