<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../include/admin_header.jsp"%>
<article id="admin_goods">
  	<h2>굿즈 등록</h2>
    <form name="frm" method="post" action="adminGoodsInsert">
    	<table id="goods_table2">
			<tr>
				<th width="150px;">상품분류</th>
				<td colspan="5">
					<select name="kind">
						<option value="0">선택</option>
						<c:forEach items="${goodsKindList}" var="goodsKind" varStatus="status">
							<c:choose>
								<c:when test="${goods.kind==status.count}">
									<option value="${status.count}" selected>
										${goodsKind}
									</option>
								</c:when>
								<c:otherwise>
									<option value="${status.count}">
										${goodsKind}
									</option>
								</c:otherwise>
							</c:choose>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<th>상품명</th>
				<td colspan="2">
					<input type="text" name="name" maxlength="100" value="${goods.name}">
				</td>
				<th style="border-left:1px dotted gray;">재 고</th>
				<td colspan="2">
					<input type="number" name="num_inventory" value="${goods.num_inventory}">
				</td>
			</tr>
			<tr>
				<th>원가[A]</th>
				<td><input type="number" name="price1" onkeyup="calculatePrice();" size="10" value="${goods.price1}"></td>
				<th style="border-left:1px dotted gray;" width="150px">판매가[B]</th>
				<td><input type="number" name="price2" onkeyup="calculatePrice();" size="10" value="${goods.price2}"></td>
				<th style="border-left:1px dotted gray;" width="150px">[B-A]</th>
				<td><input type="number" name="price3" size="10"></td>
			</tr>
			<tr>
				<th>제품 설명</th>
				<td colspan="5">
          			<textarea name="content" rows="8" cols="70">${goods.content}</textarea>
        		</td>
			</tr> 
			<tr>
				<th>상품 대표이미지</th>
				<td colspan="5">
					<div id="filename"></div>
					<input type="hidden" name="image" id="image" value="${goods.image}">
				</td>
			</tr>
			<tr>
				<th>상품 상세이미지</th>
				<td colspan="5">
					<div id="filename2"></div>
					<input type="hidden" name="detail_img" id="detail_img" value="${goods.detail_img}">
				</td>
			</tr>	
    	</table>
    	<div style="margin: 0 auto; text-align: center; color: red">${message}</div>
    	<div class="goods_buttonBox">
  	  		<input type="submit" class="adminbtn" value="상품등록">
    		<input type="button" class="adminbtn" value="목록으로" onClick="location.href='adminGoodsList?page=1'">
  		</div>
  	</form>
  	<form name="formm" id="goodsUpForm" method="post" enctype="multipart/form-data">
  		<table id="goods_table2">
  			<tr>
				<td>
					<input type="file" name="fileimage">
					<input type="button" id="goodsUploadButton" value="상품 대표 이미지 추가">
				</td>
			</tr>
		</table>
	</form>
	<form name="formm" id="goodsUpForm2" method="post" enctype="multipart/form-data">
  		<table id="goods_table2">
  			<tr>
				<td>
					<input type="file" name="fileimage2">
					<input type="button" id="goodsUploadButton2" value="상품 상세 이미지 추가">
				</td>
			</tr>
		</table>
	</form>
</article>
<%@ include file="../../include/admin_footer.jsp"%>