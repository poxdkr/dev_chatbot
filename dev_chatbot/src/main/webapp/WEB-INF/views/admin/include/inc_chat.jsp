<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- include_once './include/admin.tail.none.php'; -->

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=10,chrome=1">

 <title>inc_chat</title>
 
 <script src="/resource/admin/static/admin_js/jquery-1.8.3.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
 </head>
 <body>
 	<!-- 차트 링크 --> 

<canvas id="myChart" style="width:100%; height: 300px"></canvas>

<!-- 차트 --> 
<script>


$(function(){
	/*------------------ Chart ------------------------*/
	var cnt1 = $("#cnt1").val();
	var cnt2 = $("#cnt2").val();
	var cnt3 = $("#cnt3").val();
	var cnt4 = $("#cnt4").val();
	
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: [
	            '설치관련',
	            '작업관련',
	            '라이선스관련',
	            '서류파일관련'
	        ],
	        datasets: [
	            {
	                label: '# 업무별 문의수',
	                data: [
	                   cnt1,cnt2,cnt3,cnt4
	                ],
	                backgroundColor: [
	                    'rgba(255, 99, 132, 0.2)',
	                    'rgba(54, 162, 235, 0.2)',
	                    'rgba(255, 206, 86, 0.2)',
	                    'rgba(75, 192, 192, 0.2)'
	                ],
	                borderColor: [
	                    'rgba(255, 99, 132, 1)',
	                    'rgba(54, 162, 235, 1)',
	                    'rgba(255, 206, 86, 1)',
	                    'rgba(75, 192, 192, 1)'
	                ],
	                borderWidth: 1
	            }
	        ]
	    },
	    options: {
	        scales: {
	            yAxes: [
	                {
	                    ticks: {
	                        beginAtZero: true
	                    }
	                }
	            ]
	        }
	    }
	});
	console.log("cnt1:"+cnt1);
	console.log("cnt2:"+cnt2);
	console.log("cnt3:"+cnt3);
	console.log("cnt4:"+cnt4);
/*------------------ Chart ------------------------*/

})
</script>
 	<input type="hidden" value="${mode }" id="mode"><br>
 	<input type="hidden" value="${cnt1 }" id="cnt1"><br>
 	<input type="hidden" value="${cnt2 }" id="cnt2"><br>
 	<input type="hidden" value="${cnt3 }" id="cnt3"><br>
 	<input type="hidden" value="${cnt4 }" id="cnt4"><br>
 	<input type="hidden" value="${sday }" id="sday"><br>
 	<input type="hidden" value="${eday }" id="eday">
 </body>
 </html>