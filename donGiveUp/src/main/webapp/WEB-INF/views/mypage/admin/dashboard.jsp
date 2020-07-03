<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 마이페이지 DashBoard</title>
<style>
	#chartdiv {
		background-color : #fff;
		width: 100%;
	  height: 500px;
	}
	#chartWrap{
		border-radius : 10px;
		background-color : #fff;
	}
	
</style>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>
<script src="https://code.highcharts.com/modules/export-data.js"></script>
<script src="https://code.highcharts.com/modules/accessibility.js"></script>

<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/mypage/admin/dashboardHeader.jsp"/>
	
	<div class="col-sm-9 col-sm-offset-3 col-lg-10 col-lg-offset-2 main">
		
		<div class="panel panel-container" style="margin-top : 20px;">
			<div class="row">
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-teal panel-widget border-right">
						<div class="row no-padding">
							<div class="large" id="allBoard">${board}</div>
							<div class="text-muted">전체 제시글 수</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-blue panel-widget border-right">
						<div class="row no-padding">
							<div class="large" id="allUser">${mem}</div>
							<div class="text-muted">일반회원</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding">
							<div class="large" id="allCompanyComplete">${comMem}</div>
							<div class="text-muted">승인된 후원기관</div>
						</div>
					</div>
				</div>
				<div class="col-xs-6 col-md-3 col-lg-3 no-padding">
					<div class="panel panel-orange panel-widget border-right">
						<div class="row no-padding">
							<div class="large" id="allCompanyReq">${reqMem}</div>
							<div class="text-muted">승인대기 후원기관</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div id="chartWrap">
			<div style="background-color : #fff;">
				<h3 style="margin-bottom:0px; padding:20px; font-weight:bold; border-bottom:1px dotted gray;">게시글 현황</h3>
			</div>
			<div id="chartdiv">
			</div>
		</div>
		<div>
		</div>
	</div>
	<script>
	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		var container = am4core.create("chartdiv", am4core.Container);
		container.width = am4core.percent(100);
		container.height = am4core.percent(100);
		container.layout = "horizontal";


		var chart = container.createChild(am4charts.PieChart);
		
		var donation = "";
		var funding = "";
		var support = "";
		var vwork = "";
		var regular = "";
		
		var donationCom = "";
		var fundingCom = "";
		var supportCom = "";
		var regularCom = "";
		var vworkCom = "";
		var donationReq = "";
		var fundingReq = "";
		var supportReq = "";
		var vworkReq = "";
		var regularReq = "";
		var donationNeg = "";
		var fundingNeg = "";
		var supportNeg = "";
		var vworkNeg = "";
		var regularNeg = "";
		
		$.ajax({
			url : "/chartData.don",
			async : false,
			success : function(data){
				donation = data.donation;
				funding = data.funding;
				support = data.support;
				vwork = data.vwork;
				regular = data.regular;
				
				donationCom = data.donationCom;
				donationReq = data.donationReq;
				donationNeg = data.donationNeg;
				
				fundingCom = data.fundingCom;
				fundingReq = data.fundingReq;
				fundingNeg = data.fundingNeg;
				
				supportCom = data.supportCom;
				supportReq = data.supportReq;
				supportNeg = data.supportNeg;
				
				vworkCom = data.vworkCom;
				vworkReq = data.vworkReq;
				vworkNeg = data.vworkNeg;
				
				regularCom = data.regularCom;
				regularReq = data.regularReq;
				regularNeg = data.regularNeg;
			}
		});
		
		
		// Add data
		chart.data = [{
		  "country": "일반기부",
		  "litres": donation,
		  "subData": [{ name: "승인완료", value: donationCom }, { name: "승인대기", value: donationReq }, { name: "거부", value: donationNeg }]
		}, {
		  "country": "펀딩",
		  "litres": funding,
		  "subData": [{ name: "승인완료", value: fundingCom }, { name: "승인대기", value: fundingReq }, { name: "거부", value: fundingNeg }]
		}, {
		  "country": "물품후원",
		  "litres": support,
		  "subData": [{ name: "승인완료", value: supportCom }, { name: "승인대기", value: supportReq }, { name: "거부", value: supportNeg }]
		}, {
		  "country": "함께해요",
		  "litres": vwork,
		  "subData": [{ name: "승인완료", value: vworkCom }, { name: "승인대기", value: vworkReq }, { name: "거부", value: vworkNeg }]
		},{
		  "country": "정기후원",
		  "litres": regular,
		  "subData": [{ name: "승인완료", value: regularCom }, { name: "승인대기", value: regularReq }, { name: "거부", value: regularNeg }]
		}];

		// Add and configure Series
		var pieSeries = chart.series.push(new am4charts.PieSeries());
		pieSeries.dataFields.value = "litres";
		pieSeries.dataFields.category = "country";
		pieSeries.slices.template.states.getKey("active").properties.shiftRadius = 0;
		//pieSeries.labels.template.text = "{category}\n{value.percent.formatNumber('#.#')}%";

		pieSeries.slices.template.events.on("hit", function(event) {
		  selectSlice(event.target.dataItem);
		})

		var chart2 = container.createChild(am4charts.PieChart);
		chart2.width = am4core.percent(30);
		chart2.radius = am4core.percent(80);

		// Add and configure Series
		var pieSeries2 = chart2.series.push(new am4charts.PieSeries());
		pieSeries2.dataFields.value = "value";
		pieSeries2.dataFields.category = "name";
		pieSeries2.slices.template.states.getKey("active").properties.shiftRadius = 0;
		//pieSeries2.labels.template.radius = am4core.percent(50);
		//pieSeries2.labels.template.inside = true;
		//pieSeries2.labels.template.fill = am4core.color("#ffffff");
		pieSeries2.labels.template.disabled = true;
		pieSeries2.ticks.template.disabled = true;
		pieSeries2.alignLabels = false;
		pieSeries2.events.on("positionchanged", updateLines);

		var interfaceColors = new am4core.InterfaceColorSet();

		var line1 = container.createChild(am4core.Line);
		line1.strokeDasharray = "2,2";
		line1.strokeOpacity = 0.5;
		line1.stroke = interfaceColors.getFor("alternativeBackground");
		line1.isMeasured = false;

		var line2 = container.createChild(am4core.Line);
		line2.strokeDasharray = "2,2";
		line2.strokeOpacity = 0.5;
		line2.stroke = interfaceColors.getFor("alternativeBackground");
		line2.isMeasured = false;

		var selectedSlice;

		function selectSlice(dataItem) {

		  selectedSlice = dataItem.slice;

		  var fill = selectedSlice.fill;

		  var count = dataItem.dataContext.subData.length;
		  pieSeries2.colors.list = [];
		  for (var i = 0; i < count; i++) {
		    pieSeries2.colors.list.push(fill.brighten(i * 2 / count));
		  }

		  chart2.data = dataItem.dataContext.subData;
		  pieSeries2.appear();

		  var middleAngle = selectedSlice.middleAngle;
		  var firstAngle = pieSeries.slices.getIndex(0).startAngle;
		  var animation = pieSeries.animate([{ property: "startAngle", to: firstAngle - middleAngle }, { property: "endAngle", to: firstAngle - middleAngle + 360 }], 600, am4core.ease.sinOut);
		  animation.events.on("animationprogress", updateLines);

		  selectedSlice.events.on("transformed", updateLines);

		//  var animation = chart2.animate({property:"dx", from:-container.pixelWidth / 2, to:0}, 2000, am4core.ease.elasticOut)
		//  animation.events.on("animationprogress", updateLines)
		}


		function updateLines() {
		  if (selectedSlice) {
		    var p11 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle) };
		    var p12 = { x: selectedSlice.radius * am4core.math.cos(selectedSlice.startAngle + selectedSlice.arc), y: selectedSlice.radius * am4core.math.sin(selectedSlice.startAngle + selectedSlice.arc) };

		    p11 = am4core.utils.spritePointToSvg(p11, selectedSlice);
		    p12 = am4core.utils.spritePointToSvg(p12, selectedSlice);

		    var p21 = { x: 0, y: -pieSeries2.pixelRadius };
		    var p22 = { x: 0, y: pieSeries2.pixelRadius };

		    p21 = am4core.utils.spritePointToSvg(p21, pieSeries2);
		    p22 = am4core.utils.spritePointToSvg(p22, pieSeries2);

		    line1.x1 = p11.x;
		    line1.x2 = p21.x;
		    line1.y1 = p11.y;
		    line1.y2 = p21.y;

		    line2.x1 = p12.x;
		    line2.x2 = p22.x;
		    line2.y1 = p12.y;
		    line2.y2 = p22.y;
		  }
		}

		chart.events.on("datavalidated", function() {
		  setTimeout(function() {
		    selectSlice(pieSeries.dataItems.getIndex(0));
		  }, 1000);
		});


		});
	</script>
</body>
</html>