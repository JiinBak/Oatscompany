<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style type="text/css">
text {
	fill: black;
	font-size: 12px;
	font-weight: bold;
}

.bar {
	fill: #0AAC87;
}

.bar:hover {
	fill: brown;
}
svg {
    border: 2px solid gray;

}

.rect {
    fill: blue;
    stroke: black;
    stroke-width: 5px;
}
body, body *{
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
    font-size: 15px;
}

#top {
    padding: 30px 30px;
    height: 50px;
    background-color: #0AAC87;
    border-top: 5px solid #30333C;
    line-height: 50px;
}

#top span {
    font-family: 'Roboto thin', sans-serif;
    font-weight: 900;
    font-size: 2em;
    color: #30333C;
}

#topmenu ul {
    display: inline-block;
    width: 100%;
    font-weight: 500;
    color: white;
    list-style: none;
    background-color: #30333C;
}

#topmenu li {
    float: left;
    margin: 15px 0px 15px 30px;
    cursor: pointer;
}

#topmenu li:hover {
    color: #0AAC87;
}

#content {
    padding: 30px 30px;
}

#footer {
    padding: 30px 30px;
    height: 50px;
    line-height: 50px;
    background-color: #1c1d1f;
    color: white;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<body>
	result
	<script type="text/javascript"
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
	<script src="https://d3js.org/d3.v4.min.js"></script>
	<script src="https://sdk.amazonaws.com/js/aws-sdk-2.1.12.min.js"></script>

	<div id="topmenu">
    <ul>
        <li onclick="getData('grid.csv','GridChart')">Grid</li>
        <li onclick="getData('https://s3.ap-northeast-2.amazonaws.com/oatsdata/originaldata/bar.csv','BarChart')">Bar</li>
    </ul>
	</div>
	<div id="content"></div>
	<script type="text/javascript">
	var dataSet = [];
    var content = d3.select("#content");

    function getData(file, target) {
        /* data 불러오기 */
        d3.csv("https://s3.ap-northeast-2.amazonaws.com/oatsdata/originaldata/number.csv", function(error, csv) {
            if (error) {
                console.log(error);
                return false;
            }
            dataSet = csv;
            console.log(dataSet[0])
            $("#content").load(target);
        })
    }
    /* debug */
    function debugging(target) {
        console.log(target + ":" + JSON.stringify(target))
    }
</script>

		

</body>
</html>