<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
result
<script src="https://d3js.org/d3.v4.min.js"></script>
<script type="text/javascript">



d3.csv("http://s3.ap-northeast-2.amazonaws.com/oatsdata/originaldata/number.csv", function(data) {
	  console.log(data[0]);
	});
	
</script>
</body>
</html>