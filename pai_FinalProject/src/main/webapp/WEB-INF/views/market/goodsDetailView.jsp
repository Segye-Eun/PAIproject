<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
			.loading span {
			  display: inline-block;
			  margin: 0 -.075em;
			  animation: loading .8s infinite alternate;
			  text-align: center; font-size: 50px; color: #01DFD7;
			}
			.loading span:nth-child(2) {
			  animation-delay: .1s;
			}
			.loading span:nth-child(3) {
			  animation-delay: .2s;
			}
			.loading span:nth-child(4) {
			  animation-delay: .3s;
			}
			.loading span:nth-child(5) {
			  animation-delay: .4s;
			}
			.loading span:nth-child(6) {
			  animation-delay: .5s;
			}
			.loading span:nth-child(7) {
			  animation-delay: .6s;
			}
			.loading span:nth-child(8) {
			  animation-delay: .7s;
			}
			@keyframes loading {
			  0% {
			    transform: scale(1);
			  }
			  100% {
			    transform: scale(0.8);
			  }
			}
			
.star-rating {
  border:solid 1px #ccc;
  display:flex;
  flex-direction: row-reverse;
  font-size:1.5em;
  justify-content:space-around;
  padding:0 .2em;
  text-align:center;
  width:5em;
}

.star-rating input {
  display:none;
}

.star-rating label {
  color:#ccc;
  cursor:pointer;
}

.star-rating :checked ~ label {
  color:#f90;
}

.star-rating label:hover,
.star-rating label:hover ~ label {
  color:#fc0;
}

.star-ratings {
  color: #aaa9a9; 
  position: relative;
  unicode-bidi: bidi-override;
  width: max-content;
  -webkit-text-fill-color: transparent; /* Will override color (regardless of order) */
  -webkit-text-stroke-width: 1.3px;
  -webkit-text-stroke-color: #2b2a29;
}
 
.star-ratings-fill {
  color: #fff58c;
  padding: 0;
  position: absolute; 
  z-index: 1;
  display: flex;
  top: 0;
  left: 0;
  overflow: hidden;
  -webkit-text-fill-color: gold;
}
 
.star-ratings-base {
  z-index: 0; 
  padding-left: 0;
}			
</style>
<section>
<div class="container">
<!-------------------------------------------MBTI??? ????????? ---------------------------------------------------------->
<jsp:include page="/WEB-INF/views/market/MenuBar.jsp"/>
	 <br>
<!-------------------------------------------????????? ---------------------------------------------------------->
<jsp:include page="/WEB-INF/views/market/searchBar.jsp"/>
	<br>
</div>
<input type="hidden" id="price" >
<div class="container">
    <div class="row">
      <div class="col">
          	<c:if test="${good.image ne null}">
        		<img src="${path}/resources/upload/market/${good.image}" class="img-thumbnail" alt="..." style="width: 500px; height: 500px;">
  			</c:if>
    		<c:if test="${good.image eq null}">
        		<img src="https://hanamsport.or.kr/www/images/contents/thum_detail.jpg" class="img-thumbnail" alt="..." style="width: 500px; height: 500px;">
  			</c:if>
      </div>
      <div class="col">
       <form id="purchaseFrm" action="${path}/market/purchaseGood.do" method="post">
        ???????????? 1 (??????)
        <select class="form-select" id="select_color"  name="orderColor" aria-label="Default select example" required>
            <option disabled selected>????????? ???????????????</option>
            <c:forEach items="${colorList}" var="c">
            	   <option value="${c.color}">${c.color}</option>
            </c:forEach>
          </select>
          <br>
          ???????????? 2 (?????????)
          <select class="form-select"  id="select_size"  name="orderSize" aria-label="Default select example" required>
            <option disabled selected>???????????? ??????????????????</option>
          </select>
          <br>
          ???????????? 3 (MBTI??????) <span style="color:red;">@????????????@</span>
          <select class="form-select" aria-label="Default select example"  id="select_mbti" name="mbtiLogo" required>
            <option disabled selected>MBTI????????? ??????????????????</option>
            <option value="ISTJ">ISTJ</option>
            <option value="ISFJ">ISFJ</option>
            <option value="INFJ">INFJ</option>
            <option value="INTJ">INTJ</option>
            <option value="ISTP">ISTP</option>
            <option value="ISFP">ISFP</option>
            <option value="INFP">INFP</option>
            <option value="INTP">INTP</option>
            <option value="ESTP">ESTP</option>
            <option value="ESFP">ESFP</option>
            <option value="ENFP">ENFP</option>
            <option value="ENTP">ENTP</option>
            <option value="ESTJ">ESTJ</option>
            <option value="ESFJ">ESFJ</option>
            <option value="ENFJ">ENFJ</option>
            <option value="ENTJ">ENTJ</option>
          </select>
          <br>
          ??????
          <input type="number" class="form-control"  min="1" id="inputBuyCount" name="orderCount">
          <br>
         
          <!-- <input type="hidden" class="form-control" start=1 id="inputTotlaPrice" name="totalPrice"> -->
			<%-- <p><fmt:formatNumber var="totalPrice" value=""  type="currency"/>???</p> --%>
			<input type="number"  id="inputTotalPrice" name="orderPrice" readonly>???
		  <br>
          <br>
          <input type="hidden" id="gName"  name="goodsName" value="${good.goodsName}">
          <input type="hidden" id="gNo"  name="goodsNo" value="${good.goodsNo}">
          <button type="button" class="btn btn-outline-primary"  id="purchaseBtn_">????????????</button>
          <button type="button"  id="cartBtn" class="btn btn-outline-info" data-bs-toggle="tooltip" data-bs-placement="top" title="?????? 5????????? ?????? ???????????????" >????????????</button>
       </form>
         <input type="hidden" id="gImage"  name="image" value="${good.image}">
         <input type="hidden" id="memberId"  name="memberId" value="${loginMember.member_id}">
      </div>
    </div>
  </div>
  <br>
  <div class="container">
    <div class="row">
      <div class="col" style="background-color: #E6E6E6; height: 50px; text-align: center; padding-top: 12px; color: #819FF7;">
        ?????? ??????
      </div>
  </div>
 </div>
  <br>

  <div class="container" > 
	<div class="loading"  style="text-align: center;">
		<span>M</span>
		<span>B</span>
		<span>T</span>
		<span>I</span>	
		<span>???</span>
		<span>???</span>
		<span>???</span>
		<span>???</span>
   </div>
</div>

  <div class="container" style="text-align: center;">
	<img src="${path}/resources/images/market/MBTI1.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/MBTI2.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/????????????1.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/????????????2.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/??????.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 2100px;">
	<!-- ????????? ?????? ?????? ?????? ????????? ?????? -->
	<c:if test="${imageList eq null || imageList.size() eq 0}">
    	<img src="https://hanamsport.or.kr/www/images/contents/thum_detail.jpg" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
    </c:if>
    <c:if test="${imageList ne null && imageList.size() ne 0}">
    	<c:forEach items="${imageList}" var="i">
    		<img src="${path}/resources/upload/market/${i.filePath}" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
    	</c:forEach>
    </c:if>
	<!-- ?????? ?????? ????????? (?????? 3??? ?????? ???) -->
	<img src="${path}/resources/images/market/????????????.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<br>
	<br>
	<div style="text-align:center; color:purple;">(?????? ?????????)<br><span style="color:red;">(???/???)</span></div>
	<br>
	<img src="${path}/resources/images/market/?????????1.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/?????????2.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<br>
	<br>
	<div style="text-align:center; color:purple;">(?????? ?????????)</div>
	<br>
	<img src="${path}/resources/images/market/?????????3.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/?????????4.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/????????????.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
	<img src="${path}/resources/images/market/????????????.PNG" class="img-thumbnail" alt="..." style="width: 800px; height: 800px;">
  </div>
	<br>
	<br>
  	<div class="container" style="text-align: center; color:purple;">
		<h3>????????????</h3>
	<table class="table align-middle" style="text-align: center;">
		<thead>
		  <tr>
			<th scope="col">?????????</th>
			<th scope="col">??????</th>
			<th scope="col">?????????</th>
			<th scope="col">MBTI??????</th>
			<th scope="col" >??????</th>
			<th scope="col">????????????</th>
		  </tr>
		</thead>
		<tbody>
		<c:if test="${reviewList eq null || reviewList.isEmpty()}">
			<tr>
				<th colspan="6">????????? ????????? ????????????</th>
			</tr>
		</c:if>
		<c:if test="${reviewList ne null && !reviewList.isEmpty()}">
		<c:forEach items="${reviewList}" var="r">
		  <tr>
			<td>${r.member_id}</td>
			<td>${r.orderDetail.orderColor}</td>
			<td>${r.orderDetail.orderSize}</td>
			<td>${r.orderDetail.mbtiLogo}</td>
			<td>
					<div class="star-ratings" >
						<div class="star-ratings-fill space-x-2 text-lg" >
							<!--  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp -->
							<c:choose>
								<c:when test="${r.grade==1}"><span>???</span></c:when>
								<c:when test="${r.grade==2}"><span>???</span><span>???</span></c:when>
								<c:when test="${r.grade==3}"><span>???</span><span>???</span><span>???</span></c:when>
								<c:when test="${r.grade==4}"><span>???</span><span>???</span><span>???</span><span>???</span></c:when>
								<c:when test="${r.grade==5}"><span>???</span><span>???</span><span>???</span><span>???</span><span>???</span></c:when>
							</c:choose>
						</div>
						<div class="star-ratings-base space-x-2 text-lg">
				<!-- 			&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp -->
							<span>???</span><span>???</span><span>???</span><span>???</span><span>???</span>
						</div>
					</div>
			</td>
			<td style="width:200px;">${r.reviewText}</td>
		  </tr>
		</c:forEach>
		</c:if>

		</tbody>
	  </table>
		
	</div>
	<div style="text-align:center;">
		${pageBar}
	</div>


	<br>
  <div class="container" style="text-align: center;">
	<div class="d-grid gap-2">
		<button class="btn btn-primary" type="button" onclick="location.assign('#nav-menu')">TOP</button>
	  </div>
  </div>

<br>

</section>

<script>

$(document).ready(function () {
    $('#select_color').change(function () {
    	$.ajax({
    		url:"${path}/market/sizeInvenList.do",
    		data:{color:$("#select_color").val(),goodsName:$("#gName").val()}, 
    		success:data=>{
    		$('#select_size').empty();
    		let defoption=$("<option disabled selected>"+"???????????? ???????????????"+"</option>");
    		$('#select_size').append(defoption);
				for(let i=0; i<data.length; i++){
					let option;
					if(data[i].invenCount==0){
						option = $("<option style='color:red;' disabled value='"+data[i].size+"'>"+data[i].size+" ??????</option>");
					}else if(0<data[i].invenCount && data[i].invenCount<5){
						option = $("<option style='color:#F781BE;' value='"+data[i].size+"'>"+data[i].size+" ????????????("+data[i].invenCount+"?????????)</option>");
					}else{
						option = $("<option value='"+data[i].size+"'>"+data[i].size+" -"+data[i].invenCount+"?????????-</option>");
					}
					$('#select_size').append(option);
    			}
    		}	
    	});	
    });
});

$(document).ready(function () {
    $('#select_size').change(function () {
    	$.ajax({
    		url:"${path}/market/goodPrice.do",
    		data:{color:$("#select_color").val(),goodsName:$("#gName").val(),size:$("#select_size").val()}, 
    		success:data=>{
    				$('#price').val(data.price);
    				$('#inputTotalPrice').val(data.price);
    				$('#inputBuyCount').val(1);
    				$('#inputBuyCount').attr("max",data.invenCount);
    			}  
    		})	
    	});	
    });
    
$(document).ready(function () {
    $('#inputBuyCount').change(function () {
    		if($(this).val()<1){
    			alert('????????? ?????? 1????????????. ?????? ???????????????.');
    			$(this).val(1);    		
    		}else if(parseInt($('#inputBuyCount').attr("max"))<$(this).val()){
    			alert('?????? ???????????? ???????????? ?????? ???????????? ??? ????????????. ???????????????');
    			let con = parseInt($(this).val());
    			$(this).val(parseInt($('#inputBuyCount').attr("max")));			
    		}
			let count = parseInt($('#inputBuyCount').val());
			let price = parseInt($('#price').val());		
			let total = count*price;
			$('#inputTotalPrice').val(total);
    	});	
    });
    
    
$(document).on("click", "#cartBtn", function () { 
	
	let color=$("#select_color").val();
	let size=$("#select_size").val();
	let mbti=$("#select_mbti").val();
	let buyCount=$("#inputBuyCount").val();
	let price=$("#inputTotalPrice").val();
	let gNo=$("#gNo").val();
	let gName=$("#gName").val();
	let gImage=$("#gImage").val();
	let memberId=$("#memberId").val();
	
	if(color==null || size==null || mbti==null){
		alert('????????? ?????? ??????????????????! :)');
		return;
	}
	
   	$.ajax({
		url:"${path}/market/addCart.do",
		data:{goodsNo:gNo,goodsName:gName,image:gImage,member_id:memberId,
			color:color,size:size,mbtiLogo:mbti,count:buyCount,price:price}, //???:?????? ???????????? ???????????? ????????????
		success:data=>{
			if(data==999){
				alert('??????????????? ?????? 5????????? ?????????????????????..!');
			}else if(data>0 && data!=999){
				alert('??????????????? ?????????????????????. :)');
			}else{
				alert('???????????? ????????? ?????????????????????. :(');
			}			
		}	
	});

});


$(document).on("click", "#purchaseBtn_", function () { 
	
	let color=$("#select_color").val();
	let size=$("#select_size").val();
	let mbti=$("#select_mbti").val();

	
	if(color==null || size==null || mbti==null){
		alert('????????? ?????? ??????????????????! :)');
		return;
	}

	$('#purchaseFrm').submit();
});

</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"/>