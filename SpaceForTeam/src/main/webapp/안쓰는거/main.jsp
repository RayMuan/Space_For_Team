<%@page import="java.util.ArrayList"%>
<%@page import="com.space4team.space.db.SpaceDAO"%>
<%@page import="com.space4team.space.db.SpaceDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
        <link href="css/styles1.css?after" rel="stylesheet" />
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
                            <li class="nav-item"><a class="nav-link" href="faq.html">공지사항</a></li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownBlog" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">회원가입</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownBlog">
                                    <li><a class="dropdown-item" href="MemberLoginPro.sp">게스트 회원가입</a></li>
                                    <li><a class="dropdown-item" href="blog-post.html">호스트 회원가입</a></li>
                                </ul>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link dropdown-toggle" id="navbarDropdownPortfolio" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">로그인</a>
                                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdownPortfolio">
                                    <li><a class="dropdown-item" href="user/login.jsp">게스트 로그인</a></li>
                                    <li><a class="dropdown-item" href="host/hostLogin.jsp">호스트 로그인</a></li>
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
  
		<%
//              ArrayList<SpaceDTO> spaceList = (ArrayList<SpaceDTO>)request.getAttribute("spaceList");
      
//              int currentPage = (Integer)request.getAttribute("currentPage");
//              int startPage = (Integer)request.getAttribute("startPage");
//              int pageBlock = (Integer)request.getAttribute("pageBlock");
//              int endPage = (Integer)request.getAttribute("endPage");
//              int pageCount = (Integer)request.getAttribute("pageCount");
            
//              String search=(String)request.getAttribute("search");
            
             
             
            	 %>                 
<!-- 검색창 -->
<form action="MainPro.sp" method="post">
    <div class="searchmain">
       <input type="text" name="search" class="form-control" placeholder="공간명으로 찾아보세요" style="text-align:left; width:550px; height:35px;" >
    </div>

<div class="ser-main" >
       <button type="submit" value="search" class="form-control" style="text-align:left; width:40px; height:35px;"><i class="fa-solid fa-magnifying-glass"></i></button>  
	</div> 
</form>

<form>
<div class="selmain" >

		<select class="form-control" style="text-align:center; width:150px; height:35px;" name="h_area1" onChange="cat1_change(this.value,h_area2)" >
		
   <option value="" disabled selected>시/도</option>

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

<option value='12'>전남</option>

<option value='13'>전북</option>

<option value='14'>제주</option>

<option value='15'>충남</option>

<option value='16'>충북</option>
</select>
</div>

<div class="selmain" >

  		<select class="form-control" style="text-align:center; top:20; width:150px; height:35px;" name="h_area2">
			<option value="" disabled selected>구/군</option>
		</select>
	


</div>


<script language=javascript>

 var cat1_num = new Array(1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16);

 var cat1_name = new Array('서울','부산','대구','인천','광주','대전','울산','강원','경기','경남','경북','전남','전북','제주','충남','충북');

 var cat2_num = new Array();

 var cat2_name = new Array();

 cat2_num[1] = new Array(17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41);

 cat2_name[1] = new Array('강남구','강동구','강북구','강서구','관악구','광진구','구로구','금천구','노원구','도봉구','동대문구','동작구','마포구','서대문구','서초구','성동구','성북구','송파구','양천구','영등포구','용산구','은평구','종로구','중구','중랑구');

 cat2_num[2] = new Array(42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57);

 cat2_name[2] = new Array('강서구','금정구','남구','동구','동래구','부산진구','북구','사상구','사하구','서구','수영구','연제구','영도구','중구','해운대구','기장군');

 cat2_num[3] = new Array(58,59,60,61,62,63,64,65);

 cat2_name[3] = new Array('남구','달서구','동구','북구','서구','수성구','중구','달성군');

 cat2_num[4] = new Array(66,67,68,69,70,71,72,73,74,75);

 cat2_name[4] = new Array('계양구','남구','남동구','동구','부평구','서구','연수구','중구','강화군','옹진군');

 cat2_num[5] = new Array(76,77,78,79,80);

 cat2_name[5] = new Array('광산구','남구','동구','북구','서구');

 cat2_num[6] = new Array(81,82,83,84,85);

 cat2_name[6] = new Array('대덕구','동구','서구','유성구','중구');

 cat2_num[7] = new Array(86,87,88,89,90);

 cat2_name[7] = new Array('남구','동구','북구','중구','울주군');

 cat2_num[8] = new Array(91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108);

 cat2_name[8] = new Array('강릉시','동해시','삼척시','속초시','원주시','춘천시','태백시','고성군','양구군','양양군','영월군','인제군','정선군','철원군','평창군','홍천군','화천군','횡성군');

 cat2_num[9] = new Array(109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148);

 cat2_name[9] = new Array('고양시 덕양구','고양시 일산구','과천시','광명시','광주시','구리시','군포시','김포시','남양주시','동두천시','부천시 소사구','부천시 오정구','부천시 원미구','성남시 분당구','성남시 수정구','성남시 중원구','수원시 권선구','수원시 장안구','수원시 팔달구','시흥시','안산시 단원구','안산시 상록구','안성시','안양시 동안구','안양시 만안구','오산시','용인시','의왕시','의정부시','이천시','파주시','평택시','하남시','화성시','가평군','양주군','양평군','여주군','연천군','포천군');

 cat2_num[10] = new Array(149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168);

 cat2_name[10] = new Array('거제시','김해시','마산시','밀양시','사천시','양산시','진주시','진해시','창원시','통영시','거창군','고성군','남해군','산청군','의령군','창녕군','하동군','함안군','함양군','합천군');

 cat2_num[11] = new Array(169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192);

 cat2_name[11] = new Array('경산시','경주시','구미시','김천시','문경시','상주시','안동시','영주시','영천시','포항시 남구','포항시 북구','고령군','군위군','봉화군','성주군','영덕군','영양군','예천군','울릉군','울진군','의성군','청도군','청송군','칠곡군');

 cat2_num[12] = new Array(193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214);

 cat2_name[12] = new Array('광양시','나주시','목포시','순천시','여수시','강진군','고흥군','곡성군','구례군','담양군','무안군','보성군','신안군','영광군','영암군','완도군','장성군','장흥군','진도군','함평군','해남군','화순군');

 cat2_num[13] = new Array(215,216,217,218,219,220,221,222,223,224,225,226,227,228,229);

 cat2_name[13] = new Array('군산시','김제시','남원시','익산시','전주시 덕진구','전주시 완산구','정읍시','고창군','무주군','부안군','순창군','완주군','임실군','장수군','진안군');

 cat2_num[14] = new Array(230,231,232,233);

 cat2_name[14] = new Array('서귀포시','제주시','남제주군','북제주군');

 cat2_num[15] = new Array(234,235,236,237,238,239,240,241,242,243,244,245,246,247,248);

 cat2_name[15] = new Array('공주시','논산시','보령시','서산시','아산시','천안시','금산군','당진군','부여군','서천군','연기군','예산군','청양군','태안군','홍성군');

 cat2_num[16] = new Array(249,250,251,252,253,254,255,256,257,258,259,260);

 cat2_name[16] = new Array('제천시','청주시 상당구','청주시 흥덕구','충주시','괴산군','단양군','보은군','영동군','옥천군','음성군','진천군','청원군');

function cat1_change(key,sel){

 if(key == '') return;

 var name = cat2_name[key];

 var val = cat2_num[key];



 for(i=sel.length-1; i>=0; i--)

  sel.options[i] = null;

 sel.options[0] = new Option('-선택-','', '', 'true');

 for(i=0; i<name.length; i++){

  sel.options[i+1] = new Option(name[i],val[i]);

 }

}
</script>
  </form>
  
    <div class="selmain">   
    <input type="number"  placeholder="인원"  min="1"  class="form-control" 
     style="display:inline-block; position: relative;  text-align:center; width:150px; height:35px; "> 
                                     
   	</div>   
  
   	<div class="selmain">                                     
       <select class="form-control" style="text-align:center; width:150px; height:35px;">
           <option value="" disabled selected> 가격 </option>
           <option>1만원 이하</option>
           <option>1만원 이상 ~ 3만원 이하</option>
           <option>3만원 이상 ~</option>  
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
  style="display:inline-block;position: relative; top: 18px; text-align:center; width:150px; height:35px; ">
 
	
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
                                <h2 class="fw-bolder">공간 둘러보기</h2>
                                <p class="lead fw-normal text-muted mb-5">space for team에서 볼 수 있는 공간을 준비했어요</p>
                            </div>
                        </div>
                    </div>
                    <div class="row gx-5">
            
	<%
// 	for (int i = 0; i<spaceList.size(); i++){
// 		SpaceDTO dto = spaceList.get(i);
	%>            		
<!-- 공간프리뷰 1	 -->
<div class="col-lg-4 mb-5">
  
    <div class="card h-100 shadow border-0" onclick="location.href='SpaceInfoPro.sp?num=51'">
<%--         <img class="card-img-top" src=<%=dto.getS_file() %> alt="..." /> --%>
        	<div class="card-body p-4">
<%--             	<div class="badge bg-primary bg-gradient rounded-pill mb-2"><%=dto.getS_num() %></div> --%>
                 		                                                                                        <!-- 여기에 공간상세페이지 링크걸기! -->
<%--            		 <div class="text-decoration-none link-dark stretched-link" style="cursor: pointer;" onclick="location.href='main.jsp';" ><h5 class="card-title mb-3"><%=dto.getS_name() %></h5></div> --%>
<%--             	 <p class="card-text mb-0"><%=dto.getS_memo() %></p> --%>
        	</div>
        <div class="card-footer p-4 pt-0 bg-transparent border-top-0">
            <div class="d-flex align-items-end justify-content-between">                    
				<div class="d-flex align-items-center" style="font-weight: bold; font-size: 20px;">
<%-- 					<%=dto.getS_bill() %> 원   --%>
					
				</div>
                             <div class="small">
                                   
                                   <div class="text-muted">
      <div class="fw-bold">
<%--       <i class="fa-solid fa-map-location-dot"> <%=dto.getS_sido() %></i> | --%>
<%--       <i class="fa-solid fa-user fa-sm"> 최대 <%=dto.getS_max() %></i> |      --%>
      <i class="fa-solid fa-comment fa-sm">개</i>
      
      </div>
                                   </div>
                               </div>
                           
                       </div>
                   </div>
               </div>
           </div>
	<%
// 	}
	%> 		
 <div class="page">        
<%
// if(search == null){
//    //    검색어 없을때,, 
//       //10페이지 이전
//       if(startPage > pageBlock){
         %>
<%--       <a href="MainPro.sp?pageNum=<%=startPage-pageBlock%>">이전</a> --%>
         <%
//       }
//       for(int i=startPage;i<=endPage;i++){
         %>
<%--          <a href="MainPro.sp?pageNum=<%=i%>"><%=i %></a>  --%>
         <%
//       }
      //10페이지 다음
//       if(endPage < pageCount){
         %>
<%--       <a href="MainPro.sp?pageNum=<%=startPage+pageBlock%>">Next</a> --%>
         <%
//       }
//       }else {
//    //    검색어 있을때,,
//       //10페이지 이전
//       if(startPage > pageBlock){
         %>
<%--       <a href="MainPro.sp?pageNum=<%=startPage-pageBlock%>&search=<%=search%>">Prev</a> --%>
         <%
//       }
//       for(int i=startPage;i<=endPage;i++){
         %>
<%--          <a href="MainPro.sp?pageNum=<%=i%>&search=<%=search%>"><%=i %></a>  --%>
         <%
//       }
      //10페이지 다음
//       if(endPage < pageCount){
         %>
<%--       <a href="MainPro.sp?pageNum=<%=startPage+pageBlock%>&search=<%=search%>">다음</a> --%>
         <%
//       }
// }
%>
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
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/scripts.js"></script>
    </body>
</html>
