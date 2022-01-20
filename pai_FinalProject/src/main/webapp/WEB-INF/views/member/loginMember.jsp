<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="title" value="로그인"/>
</jsp:include>
<style>
	* {
	  margin: 0;
	  padding: 0;
	  box-sizing: border-box;
	  font-family: 'Do Hyeon', sans-serif;
	}
	.wrap {
	  width: 100%;
	  height: 100vh;
	  display: flex;
	  align-items: center;
	  justify-content: center;
	  background: rgba(0, 0, 0, 0.1);
	}
	.login {
	  width: 30%;
	  height: 600px;
	  background: white;
	  border-radius: 20px;
	  display: flex;
	  justify-content: center;
	  align-items: center;
	  flex-direction: column;
	}
	
	h2 {
	  color: #6710f242;
	  font-size: 2em;
	}	
	.form-floating,.checkbox{
		color:purple;
	}
	.submit {
	  margin-top: 25px;
	  width: 80%;
	}
	.enrollMember {
	  margin-top: 10px;
	  width: 80%;
	}
	.enrollMember input{
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	 
	}
	.submit button{
	  width: 100%;
	  height: 50px;
	  border: 0;
	  outline: none;
	 
	}
	.btn-outline-secondary:hover{
	   background-color: #6710f242;
	   border: 1px solid #6710f242;
	}
	.btn-outline-secondary{
	   border: 1px solid #6710f242;
	   color:#6710f242;
	}
	.checkbox{
 		justify-content: left;
	}
	</style>
<body>
	<form class="wrap" action="<%=request.getContextPath()%>/member/memberLogin.do" method="post">
        <div class="login">
            <h2>HELP-WORK</h2>
            <h2>LOGIN</h2><br>
            <div style="width: 80%;">
	            <div class="form-floating mb-3" style="width: 100%">
		            <!-- <label for="exampleInputEmail1" class="form-label">아이디</label> -->
				  	<%-- <input type="text" class="form-control" id="floatingInput" name="memberId" placeholder="name@example.com" value="<%=saveId!=null?saveId:""%>"> --%>
				  	<label for="floatingInput">email로 입력하세요</label>
				</div>
			</div>	
			
          
            <div style="width: 80%;">
					<div class="form-floating" style="width: 100%">
					  <input type="password" class="form-control" id="floatingPassword" name="memberPwd" placeholder="Password">
					  <label for="floatingPassword">패스워드를 입력하세요</label>
					</div>
			</div>
			  <div class="login_etc" style="margin-top: 15px;">
                <div class="checkbox">
                	<%-- <input type="checkbox" name="saveId" id="saveId" <%=saveId!=null?"checked":""%>> --%>
                	<label for="saveId">아이디저장</label>
                </div>
            </div>
            <div class="submit btn-outline-secondary">
            	
                <button type="submit" value="로그인" class="btn btn-outline-secondary">로그인</button>
            
            </div>
	        <div class="enrollMember btn-outline-secondary">
 		        <input type="button" class="btn btn-outline-secondary" value="회원가입" onclick="location.assign('${path}/member/enrollMember.do')">
		        
	        </div>
			<br>
                <div style="width: 80%;">
                	<div style="width: 49%; display: inline-block;">
                		<input type="button" class="btn btn-outline-secondary" value="아이디 찾기" onclick="findMemberId();" style="width: 100%;">
                	</div>
	 		        <div  style="width: 49%; display: inline-block;">
	 		        	<input type="button" class="btn btn-outline-secondary" value="패스워드 찾기" onclick="" style="width: 100%;">
	 		        </div>
            	</div> 
        </div>
    </form>
</body>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>