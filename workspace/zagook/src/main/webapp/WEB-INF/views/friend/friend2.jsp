<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>친구페이지</title>
<meta charset="utf-8">
<style>
<link rel="stylesheet" href="./css/friend.css">

</style>
</head>
<body>
	<details>
		<summary>친구신청</summary>
		<form action="action_page.php">
			<fieldset>
				<img src="https://blog.yena.io/assets/post-img/171123-nachoi-300.jpg" alt="My Image"> <br> 
				 User ID:<br> 
				 <input type="text" name="username" value="Mickey" style="color: black"> 
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
	</details>

	<details>
		<summary>친구신청</summary>
		<form action="action_page.php">
			<fieldset>
				<img src="https://magazineb-ckeditor-upload.s3.ap-northeast-2.amazonaws.com/upload/sim.jpg"
				width="300px;" height="300px;" alt="My Image"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="John">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
	</details>

	<details>
		<summary>친구신청</summary>
		<form action="action_page.php">
			<fieldset>
				<img src="https://img.favpng.com/23/12/18/donuts-homer-simpson-food-bread-image-png-favpng-y1f2UZmqc31qUHPYM7raS8uRK.jpg"
				width="300px;" height="300px;" alt="My Img"> 
				User ID:<br>
				<input type="text" name="username" value="Son"> 
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
	</details>

	<details>
		<summary>친구신청</summary>
		<form action="action_page.php">
			<fieldset>
				<img src="https://mblogthumb-phinf.pstatic.net/20130130_91/k_homer_k_1359473362889Iy7AY_GIF/MargeSimpson31.gif?type=w2"
				width="300px;" height="300px;" alt="My Img"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="Messi">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
	</details>

	<details>
		<summary>친구신청</summary>
		<form action="action_page.php">
			<fieldset>
				<img src="https://mblogthumb-phinf.pstatic.net/20140126_164/ahn3607_1390723993086MhbS8_JPEG/%28The_Simpsons%29S19E15.Smoke_on_the_Daughter.avi_000826283.jpg?type=w2"
				width="300px;" height="300px;" alt="My Img"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="Ramos">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
	</details>
</body>
</html>