<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>박지인</title>
</head>
<body>
	<script>
		var svgWidth = 1200;
		// var svgHeight = 300;
		// Legend를 넣기 위해 높이 늘림
		var svgHeight = 300;
		var svg = content.append("svg").attr("width", svgWidth).attr("height",
				svgHeight);

		/* canvas 내부에 공간을 두어 그래프 그리기 */
		// Legend를 넣기 위해 right를 늘림
		var margin = {
			top : 20,
			right : 220,
			bottom : 25,
			left : 30
		};
		var legend_margin_left = 40
		var chartWidth = svgWidth - margin.left - margin.right;
		var chartHeight = svgHeight - margin.top - margin.bottom;
		/* 그라데이션 색상 설정 */
		var color = d3.scaleOrdinal(d3.schemeCategory20)
		// d3.scaleOrdinal().range(["#E14D57", "#EC932F", "#71B37C", "#5290E9", "#965994"])
		// d3.scaleLinear().domain([1,10]).range(["brown", "steelblue"]); // 그라데이션

		/* axis 설정
		 레이블 - x축:date, y축:cpu_user
		 선스타일 - linear
		 데이터범위(domain) 실제 수치들의 min, max를 찾아내어 범위를 정함
		 표시할범위(range) 그러질 스케일 비율로 조절됨.
		 scaleBand
		 scaleLinear
		 scaleTime
		 range
		 rangeRound
		 */
		/* x축의 범위 설정 */
		var x = d3.scaleBand().rangeRound([ 0, chartWidth ]) // 왼 -> 오
		.domain(dataSet.map(function(d) {
			return d["produce"]
		}))

		/* y축의 범위 설정 */
		var y = d3.scaleLinear().rangeRound([ chartHeight, 0 ]) // 위 -> 아래
		.domain([ 0, d3.max(dataSet.map(function(d) {
			return +d["number"]
		})) ])

		/* axis 추가 */
		// translate(왼,위)
		var xAxis = svg.append("g").attr(
				"transform",
				"translate(" + margin.left + ", " + (margin.top + chartHeight)
						+ ")").call(d3.axisBottom(x));
		var yAxis = svg.append("g").attr("transform",
				"translate(" + margin.left + ", " + margin.top + ")").call(
				d3.axisLeft(y));

		/* chart 그리기 */
		/* bar 너비 */
		var barWidth = 20;
		/* 어긋난 정도도*/
		//var offsetX = ((chartWidth / dataSet.length) - barWidth) / 2;
		/* chart group 만들어 차트 위치 한꺼번에 바꿀 수 있도록 */
		var g = svg.append("g").attr("transform",
				"translate(" + (margin.left) + ", " + margin.top + ")")
		/* 막대 그리기 */
		var item = g.selectAll("rect").data(dataSet);
		item.enter().append("rect")
		/* 정해진 css 값의 색을 주기 */
		//.attr("class", "bar")
		.attr("width", barWidth).attr("x", function(d, i) {
			return i * (chartWidth / dataSet.length) + 50
		}).attr("y", function(d) {
			return chartHeight
		}).attr("height", function(d, i) {
			return 0;
		})
		/* 막대를 다양한 color 옵션으로 색을 주기 */
		.style("fill", function(d, i) {
			return color(i);
		}).transition().delay(function(d, i) {
			return i * 50;
		}).duration(function(d, i) {
			return i * 60;
		})
		/* y(d.cpu_user); --> cpu_user 값을 scale에 맞게 비율 변환*/
		.attr("y", function(d) {
			//return d.number //<- 비율 적용 전
			return y(d.number)
		}).attr("height", function(d, i) {
			//return chartHeight - d.cpu_user <- 비율 적용 전
			return chartHeight - y(d.number);
		})
		/*막대에 수치표시*/
		item.enter().append("text").attr("x", function(d, i) {
			return i * (chartWidth / dataSet.length) + 50;
		}).attr("y", function(d) {
			return y(d.number) - 3;
		}).style("opacity", 0).text(function(d, i) {
			return d.number;
		}).transition()
		/*.delay(500)
		 .duration(800)*/
		.delay(function(d, i) {
			return i * 50;
		}).duration(function(d, i) {
			return i * 70;
		}).style("opacity", 1)
		/* legend 그리기 */
		// rect, circle등은 x,y속성으로 위치 옮기지만, g는 transform translate로 옮김
		var legend = svg.append("g").attr("class", "legend").attr("width",
				svgWidth - chartWidth).attr("height", chartHeight).style(
				"fill", "green").attr(
				"transform",
				"translate(" + (chartWidth + margin.left + legend_margin_left)
						+ "," + 10 + ")")
		var legend_item = legend.selectAll("rect").data(dataSet)
		legend_item.enter().append("rect").attr("width", 11).attr("height", 11)
				.attr("x", 10).attr("y", function(d, i) {
					return i * 15
				}).attr("rx", "2px").attr("ry", "2px").style("fill",
						function(d, i) {
							return color(i);
						})
		legend_item.enter().append("text").attr("width",
				legend.attr("width") - 30).attr("height", 11).attr("x", 10)
				.attr("y", function(d, i) {
					return i * 15
				}).text(function(d, i) {
					return d.produce;
				}).style("fill", "#1c1d1f").attr("transform",
						"translate(" + 15 + "," + 10 + ")")
	</script>

</body>
</html>
