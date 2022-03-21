<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 작성하기</title>
    <script type="text/javascript"  src="js\jquery-3.6.0.min.js"></script>
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
        }
      }
      .title{
        margin-top: 50px;       /*제목과 내용을 구분하기 위한 스타일입니다.*/
      }
      .submitButton button{
        width: 80px;
        margin: auto;           /*등록 버튼과 취소 버튼의 가로 정렬을 위한 스타일입니다.*/
        display: inline-block;
      }
    </style>
</head>
<body>
	<form method="post" action="writeAction.jsp">  <!--get 방식으로 글 생성을 위한 데이터 전송-->
      <div class="container">
        <div class="row" align="center">
          <label class="title col-md-1">제목</label>
          <input type="text" name="title" class="form-control">
          <div class="checkbox">
            <label>
              <input name="public" type="checkbox" value="1"> 비밀글
            </label>
            <label>
              <input name="public" type="checkbox" value="2"> 댓글 허용
            </label>
            <label>
              <input name="public" type="checkbox" value="3"> 공지글
            </label>
            <label>이미지 업로드:</label>
            <label><input name="image" type="file"></label>
          </div>
          <label class="col-md-1">내용</label>
          <textarea name="content" rows="35" cols="70" class="form-control"></textarea>
          <div class="mb-3">
            <p class="col-md-4" align="left">첨부 파일: </p>
            <input name="fileResrc" class="form-control" type="file">
          </div>
        </div>
      </div>
      <div class="submitButton" align="center">
        <br>
        <!--작성한 글을 등록하거나 취소하는 버튼입니다, 두 버튼 작동후 목록으로 다시 되돌아옵니다-->
        <button class="list-group-item" type="submit">등록</button>
        <button class="list-group-item" type="button" onclick="location.href='MainBoard.jsp';" value="취소">취소</button>
      </div>
      <br>
    </form>
</body>
</html>