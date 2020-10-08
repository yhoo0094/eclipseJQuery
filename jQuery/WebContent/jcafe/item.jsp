<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<script src="../js/jquery-3.5.1.min.js"></script>
	
</head>
<body>
	<table border=1>
		<tr>
			<td>Item No</td>
			<td><input type = "text" name="itemNo"></td>
		</tr>
		<tr>
			<td>Item</td>
			<td><input type = "text" name="item"></td>
		</tr>
		<tr>
			<td>Category</td>
			<td><input type = "text" name="category"></td>
		</tr>
		<tr>
			<td>Price</td>
			<td><input type = "text" name="price"></td>
		</tr>
		<tr>
			<td>Content</td>
			<td><input type = "text" name="content"></td>
		</tr>
		<tr>
			<td>Like It</td>
			<td id="likeIt"></td>
		</tr>
		<tr>
			<td>Image</td>
			<td><img id="image" ></td>
		</tr>
	</table>
	<%
		String itemNo = request.getParameter("itemNo");
	%>
	<script>
		$.ajax({
			url: 'GetProductServlet',
			data: {itemNo: '<%=itemNo%>'},
			dataType: 'json',
			success: function(result){
				let data = result;
				$('input[name="itemNo"]').val(data[0].itemNo);
				$('input[name="item"]').val(data[0].item);
				$('input[name="category"]').val(data[0].category);
				$('input[name="price"]').val(data[0].price);
				$('input[name="content"]').val(data[0].content);
				
				let likeItCount = data[0].likeIt -1;
				let str = '';
				function makeStar(likeItCount) {
					if(likeItCount*10%10 == 0) {
						for(let i = 0; i < likeItCount; i++){
							str += '★' 
						} 
					} else {
						for(let i = 0; i < likeItCount; i++){
							str += '★' 
						} 
						str += '☆'
					}
				}
				makeStar(likeItCount);
				//$('input[name="likeIt"]').val(str);
				
				let star = '';
				function makeStar2(likeItCount) {
					if(likeItCount*10%10 == 0) {
						for(let i = 0; i < likeItCount; i++){
							star += '&#11088' 
						} 
					} else {
						for(let i = 0; i < likeItCount; i++){
							star += '&#11088' 
						} 
						star += '&#128405'
					}
				}
				makeStar2(likeItCount);
				
				$('#likeIt').html(star);
				$('#image').attr('src', '../images/' + data[0].image)
							.attr('width', '300px')
			},
			error:function(result){
				console.log(result);
			}
		});
	</script>
</body>
</html>