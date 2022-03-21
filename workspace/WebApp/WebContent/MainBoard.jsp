<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="Post.WebAppDAO" %>
<%@ page import="Post.Post" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<h2>자유게시판</h2>
<link rel="stylesheet" href="css\bootstrap-3.3.2-dist\css\bootstrap.css">
<style>
	 @media (min-width: 768px){
        .contianer{
          width: 750px;
        }
      }
      @media (min-width: 992px){
        .contianer{
          width: 970px;
        }
      }
      @media (min-width: 1200px){
        .contianer{
          width: 1170px;
          float: none;
          margin: auto;
        }
      }
      .contentList tr:hover{ background-color: beige;}
</style>
<script src="js\jquery-3.6.0.min.js"></script>
<script type="text/javascript">
        function setPage(){
          var PageNo = Math.ceil($('.contentList tr').length/5);
          $('.page').append("<li class="+"page-item"+"><a class="+"page-link"+" onclick="+"PageStep(1)"+" href="+"#"+">Previous</a></li>");
          for(var i=1; i<=PageNo; i++){
            $('.page').append("<li class="+"page-item"+"><a id="+i+" class="+"page-link"+" onclick="+"MakePage("+i+")"+" href="+"#"+">"+i+"</a></li>");			    
          }
          $('.page').append("<li class="+"page-item"+"><a class="+"page-link"+" onclick="+"PageStep(2)"+" href="+"#"+">Next</a></li>");
          $('#'+1).addClass("active");  //페이지 최초 로딩시 첫번째 자식에 active 클래스 생성
          MakePage($('.active').text());    
        }
        function MakePage(value){
          $('.contentList tr').hide();                   //모든 테이블 숨김 처리
          if(value-1 <= 0){
        	  var start = 1;
        	  var end = value*5+1;
          }
          else{
        	  var start = (value-1)*5+1;               //출력될 글의 시작점과 끝지점 처리
        	  var end = value*5+1;
          }
          
          var result = $('.active').text();
          $('.active').removeClass();
          $('#'+result).addClass('page-link');
          $('#'+value).addClass('page-link active');
          $('.contentList tr').eq(0).show();
          for(var i=start; i<end; i++){
        	  $('.contentList tr').eq(i).show();
        	  }          //지정된 글 출력        
        }

        function PageStep(option){
          var answer = $('.active').text();
          var PageNo = Math.ceil($('.table tr').length/5)-1;
          var result;
          if(option == 1){result = parseInt(answer)-1;  }
          else {result = parseInt(answer)+1; }

          if(result <= 0){
              alert("첫번째 페이지입니다!");
              result = 1;                        
              return
            }
          else if(result > PageNo){
             result = PageNo;
             alert("마지막 페이지입니다!");
             return; 
            }
            MakePage(result);
        }
        function searchTitle(keyword){
          $('.contentList tr').hide();
          let arr = $('.title').text().split(' ');
          for(var i=0; i<$('.table tr').length; i++){
            if(arr[i] == keyword || arr[i].includes(keyword)){
              $('.contentList tr').eq(i).show();
            }
          }
        }

    </script>
</head>
<body>
<%  
	int pageNumber = 1;
	if((request.getParameter("pageNumber")).equals("0")){
		response.sendRedirect("./MainBoard.jsp?pageNumber=1");
	}else{
		if(request.getParameter("pageNumber") != null){
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}	
	}
	
	%>
	<div class="contianer">
		<div class="row">
			<table class="contentList table table-bordered">
			 <tr>
                  <td width="10%"></td>
                  <td align="center"><strong>제목</strong></td>
                  <td width="10%" align="center"><strong>작성자</strong></td>
                  <td width="10%" align="center"><strong>작성일</strong></td>
                  <td width="10%" align="center"><strong>조회수</strong></td>
                </tr>
                <%
                	WebAppDAO webappDAO = new WebAppDAO();
                	ArrayList<Post> list = webappDAO.getList(pageNumber);
                	for(int i=0; i < list.size(); i++){
                %>        
           
				<tr> 
                  <td width="10%" align="center"><strong><%= list.get(i).getType() %></strong></td>
                  <td><a class="title" href="list1\listView.html"><strong><%= list.get(i).getTitle() %></strong></a></td>
                  <td width="10%" align="center"><strong><%= list.get(i).getWriter()%></td>
                  <td width="10%" align="center"><strong><%= list.get(i).getDate()%></td>
                  <td width="10%" align="center"><strong><%= list.get(i).getCount()%></td>
                </tr>
                <%} %>
			</table>
		</div>
		<input class="btn btn-default" id="searchBox" type="text" >
		<button class="btn btn-default" type="button" onclick="searchTitle($('#searchBox').val())">검색</button>
	    <button class="btn btn-default pull-right" onclick="location.href='input.jsp';">글쓰기</button>
	    
	</div>
	<nav aria-label="Page navigation example" style="text-align: center;">
		<ul class="page pagination">
			<button class="btn btn-default"><a class=page-link onclick="location.href='MainBoard.jsp?pageNumber=<%=pageNumber-1%>';">Previous</a></button>
			<% int num = webappDAO.pageNumber();
			   for(int i=0; i < num; i++){
			%>
			<button class="btn btn-default"><a class=page-link onclick="location.href='MainBoard.jsp?pageNumber=<%=i+1%>';"><%=i+1%></a></button>
			<% } %>
			<button class="btn btn-default"><a class=page-link onclick="location.href='MainBoard.jsp?pageNumber=<%=pageNumber+1%>';">Next</a></button>
		</ul>
	</nav>
</body>
</html>