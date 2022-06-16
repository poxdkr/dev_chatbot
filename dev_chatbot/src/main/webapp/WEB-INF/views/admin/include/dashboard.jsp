<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Dashboard Chart-->
<script src="resource/admin/plugins/chartjs/Chart.js"></script>
<script src="resource/admin/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="resource/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="resource/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>

<!--//Dashboard Chart-->

<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	<li> <a href="#"> <i class="fa fa-home"></i> 메인</a> </li>
	<li class="active">대시보드</li>
</ul>

<script>
	 
	 //이번주 일요일(sday)과 오늘(eday), 이번주 예정 토요일(endDay)	 
	  var sday="";
	  var eday="";
	  var sdayUnix = "";
	  var edayunix = "";
	  
	 function formatDate(date) {
		   var myyear = date.getFullYear();
	       var mymonth = date.getMonth()+1;
	       mymonth = mymonth > 10 ? mymonth : "0"+mymonth;
	       var myweekday = date.getDate();
	       myweekday = myweekday > 10 ? myweekday : "0"+myweekday;
	       return (myyear+"-"+mymonth +"-"+ myweekday);
	}

	 function formatUnixTime(date){
		 return Math.floor(date.getTime() / 1000);
	 }

	function getWeek() {
	       var now = new Date();
	       var nowDayOfWeek = now.getDay();
	       var nowDay = now.getDate();
	      	   nowDay = nowDay > 10 ? nowDay : "0"+nowDay;
	      	   	
	       var nowMonth = now.getMonth();
	     	   nowMonth = nowMonth > 10 ? nowMonth : "0"+nowMonth;
	     	   
	       var nowYear = now.getYear();
	       		nowYear += (nowYear < 2000) ? 1900 : 0;
	       		
	       var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
	       var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
	       
	       //표기용 날짜
	       sday = formatDate(weekStartDate);
	       eday = formatDate(weekEndDate);
	       
	       //DB 비교용 날짜(UNIX)
	       sdayUnix = formatUnixTime(weekStartDate);
	 	   edayUnix = formatUnixTime(weekEndDate); 
	}
	
	// sday, eday 불러오기
	getWeek();
		
	//주간(일요일 ~ 현재 요일까지) 이용자 수 user_cnt [7개] 산출
	var user_cnt_arr =[];
	
	for(var i =1; i < 8; i++){
		$.ajax({
			url : "getUser_cnt",
			data : "sday="+sday+"&eday="+eday+"&dayofweek="+i,
			dataType : "text",
			async:false,
			success : function(data){
				user_cnt_arr[i-1] = data;
			},error : function(data){
				console.log(data);
			}
		});
	}

	
	//주간(일요일 ~ 현재요일까지) 채팅 수 chat_cnt 산출
	var chat_cnt_arr = [];
	
	for(var i=1; i<8; i++){
		$.ajax({
			url : "getChat_cnt",
			data : "sday="+sday+"&eday="+eday+"&dayofweek="+i,
			dataType : "text",
			async:false,
			success : function(data){
				chat_cnt_arr[i-1] = data;
			},error : function(data){
				console.log(data);
			}
		});
	}

	
	//미답변 채팅 수(miss_cnt) 산출
	var miss_cnt_arr=[];
	
	for(var i=1; i<8; i++){
		$.ajax({
			url : "getMiss_cnt",
			data : "sday="+sday+"&eday="+eday+"&dayofweek="+i,
			dataType : "text",
			async:false,
			success : function(data){
				miss_cnt_arr[i-1] = data;
			},error : function(data){
				console.log(data);
			}
		});
	}
	
	
	//주간 챗봇 이용시간
	var stime;
	
	$.ajax({
		url : "getSum_visit_time",
		data : "sday="+sday+"&eday="+eday,
		dataType : "text",
		async:false,
		success : function(data){
			stime = data;
		},error : function(data){
			console.log(data);
		}
	});
	
	
	//stime을 시분초로 변환
	
	var hour = parseInt(stime/3600);
	hour = hour >= 10 ? hour : "0" + hour;
	var min = parseInt((stime%3600)/60);
	min = min >= 10 ? min : "0" + min;
	var sec = stime%60;
	sec = sec >= 10 ? sec : "0" + sec;
	
	var sum_visit_time =hour+"시"+min+"분"+sec+"초" 
	
	//전체 기간 _ 전체 채팅 수
	var t_user_cnt = 0;
	$.ajax({
		url : "getTotalUser_cnt",
		dataType : "text",
		async:false,
		success : function(data){
			t_user_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
	
	//주간 전체 채팅수 kind=0
	var w_user_cnt = 0;
	$.ajax({
		url : "getWeekUser_cnt",
		dataType : "text",
		async:false,
		success : function(data){
			w_user_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
	
	 //주간 이용자 퍼센트
	 var week_user_percent;
    if(w_user_cnt == 0 ){
        week_user_percent= 0;
    }else{
        week_user_percent = Math.round((w_user_cnt /  t_user_cnt ) * 100);
    }
	
    
    //챗봇 일주일 응대수
    var w_chat_cnt = 0;
	$.ajax({
		url : "getWeekChat_cnt",
		dataType : "text",
		async:false,
		success : function(data){
			w_chat_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
    
	// //챗봇 일주일 미답변
	var w_miss_cnt = 0;
	$.ajax({
		url : "getWeekMiss_cnt",
		dataType : "text",
		async:false,
		success : function(data){
			w_miss_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
    
	//주간 챗봇 응대 퍼센트
	var week_miss_percent;
	var week_req_percent;
	
    if(w_user_cnt == 0 ){
        week_miss_percent= 0;
    }else{
        week_miss_percent = Math.round((w_miss_cnt /  w_chat_cnt ) * 100);
    }
    
    if(w_chat_cnt == 0 ){
        week_req_percent= 0;
    }else{
        week_req_percent =  Math.round((w_chat_cnt - w_miss_cnt ) / w_chat_cnt * 100);
    }
    


</script>
<script>
	$(function(){
		 	//일요일부터 오늘까지의 기간
		 	$("#chat_period").html(sday + "~" + eday);
		 	$("#qa_period").html(sday + "~" + eday);
			
		
			//최근 문의현황의 열람을 누를경우
		    $('.custom_qa').click(function() {
		        modal_mode = "add";
		        no  = $(this).attr("data-val");
		        $('.modal-title').html("담당자 문의현황");
		        $('#custom_qa_reg').modal('show');
		    });
			
			//content.qa.comment.jsp?no=no 를 src요소로 삽입하여 해당 no읠 문의요청을 확인한다.
		    $('#custom_qa_reg').on('show.bs.modal', function (event) {
		        if(modal_mode=='add') $('#custom_qa_add').attr("src","/content.qa.comment?no="+no);
		    });
			
			//창닫기
		    $(".custom_cancle").click(function(){
		        if(confirm("창을 닫습니다.")){
		            $("#custom_qa_reg").modal('hide');
		        }
		    }); 
		
		$('.dashboard').addClass("active");
		$('.dash').addClass("active");
  	
		$(".csv_down").click(function(){
			location.href = "content.question.cate.down.php?q_type="+$(this).attr("data-val");
		});
		$(".more").click(function(){
			var d = $(this).attr("data-val");
			if(d == "notice"){
				location.href = "?mode=content.notice";
			}else if(d == "domain"){
				location.href = "?mode=content.domain";
			}else if(d == "cate"){
				location.href = "?mode=content.question.cate";
			}else if(d == "keyword"){
				location.href = "?mode=content.keyword.list";
			}
		});
		
		$(".con_cnt").click(function(){
			var d = $(this).attr("data-val");
			if(d == "question"){
				location.href = "?mode=content.question.list";
			}else if(d == "scn"){
				location.href = "?mode=content.scenario.list";
			}else if(d == "cate"){
				location.href = "?mode=content.question.cate";
			}else if(d == "keyword"){
				location.href = "?mode=content.keyword.list";
			}
		});
		
		//주간 챗봇 상담 현황 get in html
		$("#sum_visit_time").html("총 상담시간<br>"+sum_visit_time);
		$("#w_chat_miss_cnt").html("응대 "+ w_chat_cnt+" / 미 답변 "+w_miss_cnt+" 건");
		$("#week_req_percent_val").val(week_req_percent);
		$("#week_req_percent").html("답변률 "+week_req_percent+"%");
		$("#week_miss_percent_val").val(week_miss_percent);
		
		 /* jQueryKnob */

	    $(".knob").knob({

	      draw: function () {

	        // "tron" case
	        if (this.$.data('skin') == 'tron') {

	          var a = this.angle(this.cv)  // Angle
	              , sa = this.startAngle          // Previous start angle
	              , sat = this.startAngle         // Start angle
	              , ea                            // Previous end angle
	              , eat = sat + a                 // End angle
	              , r = true;

	          this.g.lineWidth = this.lineWidth;

	          this.o.cursor
	          && (sat = eat - 0.3)
	          && (eat = eat + 0.3);

	          if (this.o.displayPrevious) {
	            ea = this.startAngle + this.angle(this.value);
	            this.o.cursor
	            && (sa = ea - 0.3)
	            && (ea = ea + 0.3);
	            this.g.beginPath();
	            this.g.strokeStyle = this.previousColor;
	            this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sa, ea, false);
	            this.g.stroke();
	          }

	          this.g.beginPath();
	          this.g.strokeStyle = r ? this.o.fgColor : this.fgColor;
	          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth, sat, eat, false);
	          this.g.stroke();

	          this.g.lineWidth = 2;
	          this.g.beginPath();
	          this.g.strokeStyle = this.o.fgColor;
	          this.g.arc(this.xy, this.xy, this.radius - this.lineWidth + 1 + this.lineWidth * 2 / 3, 0, 2 * Math.PI, false);
	          this.g.stroke();

	          return false;
	        }
	      }
	    });
	    /* END JQUERY KNOB */
	    
	    /****** 채팅수/채팅 참여 인원/미답변수 그래프 표시 ******/
	  	var user_color = "#0000FF";		//채팅 참여 인원 색상
	  	var chat_color = "#000000";		//채팅 수 색상
	  	var miss_color = "#FF0000";		//미답변 수 색상
	  	
		  var labels = ["일","월","화","수","목","금","토"];
		  var user_cnt = user_cnt_arr;
		  var chat_cnt = chat_cnt_arr;
		  var miss_cnt = miss_cnt_arr;
		  
		  if (labels.length == 0) labels.push(0);
		  if (user_cnt.length == 0) user_cnt.push(0);
		  if (chat_cnt.length == 0) chat_cnt.push(0);
		  if (miss_cnt.length == 0) miss_cnt.push(0);

	  	$("#span_user_cnt").css("background-color", user_color);
	  	$("#span_chat_cnt").css("background-color", chat_color);
	  	$("#span_miss_cnt").css("background-color", miss_color);

		  var ChartCanvas = $("#CntChart").get(0).getContext("2d");
		  var CntChart = new Chart(ChartCanvas);
			
		  var CntChartData = {
		    labels: labels,
		    datasets: [
		      {
		        label: "상담 고객",
		        fillColor: user_color,
		        strokeColor: user_color,
		        pointColor: user_color,
		        pointStrokeColor: user_color,
		        pointHighlightFill: user_color,
		        pointHighlightStroke: user_color,
		        data: user_cnt
		      },
		      {
		        label: "챗봇 응대",
		        fillColor: chat_color,
		        strokeColor: chat_color,
		        pointColor: chat_color,
		        pointStrokeColor: chat_color,
		        pointHighlightFill: chat_color,
		        pointHighlightStroke: chat_color,
		        data: chat_cnt
		      },
		      {
		        label: "미답변",
		        fillColor: miss_color,
		        strokeColor: miss_color,
		        pointColor: miss_color,
		        pointStrokeColor: miss_color,
		        pointHighlightFill: miss_color,
		        pointHighlightStroke: miss_color,
		        data: miss_cnt
		      }
		    ]
		  };
		
		  var CntChartOptions = {
		    showScale: true,
		    scaleShowGridLines: false,
		    scaleGridLineColor: "rgba(0,0,0,.05)",
		    scaleGridLineWidth: 1,
		    scaleShowHorizontalLines: true,
		    scaleShowVerticalLines: true,
		    bezierCurve: false,
		    bezierCurveTension: 0.3,
		    pointDot: true,
		    pointDotRadius: 2,
		    pointDotStrokeWidth: 1,
		    pointHitDetectionRadius: 20,
		    datasetStroke: true,
		    datasetStrokeWidth: 2,
		    datasetFill: false,
		    maintainAspectRatio: true,
		    responsive: true
		  };

		  	CntChart.Line(CntChartData, CntChartOptions);
			/****** //채팅수/채팅 참여 인원/미답변수 그래프 표시 ******/
	 
	
    //업무별 문의현황 IFRAME 작업 
    
    //cnt1~4 확인
    var keywordArr =['설치관련','작업관련','라이선스관련','서류파일관련'];
			
	var cnt = [];		
    
    for(var i=0; i<keywordArr.length; i++){
    	$.ajax({
    		url : "getCountByKeyword_week",
    		data : "sday="+sday+"&eday="+eday+"&keyword="+keywordArr[i],
    		dataType : "text",
    		async:false,
    		success : function(data){
    			cnt[i] = data;
    		},error : function(data){
    			console.log(data);
    		}
    	});
    }
    
    $("#dashboard_chat_work").attr("src","/inc_chat?mode=dashboard_chat_work&cnt1="+cnt[0]+"&cnt2="+cnt[1]+"&cnt3="+cnt[2]+"&cnt4="+cnt[3]+"&sday="+sday+"&eday="+eday);
			
			
	}); //jquery
	
	
	/*
	   * Custom Label formatter
	   * ----------------------
	   */
	  function labelFormatter(label, series) {
	    return '<div style="font-size:13px; text-align:center; padding:2px; color: #fff; font-weight: 600;">'
	      + label
	      + '<br>'
	      + Math.round(series.percent) + '%</div>'
	  }


	var ctx = document.getElementById('myChart'); 
	var myChart = new Chart(ctx, { 
	    type: 'bar', 
	    data: { 
	        labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'], 
	        datasets: [{ label: '# of Votes', data: [12, 19, 3, 5, 2, 3], 
	            backgroundColor: [ 
	            'rgba(255, 99, 132, 0.2)', 
	            'rgba(54, 162, 235, 0.2)', 
	            'rgba(255, 206, 86, 0.2)', 
	            'rgba(75, 192, 192, 0.2)', 
	            'rgba(153, 102, 255, 0.2)', 
	            'rgba(255, 159, 64, 0.2)' 
	            ], 
	            
	            borderColor: [ 
	            'rgba(255, 99, 132, 1)', 
	                'rgba(54, 162, 235, 1)', 
	                'rgba(255, 206, 86, 1)', 
	                'rgba(75, 192, 192, 1)', 
	                'rgba(153, 102, 255, 1)', 
	                'rgba(255, 159, 64, 1)' 
	                ], 
	                borderWidth: 1 
	                }] 
	                }, 
	                
	            options: { scales: { yAxes: [{ ticks: { beginAtZero: true } }] } } });
	
</script>
<section class="content">

      <div class="row">
        <div class="col-xs-12">
          <div class="box box-solid" style="margin-bottom: 5px;">
            <div class="box-header">
            챗봇 등록현황
            </div>

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->



			<!-- .row -->
      <div class="row">
        <div class="col-md-3 col-sm-6 col-xs-12 con_cnt" data-val="question" style="cursor:pointer">
          <div class="info-box">
            <span class="info-box-icon bg-aqua"><i class="fa fa-laptop"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">등록된 일반상담 수</span>
              <span class="info-box-number underline">${counselling_info_cnt }<small>개</small></span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12 con_cnt" data-val="scn" style="cursor:pointer">
          <div class="info-box">
            <span class="info-box-icon bg-red"><i class="fa fa-tags"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">등록된 시나리오상담 수</span>
              <span class="info-box-number underline">${scenario_main_info__cnt }<small>개</small></span>
            </div>
          </div>
        </div>
        <div class="clearfix visible-sm-block"></div>

        <div class="col-md-3 col-sm-6 col-xs-12 con_cnt" data-val="cate" style="cursor:pointer">
          <div class="info-box">
            <span class="info-box-icon bg-green"><i class="fa fa-columns"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">등록된 카테고리 수</span>
              <span class="info-box-number underline">${cate_info_cnt }<small>개</small></span>
            </div>
          </div>
        </div>
        <div class="col-md-3 col-sm-6 col-xs-12 con_cnt" data-val="keyword" style="cursor:pointer">
          <div class="info-box">
            <span class="info-box-icon bg-yellow"><i class="fa fa-th"></i></span>

            <div class="info-box-content">
              <span class="info-box-text">등록된 키워드 수</span>
              <span class="info-box-number underline">${keyword_cnt }<small>개</small></span>
            </div>
          </div>
        </div>
      </div>

    <!------------ 주간 챗봇 상담 현황 ----------------->


      <div class="row">
        <div class="col-md-12">
          <div class="box">
            <div class="box-header with-border">
              <h3 class="box-title">주간 챗봇 상담 현황</h3>
            </div>
            <!-- /.box-header -->

            <div class="box-body">
              <div class="row">
                <div class="col-md-6">
                    <div class="box-body">
                    <div style="height:50px"></div>
                    <div class="row">

                        <div class="col-md-4 text-center">
                        <h3 class="box-title" id="sum_visit_time"><!-- 총 상담시간 --></h3>
                        </div>

                        <div class="col-md-4 text-center">
                            <input type="text" class="knob" value="" id="week_miss_percent_val" data-width="120" data-height="120" data-fgColor="#f56954">
                            <div class="knob-label">미답변률</div>
                            <div class="knob-label" id="w_chat_miss_cnt"><!-- 응대 <?= $w_chat_cnt ?> / 미 답변 <?= $w_miss_cnt ?> 건 --></div>
                        </div>


                        <div class="col-md-4 text-center">
                          <input type="text" class="knob" value="" id="week_req_percent_val" data-width="120" data-height="120" data-fgColor="#f56954">
                          <div class="knob-label" id="week_req_percent"><!-- 답변률 <?= $week_req_percent ?>% --></div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                  <p class="text-center">
                    <strong>기간: <span id="chat_period"></span></strong>
                  </p>

                  <div class="chart">
                    <canvas id="CntChart" style="height: 180px; width: 605px;"></canvas>
                  </div>    


                  <p class="text-center">
                    <span id="span_chat_cnt">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;챗봇 응대
                    <span id="span_user_cnt">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;상담 고객
                    <span id="span_miss_cnt">&nbsp;&nbsp;&nbsp;&nbsp;</span>&nbsp;미답변 수
                  </p>

                  <!-- /.chart-responsive -->
                </div>
                <!-- /.col -->

              </div>
              <!-- /.row -->
            </div>

          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
	<!------------ 주간 챗봇 상담 현황 끝----------------->
	
	
	
	<div class="row">


		<div class="col-md-6">
          <div class="box box-primary">
            <div class="box-header with-border">
              <i class="fa fa-cutomer-week-o"></i>
              <h3 class="box-title">최근 문의현황</h3>
              <div class="box-tools pull-right"><a href="?mode=content.qa">바로가기 ></a></div>
            </div>
            <div class="box-body">


            <table class="table no-margin">
                <thead>
                    <tr>
                        <th>회원ID</th>
                        <th>이름</th>
                        <th>상호</th>
                        <th>최근채팅일자</th>
                        <th>문의현황</th>
                    </tr>
                </thead>
                <tbody>
 				
				<c:if test="${recent_comment_list != null }">
					<c:forEach var="recent_comment" items="${recent_comment_list }">
					<tr>
	                    <td>${recent_comment.mobile }</td>
	                    <td>${recent_comment.name }</td>
	                    <td>${recent_comment.company_name }</td>
	                    <td>${recent_comment.regdate }</td>
	                    <td align="center">
	                    	<button type="button" class="btn btn-danger btn-xs custom_qa" data-val="${recent_comment.comment_no }">열람</button>
	                    </td>
                	</tr>
					</c:forEach>
				</c:if>
          

                </tbody>
            </table>
            </div>
            <!-- /.box-body-->
          </div>
          <!-- /.box -->
	    </div>
		
        <div class="col-md-6">
              <div class="box box-success">
                <div class="box-header with-border">
                  <h3 class="box-title">업무별 문의현황 (기간 : <span id="qa_period"></span> )</h3>
                </div>
                <div class="box-body"><iframe id="dashboard_chat_work" style="display:block; width:100%; height: 280px" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no></iframe></div>
                <!-- /.box-body -->
              </div>
              <!-- /.box -->
        </div>

	</div>


<!-- jQuery Knob -->
<script src="resource/admin/bower_components/jquery-knob/js/jquery.knob.js"></script>
<!-- Sparkline -->
<script src="resource/admin/bower_components/jquery-sparkline/dist/jquery.sparkline.min.js"></script>
<!-- page script -->


<!-- FLOT CHARTS -->
<script src="resource/admin/bower_components/Flot/jquery.flot.js"></script>
<!-- FLOT RESIZE PLUGIN - allows the chart to redraw when the window is resized -->
<script src="resource/admin/bower_components/Flot/jquery.flot.resize.js"></script>
<!-- FLOT PIE PLUGIN - also used to draw donut charts -->
<script src="resource/admin/bower_components/Flot/jquery.flot.pie.js"></script>
<!-- FLOT CATEGORIES PLUGIN - Used to draw bar charts -->
<script src="resource/admin/bower_components/Flot/jquery.flot.categories.js"></script>

 

<!-- Modal -->
<div class="modal fade" id="custom_qa_reg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" data-backdrop="static">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">카테고리 추가</h4>
      </div>
      <div class="modal-body" style='background-color:#FFF;'>
        <iframe src="" id="custom_qa_add" frameborder=0 scrolling=YES style='width:100%;height:500px'></iframe>
      </div>
      <div class="modal-footer">

        <button type="button" class="btn btn-default custom_cancle">취소</button>
        <button type="button" class="btn btn-primary custom_save">저장</button>
      </div>
    </div>
  </div>
</div>

</section>