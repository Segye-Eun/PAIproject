<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쪽지함</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="http://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
	<div id="header-container">		
		<h2>받은쪽지함</h2>
	</div>
	<div id="searchMessage">
	</div>
	<div id="recvMsg">
		<table>
			<thead>
				<tr>
					<th>체크박스</th>
					<th>번호</th>
					<th>제목</th>
					<th>보낸사람</th>
					<th>날짜</th>
				</tr>
			</thead>
			<tbody>
			
				<c:forEach var="m" items="${list }">	
					<tr onclick='recvMsgView(this);' style='text-align:center'>
						<td><input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"></td>
						<td><c:out value="${m.msgNo }"/></td>
						<td><c:out value="${m.msgTitle }"/></td>
						<td><c:out value="${m.sendId.member_nick}"/></td>
						<td><fmt:formatDate type="both" pattern="yyyy년 MM월 dd일 (E) hh:mm" value="${m.msgSendTime}"/></td>
					</tr>
				</c:forEach>

			</tbody>
		</table>
		 <div id="pageBar">
	        	${pageBar }
	     </div>
	</div>

</body>

<script>

function recvMsgView(e){
	let val = $(e).children();//이벤트발생한곳의 자식들
	let msgNo = val.eq(0).text();//project No 가져와
	$.ajax({
		url:"${path}/message/recvMsgDetail.do",
		type: "post",
		dataType: "json",
		success: data => {
			console.log("과연"+data);
		}
	});
}


/* $(document).ready(()=>{
	selectRecvMessage();
});

const selectRecvMessage(){
	$.ajax({
		url:"${path}/message/messageBox.do",
		type:'post',
		dataType:'json',
		success:data=>{
			const table=$('<table>');
			let thead=$("<thead>");
			let tbody=$('<tbody>');
			let tr=$("<tr>");
			let th1=$("<th>").html("체크박스");
			let th2=$("<th>").html("번호");
			let th3=$("<th>").html("제목");
			let th4=$("<th>").html("보낸사람");
			let th5=$("<th>").html("날짜");
			thead.append(tr).append(th1).append(th2).append(th3).append(th4).append(th5);
			table.append(thead);
			
			if(data.length==0){
				let tr2 = $("<tr>");
				let ntd=$("<td>").html("조회결과가 없습니다.");
				ntd.attr("colspan","5");
				tr.css("text-align","center");
				tr2.append(ntd);
				tbody.append(tr2);
				table.append(tbody);
			}  else{
				
				for(let i=0; i<data.length; i++){
					let tr2 = $("<tr>");
					let check = $("<td>").html('check');
					let sendId = $('<input>').attr({type:"hidden",name:"sendId",id:"sendId",value:data[i]["send_id"]});
					positionCode.append(inputPositionCode);
					let sendNick = $("<td>").html(data[i]["send_id"]["member_nick"]);
					let inputPositionName = $('<input>').attr({type:"hidden",name:"positionName",id:"positionName",value:data[i]["positionName"]});
					positionName.append(inputPositionName);
					let deleteMessage = $("<td>").html("<button>삭제");
					deleteMessage.children('button').attr({id:"deleteMessage"+i, class:"btn btn-outline-secondary"});
					deleteMessage.children('button').attr("onclick","deleteMessage(this);");
					table.append(tbody);
					tbody.append(tr2);
					tr2.append(positionCode).append(positionName).append(deleteMessage);
				}
				
			}
			$("#ajaxTable").html(table);
		}
			
	})
} */

</script>
</html>