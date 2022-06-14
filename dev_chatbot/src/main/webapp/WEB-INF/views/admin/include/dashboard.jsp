<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--Dashboard Chart-->
<script src="resource/admin/plugins/chartjs/Chart.js"></script>
<script src="resource/admin/plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="resource/admin/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
<script src="resource/admin/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
<!--<script src="dist/js/pages/dashboard2.js?v=1"></script>-->
<!--//Dashboard Chart-->


<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	<li> <a href="#"> <i class="fa fa-home"></i> 메인</a> </li>
	<li class="active">대시보드</li>
</ul>


<!--     function lastSunToSat($ymd) {
        $time = strtotime($ymd);
        $today = date("Y-m-d", $time);

        $tday = date("w", $time);

        if($tday) $Sun = -1;
        else $Sun = -1;

        $last['Sun'] = strtotime("{$Sun} Sunday", $time);
        $last['Sat'] = strtotime("previous Saturday", $time);

        $last['Sun_ymd'] = date("Y-m-d", $last['Sun']);
        $last['Sat_ymd'] = date("Y-m-d", $last['Sat']);

        return $last;
    }

    $ymd = Date("Ymd", strtotime("0 days") );
    $last = lastSunToSat($ymd);

    $sday = date("Y-m-d", $last['Sun']);



    //$sday = addslashes($_GET['sday']);
    $eday = addslashes($_GET['eday']);

    If ($sday == "") $sday = Date("Y-m-d", strtotime("-7 days")) ;
    If ($eday == "") $eday = Date("Y-m-d", strtotime("0 days")) ;




	for ($i=1; $i < 8; $i++) {
        $strQry = "SELECT COUNT(distinct user_id) as user_cnt FROM chatting_log WHERE kind = 0 
                   AND 0=0
                   AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
                   AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday' 
                   AND dayofweek = '$i' ";

        $row = sql_fetch($strQry);
        $user_cnt  .= "\"". $row['user_cnt'] ."\",";  
    }
    	$user_cnt = substr($user_cnt,0, strlen($user_cnt)-1);



	for ($i=1; $i < 8; $i++) {

        $strQry = "SELECT COUNT(user_id) as chat_cnt FROM v_chatting_log WHERE kind = 1 
            AND 0=0
            AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
            AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday' 
            AND dayofweek = '$i' ";

        $row = sql_fetch($strQry);
        $chat_cnt  .= "\"". $row['chat_cnt'] ."\",";  
    }
    	$chat_cnt = substr($chat_cnt,0, strlen($chat_cnt)-1);



	for ($i=1; $i < 8; $i++) {

        $strQry = "SELECT COUNT(msg_m) as miss_cnt FROM v_chatting_log WHERE kind = 1 
            AND 0=0 
            AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
            AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday'             
            AND msg_s1 = '00000'  AND msg_s2 = '00000' AND msg_s3 = '00000' 
            AND dayofweek = '$i' ";
        $row = sql_fetch($strQry);
        $miss_cnt  .= "\"". $row['miss_cnt'] ."\",";  
    }
    	$miss_cnt = substr($miss_cnt,0, strlen($miss_cnt)-1);


    // 주간 챗봇이용시간
	$strQry = "SELECT IFNULL(SUM(visit_time), 0)  as sum_visit_time 
			   FROM customer_info_visit_time 
			   WHERE date(sdate) between  '$sday' and  '$eday' ";

	$res = sql_fetch($strQry);
	$stime = $res['sum_visit_time'];


    $sum_visit_time = gmdate('H시i분s초',$stime);


	//전체 채팅 수
	$strQry = "SELECT COUNT(distinct user_id) as user_cnt 
			   FROM chatting_log 
			   WHERE kind = 0  AND 0=0 ";
	$res = sql_fetch($strQry);
	$t_user_cnt = $res['user_cnt'];

    //주간 전체 채팅 수
	$strQry = "SELECT COUNT(distinct user_id) as user_cnt 
			   FROM chatting_log 
			   WHERE kind = 0 
			   AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
               AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";


	$res = sql_fetch($strQry);
	$w_user_cnt = $res['user_cnt'];

	
    //주간 이용자 퍼센트
    if($w_user_cnt == 0 ){
        $week_user_percent= 0;
    }else{
        $week_user_percent = round( ( $w_user_cnt /  $t_user_cnt ) * 100 ,2);
    }

 

    //챗봇 일주일 응대수
	$strQry = "SELECT COUNT(user_id) as cnt 
			   FROM v_chatting_log 
			   WHERE kind = 1  
			   AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
               AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";    
	$res = sql_fetch($strQry);
	$w_chat_cnt = $res['cnt'];






    //w_chat_cnt : 일주일 응대
    //챗봇 일주일 미답변
	$strQry = " SELECT  COUNT(msg_m) as cnt FROM chatting_log 
                WHERE 0=0 
                AND kind = 1 
                AND msg_s1 = '00000' 
                AND msg_s2 = '00000' 
                AND msg_s3 = '00000' 
			   AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'
               AND from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";               

	$res = sql_fetch($strQry);
	$w_miss_cnt = $res['cnt'];

    //주간 챗봇응대 퍼센트
    if($w_user_cnt == 0 ){
        $week_miss_percent= 0;
    }else{
        $week_miss_percent = round( ( $w_miss_cnt /  $w_chat_cnt ) * 100 ,2);
    }



    if($w_chat_cnt == 0 ){
        $week_req_percent= 0;
    }else{
        $week_req_percent =  round(( $w_chat_cnt - $w_miss_cnt ) /  $w_chat_cnt * 100 ,2);
    }





 -->
<script>
	$(function(){
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
		
	});
</script>
<section class="content">

<!--







/***
      <div class="row">
        <div class="col-xs-12">
          <div class="box box-solid">
            <div class="box-header">
              <div class="box-tools pull-right">


                  <form name="theForm" action="?" method="get">
                    <input type="hidden" name="mode" value="dashboard">
                        <select name="folder" class="form-control" onchange="document.theForm.submit();">
                            <option value="">도메인 선택</option>
                            <?
                            $strQry = "SELECT folder FROM domain_info " . $whereSql2;
                            $result = sql_query($strQry);
                            for($i=0; $row=sql_fetch_array($result); $i++) {
                                $folder = $row['folder'] ; 
                            
                            <option value="<?=$folder?>" <? if ($_GET['folder'] == $folder){ ?> selected <? } ?>><?=$folder?></option>
                            <?
                                    }
                            ?>
                    </select>
                  </form>

              </div>
            </div>
          </div>
          -->
         





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
                        <h3 class="box-title">총 상담시간<br/><?= $sum_visit_time ?></h3>
                        </div>

                        <div class="col-md-4 text-center">
                            <input type="text" class="knob" value="<?= $week_miss_percent ?>" data-width="120" data-height="120" data-fgColor="#f56954">
                            <div class="knob-label">미답변률</div>
                            <div class="knob-label">응대 <?= $w_chat_cnt ?> / 미 답변 <?= $w_miss_cnt ?> 건</div>
                        </div>


                        <div class="col-md-4 text-center">
                          <input type="text" class="knob" value="<?= $week_req_percent ?>" data-width="120" data-height="120" data-fgColor="#f56954">
                          <div class="knob-label">답변률 <?= $week_req_percent ?>%</div>
                        </div>
                    </div>
                    </div>
                </div>
                <!-- /.col -->

                <div class="col-md-6">
                  <p class="text-center">
                    <strong>기간: <?= $sday ?>~<?= $eday ?></strong>
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
    <!------------ 주간 챗봇 상담 현황 ----------------->



  <!--   
        $strQry = "SELECT COUNT(user_id) as cnt FROM chatting_log WHERE  0=0   ";
        $strQry .= "AND REPLACE(msg_m_txt, '▶', '')= '설치관련' ";      
        $strQry .= "AND  kind = 0 ";
        $strQry .= "AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'  ";
        $strQry .= "AND  from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";
        $res = sql_fetch($strQry);
        $cnt1 = $res['cnt'];

        $strQry = "SELECT COUNT(user_id) as cnt FROM chatting_log WHERE  0=0   ";
        $strQry .= "AND REPLACE(msg_m_txt, '▶', '')= '작업관련' ";      
        $strQry .= "AND  kind = 0 ";
        $strQry .= "AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'  ";
        $strQry .= "AND  from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";
        $res = sql_fetch($strQry);
        $cnt2 = $res['cnt'];


        $strQry = "SELECT COUNT(user_id) as cnt FROM chatting_log WHERE  0=0   ";
        $strQry .= "AND REPLACE(msg_m_txt, '▶', '')= '라이선스관련' ";      
        $strQry .= "AND  kind = 0 ";
        $strQry .= "AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'  ";
        $strQry .= "AND  from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";
        $res = sql_fetch($strQry);
        $cnt3 = $res['cnt'];

        $strQry = "SELECT COUNT(user_id) as cnt FROM chatting_log WHERE  0=0   ";
        $strQry .= "AND REPLACE(msg_m_txt, '▶', '')= '서류파일관련' ";      
        $strQry .= "AND  kind = 0 ";
        $strQry .= "AND from_unixtime(regdate, '%Y-%m-%d') >= '$sday'  ";
        $strQry .= "AND  from_unixtime(regdate, '%Y-%m-%d') <= '$eday' ";
        $res = sql_fetch($strQry);
        $cnt4 = $res['cnt'];
     -->



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
	                    <td align="center"><button type="button" class="btn btn-danger btn-xs custom_qa" data-val="${recent_comment.comment_no }">열람</button></td>
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
                  <h3 class="box-title">업무별 문의현황 (기간 : <?= $sday ?>~<?= $eday ?> )</h3>
                </div>
                
                <div class="box-body"><iframe src="./inc_chat.php?mode=dashboard_chat_work&cnt1=<?= $cnt1 ?>&cnt2=<?= $cnt2 ?>&cnt3=<?= $cnt3 ?>&cnt4=<?= $cnt4 ?>&sday=<?= $sday ?>&eday=<?= $eday?>" style="display:block; width:100%; height: 280px" frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no></iframe></div>
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




<script>
  $(function () {
	//최근 문의현황의 열람을 누를경우
    $('.custom_qa').click(function() {
        modal_mode = "add";
        no    = $(this).attr("data-val");
        $('.modal-title').html("담당자 문의현황");
        $('#custom_qa_reg').modal('show');
    });
	
	//content.qa.comment.jsp?no=no 를 src요소로 삽입하여 해당 no읠 문의요청을 확인한다.
    $('#custom_qa_reg').on('show.bs.modal', function (event) {
        if(modal_mode=='add') $('#custom_qa_add').attr("src","content.qa.comment.php?no="+no);
    });

	//창닫기
    $(".custom_cancle").click(function(){
        if(confirm("창을 닫습니다.")){
            $("#custom_qa_reg").modal('hide');
        }
    }); 


    /* jQueryKnob */

    $(".knob").knob({
      /*change : function (value) {
       //console.log("change : " + value);
       },
       release : function (value) {
       console.log("release : " + value);
       },
       cancel : function () {
       console.log("cancel : " + this.value);
       },*/
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
	  var user_cnt = [<?=$user_cnt?>];
	  var chat_cnt = [<?=$chat_cnt?>];
	  var miss_cnt = [<?=$miss_cnt?>];
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



  });



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

