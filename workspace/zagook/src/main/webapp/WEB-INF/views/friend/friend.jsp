<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>친구페이지</title>
<meta charset="utf-8">
<style>
input[type="submit"]{
  float:right;
  border-radius: 5px;
}
summary {
  width: 30%;
  margin: 0 auto ;
  padding: 1rem;
  display: block;
  background: #5B92E3;
  padding-left: 2.2rem;
  position: relative;
  cursor: pointer;
}

summary:before {
  content: '';
  border-width: .4rem;
  border-style: solid;
  border-color: transparent transparent transparent #fff;
  position: absolute;
  top: 1.3rem;
  left: 1rem;
  transform: rotate(0);
  transform-origin: .2rem 50%;
  transition: .25s transform ease;
}


body {
  background: #222;
  height: 100vh;
  font-family: sans-serif;
  color: white;
  line-height: 1.5;
  letter-spacing: 1px;

  }
  
  body2 {
  width: 50%;
  background: #222;
  height: 100vh;
  font-family: sans-serif;
  color: white;
  line-height: 1.5;
  letter-spacing: 1px;

}

fieldset {
	padding: 6px;
	background: #5B92E3;
	border: 1px solid white;
}

</style>
</head>
<body>
	<body2>
	
		<summary>친구신청
		<form action="action_page.php">
			<fieldset>
				<img src="https://blog.yena.io/assets/post-img/171123-nachoi-300.jpg" 
				width="200px;" height="200px;" alt="My Image"> <br> 
				 User ID:<br> 
				 <input type="text" name="username" value="Mickey" style="color: black"> 
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
			</summary>
	
		<summary>친구신청
		<form action="action_page.php">
			<fieldset>
				<img src="https://magazineb-ckeditor-upload.s3.ap-northeast-2.amazonaws.com/upload/sim.jpg"
				width="200px;" height="200px;" alt="My Image"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="John" style="color: black">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
			</summary>

		<summary>친구신청
		<form action="action_page.php">
			<fieldset>
				<img src="https://img.favpng.com/23/12/18/donuts-homer-simpson-food-bread-image-png-favpng-y1f2UZmqc31qUHPYM7raS8uRK.jpg"
				width="200px;" height="200px;" alt="My Img"> <br>
				User ID:<br>
				<input type="text" name="username" value="Son" style="color: black"> 
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
			</summary>

		<summary>친구신청
		<form action="action_page.php">
			<fieldset>
				<img src="https://mblogthumb-phinf.pstatic.net/20130130_91/k_homer_k_1359473362889Iy7AY_GIF/MargeSimpson31.gif?type=w2"
				width="200px;" height="200px;" alt="My Img"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="Messi" style="color: black">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
			</summary>

		<summary>친구신청
		<form action="action_page.php">
			<fieldset>
				<img src="https://mblogthumb-phinf.pstatic.net/20140126_164/ahn3607_1390723993086MhbS8_JPEG/%28The_Simpsons%29S19E15.Smoke_on_the_Daughter.avi_000826283.jpg?type=w2"
				width="200px;" height="200px;" alt="My Img"> <br> 
				User ID:<br> 
				<input type="text" name="username" value="Ramos" style="color: black">
				<br><br> 
				<input type="submit" value="거절" style="background-color:#EB4E4E"> 
				<input type="submit" value="수락" style="background-color:#30BA87">
			</fieldset>
			</summary>
	</body2>
</body>
</html>