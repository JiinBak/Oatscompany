<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
<script src="https://code.jquery.com/jquery-3.1.1.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://sdk.amazonaws.com/js/aws-sdk-2.7.10.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="<c:url value='/resources/css/index.css' />">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">


</head>
<body>
	<header id="header">
    <h3>기후 데이터와 농작물 주산지 데이터 분석을 통한 적합 농작물 제시</h3>
    </header>
    <div>
        <div><P>Introducing Members</P></div>
        <div><a class="memebers" id="uichan" href="<c:url value='/uichan' />">강의찬</a></div>
        <div><a class="memebers" id="seongho" href="<c:url value='/uichan' />">노성호</a></div>
        <div><a class="memebers" id="jiin" href="<c:url value='/uichan' />">박지인</a></div>
    </div>
    
    <p>안녕하세요! Oats Company입니다. 현재 AWS EMR(spark)를 사용할 수 없습니다. 'What To Grow 버튼을 누르시면 분석된 데이터의 시각화 자료를 보실 수 있습니다.</p>
	<section>
		<article>
			<div id="map">
				<h1>지도가 들어가는 구역</h1>
			</div>
		</article>
		<aside id="menu">
			<c:url value="/result" var="actionURL" scope="page"/>
			<form:form action="${actionURL}" method="post">
				위도: <input id="lat" name="lat" value="" />
				<br>
				경도: <input id="long" name="long" value="" />
				<div id="address">
					주소: <input type="text" id="inputaddress" name="address"
						placeholder="ADDRESS"> <br>
				</div>
				<div>
					날짜: <input type="text" id="datepicker" name="selecteddate"
						placeholder="DATE">
				</div>
				<div>
					<input type="submit" value="What To Grow">
				</div>
				<input type="hidden" id="latLng" value="" />
			</form:form>
		</aside>
	</section>



	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAXxG1WGZ_ttI--0N8V_s0UZ0LNrlksyw4&callback=initMap"
		async defer></script>
	<script>
	</script>


	<script type="text/javascript" src="<c:url value='/resources/js/calendar.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/googlemap.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/resources/js/aws-sdk.js'/>"></script>
</body>
</html>
