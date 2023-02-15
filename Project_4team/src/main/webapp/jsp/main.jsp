<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Modern Business - Start Bootstrap Template</title>
        <!-- Favicon-->
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="../css/styles.css" rel="stylesheet" />
        <!-- 		아이콘 -->
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css" integrity="sha512-SzlrxWUlpfuzQ+pcUCosxcglQRNAq/DZjVsC0lE40xsADsfeQoEypE+enwcOiGjk/bSuGGKHEyjSoQ1zVisanQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>

    <body class="d-flex flex-column h-100">
        <main class="flex-shrink-0">
            <!-- Navigation-->
            <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
                <div class="container px-5">                
                    <a class="navbar-brand" href="index.html">Space for team</a>
                    
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
            <!-- Header-->
      <header class="bg-dark py-5">
            <div class="container px-4 px-lg-5 my-5">
            <div class="text-center text-white">
               <h1 class="display-4 fw-bolder">Space for team</h1>
               
<!-- 검색창 -->
    <div class="searchmain">
       <input type="text" class="form-control" placeholder="공간명으로 찾아보세요" style="text-align:left; width:550px; height:35px;" >
    </div>
<div class="ser-main" >
       <button type="button" class="form-control" style="text-align:left; width:40px; height:35px;"><i class="fa-solid fa-magnifying-glass"></i></button>  
	</div> 

<div class="selmain" >                                     
       <select class="form-control" style="text-align:left; width:150px; height:35px;" >
           <option value="" disabled selected> 지역 </option>
              <option value='1'>서울</option>
			  <option value='2'>부산</option>
			  <option value='3'>대구</option>
			  <option value='4'>인천</option>
			  <option value='5'>광주</option>
			  <option value='6'>대전</option>
			  <option value='7'>울산</option>
			  <option value='8'>강원</option>
			  <option value='9'>경기</option>
			  <option value='10'>경남</option>
			  <option value='11'>경북</option>
			  <option value='12' >전남</option>
			  <option value='13'>전북</option>
			  <option value='14'>제주</option>
			  <option value='15'>충남</option>
			  <option value='16'>충북</option>  
       </select>
	</div>
   
    <div class="selmain">   
    <input type="number" min="1" placeholder="인원" class="form-control" 
     style="display:inline-block;position: relative;  text-align:left; width:150px; height:35px; ">                                 
   	</div>   
  
   	<div class="selmain">                                     
       <select class="form-control" style="text-align:left; width:150px; height:35px;">
           <option value="" disabled selected> 가격 </option>
           <option>1</option>
           <option>2</option>
           <option>3</option>  
       </select>
    </div> 
         
<!-- 	달력 -->
<input
  type="date"
  data-placeholder="날짜"
  required
  aria-required="true"
  value={startDateValue}
  className={styles.selectDay}
  onChange={StartDateValueHandler} 
  class="form-control" 
  style="display:inline-block;position: relative; top: 18px; text-align:left; width:150px; height:35px; ">
 
	
</div>
</div>




            </header>
            <!-- Features section-->
                <!-- Blog preview section-->
            <section class="py-5">
                <div class="container px-5 my-5">
                    <div class="row gx-5 justify-content-center">
                        <div class="col-lg-8 col-xl-6">
                            <div class="text-center">
                                <h2 class="fw-bolder">새로 들어온 공간 둘러보기</h2>
                                <p class="lead fw-normal text-muted mb-5">오직 space for team에서만 볼 수 있는 공간을 준비했어요</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
<!-- 공간프리뷰 1 -->	
<div class="col-lg-4 mb-5"><a href="../html/hostmain.html">
    <div class="card h-100 shadow border-0">
<!--     							호스트가 올린 공간 DB를 연결..? 사진,공간이름,호스트이름,리뷰갯수,찜갯수-->
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">꿈나라 스터디룸</h5></a>
            	 <p class="card-text mb-0">서면역 5분거리</p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold">host name</div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
               </a>
           </div>
<!-- 공간프리뷰 2 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">꿈나라 스터디룸</h5></a>
            	 <p class="card-text mb-0">서면역 5분거리</p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold">host name</div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>
           <!-- 공간프리뷰 3 -->	
<div class="col-lg-4 mb-5">
    <div class="card h-100 shadow border-0">
        <img class="card-img-top" src="s1.jpg" alt="..." />
        	<div class="card-body p-4">
            	<div class="badge bg-primary bg-gradient rounded-pill mb-2">New</div>
           		 <a class="text-decoration-none link-dark stretched-link" href="#!"><h5 class="card-title mb-3">꿈나라 스터디룸</h5></a>
            	 <p class="card-text mb-0">서면역 5분거리</p>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">
                <div class="d-flex align-items-center">
               			 <!-- 호스트 프로필 사진 -->
                         <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." />
                             <div class="small">
                                   <div class="fw-bold">host name</div>
                                   <div class="text-muted">
                                    <i class="fa-solid fa-user fa-sm">최대 6명</i>
									<i class="fa-solid fa-comment fa-sm">리뷰12</i>
									<i class="fa-solid fa-heart fa-sm">찜3</i> 
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
               </div>
           </div>

                       
<!--             <section class="py-5" id="features"> -->
<!--                 <div class="container px-5 my-5"> -->
<!--                     <div class="row gx-5"> -->
<!--                         <div class="col-lg-4 mb-5 mb-lg-0"><h2 class="fw-bolder mb-0">A better way to start building.</h2></div> -->
<!--                         <div class="col-lg-8"> -->
<!--                             <div class="row gx-5 row-cols-1 row-cols-md-2"> -->
<!--                                 <div class="col mb-5 h-100"> -->
<!--                                     <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-collection"></i></div> -->
<!--                                     <h2 class="h5">Featured title</h2> -->
<!--                                     <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p> -->
<!--                                 </div> -->
<!--                                 <div class="col mb-5 h-100"> -->
<!--                                     <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-building"></i></div> -->
<!--                                     <h2 class="h5">Featured title</h2> -->
<!--                                     <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p> -->
<!--                                 </div> -->
<!--                                 <div class="col mb-5 mb-md-0 h-100"> -->
<!--                                     <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div> -->
<!--                                     <h2 class="h5">Featured title</h2> -->
<!--                                     <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p> -->
<!--                                 </div> -->
<!--                                 <div class="col h-100"> -->
<!--                                     <div class="feature bg-primary bg-gradient text-white rounded-3 mb-3"><i class="bi bi-toggles2"></i></div> -->
<!--                                     <h2 class="h5">Featured title</h2> -->
<!--                                     <p class="mb-0">Paragraph of text beneath the heading to explain the heading. Here is just a bit more text.</p> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </section> -->
<!--             Testimonial section -->
<!--             <div class="py-5 bg-light"> -->
<!--                 <div class="container px-5 my-5"> -->
<!--                     <div class="row gx-5 justify-content-center"> -->
<!--                         <div class="col-lg-10 col-xl-7"> -->
<!--                             <div class="text-center"> -->
<!--                                 <div class="fs-4 mb-4 fst-italic">"Working with Start Bootstrap templates has saved me tons of development time when building new projects! Starting with a Bootstrap template just makes things easier!"</div> -->
<!--                                 <div class="d-flex align-items-center justify-content-center"> -->
<!--                                     <img class="rounded-circle me-3" src="https://dummyimage.com/40x40/ced4da/6c757d" alt="..." /> -->
<!--                                     <div class="fw-bold"> -->
<!--                                         Tom Ato -->
<!--                                         <span class="fw-bold text-primary mx-1">/</span> -->
<!--                                         CEO, Pomodoro -->
<!--                                     </div> -->
<!--                                 </div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </div> -->
<!--                 </div> -->
<!--             </div> -->
     
                        
                        
<!--                     </div> -->
<!--                     Call to action -->
<!--                     <aside class="bg-primary bg-gradient rounded-3 p-4 p-sm-5 mt-5"> -->
<!--                         <div class="d-flex align-items-center justify-content-between flex-column flex-xl-row text-center text-xl-start"> -->
<!--                             <div class="mb-4 mb-xl-0"> -->
<!--                                 <div class="fs-3 fw-bold text-white">New products, delivered to you.</div> -->
<!--                                 <div class="text-white-50">Sign up for our newsletter for the latest updates.</div> -->
<!--                             </div> -->
<!--                             <div class="ms-xl-4"> -->
<!--                                 <div class="input-group mb-2"> -->
<!--                                     <input class="form-control" type="text" placeholder="Email address..." aria-label="Email address..." aria-describedby="button-newsletter" /> -->
<!--                                     <button class="btn btn-outline-light" id="button-newsletter" type="button">Sign up</button> -->
<!--                                 </div> -->
<!--                                 <div class="small text-white-50">We care about privacy, and will never share your data.</div> -->
<!--                             </div> -->
<!--                         </div> -->
<!--                     </aside> -->
<!--                 </div> -->
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
