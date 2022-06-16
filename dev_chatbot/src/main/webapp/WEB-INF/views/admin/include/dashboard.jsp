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

<script>
	 
	 //이번주 일요일(sday)와 오늘(eday)
	 
/* 	 var today = new Date();
	 var year = today.getFullYear();
	 var month = today.getMonth()+1;
		 month = month >= 10 ? month:"0"+month; 
	 var date = today.getDate();
		 date = date >= 10 ? date : "0"+date; 
	 var day = today.getDay(); //0:일 6:토
	 
	 var fullToday = year+"-"+month+"-"+date;
	 
	 console.log("today : "+ today);
	 console.log("year+month+date : "+ year+month+date);
	 console.log("day : "+ day);
	 console.log("fullToday : "+ fullToday);
	 
	 var sday = new Date(year, month, nowDay - nowDayOfWeek);
	 
	 var thisSunday = today-day
	 console.log("thisSunday : "+ thisSunday);
	  */
	 
	  var sday="";
	  var eday="";
	  var endday="";
	  var sdayNotSlashed = "";
	  var edayNotSlashed = "";
	  var enddayNotSlashed = "";
	  
	 function formatDate(date) {
		   var myyear = date.getFullYear();
	       var mymonth = date.getMonth();
	       mymonth = mymonth > 10 ? mymonth : "0"+mymonth;
	       var myweekday = date.getDate();
	       myweekday = myweekday > 10 ? myweekday : "0"+myweekday;
	       return (myyear +"-"+mymonth + "-" + myweekday);
	}
	 function formatDateNoSlashed(date){
		  var myyear = date.getFullYear();
	       var mymonth = date.getMonth();
	       	mymonth = mymonth > 10 ? mymonth : "0"+mymonth;
	       var myweekday = date.getDate();
	       	myweekday = myweekday > 10 ? myweekday : "0"+myweekday;
	       return (myyear+mymonth+myweekday);
	 }

	function getWeek() {
	       var now = new Date();
	       var nowDayOfWeek = now.getDay();
	       var nowDay = now.getDate();
	      	 	nowDay = nowDay > 10 ? nowDay : "0"+nowDay;
	      	 	
	       var nowMonth = now.getMonth()+1;
	     	   nowMonth = nowMonth > 10 ? nowMonth : "0"+nowMonth;
	     	   
	       var nowYear = now.getYear();
	       		nowYear += (nowYear < 2000) ? 1900 : 0;
	       		
	       var weekStartDate = new Date(nowYear, nowMonth, nowDay - nowDayOfWeek);
	       var weekEndDate = new Date(nowYear, nowMonth, nowDay + (6 - nowDayOfWeek));
	       //표기용 날짜
	       sday = formatDate(weekStartDate);
	       eday = nowYear +"-"+nowMonth+"-"+nowDay;
	       endday = formatDate(weekEndDate);
	       
	       //DB 비교용 날짜
	       sdayNotSlashed = formatDateNoSlashed(weekStartDate);
	 	   edayNotSlashed = nowYear+nowMonth+nowDay;
	 	   enddayNotSlashed = formatDateNoSlashed(weekEndDate);
	}
	
	getWeek();
	
	console.log("이번주 일요일 :  " +sday + " / 오늘 : " + eday +" / 이번주 토요일 : " + endday);
	console.log("sdayNotSlashed : " + sdayNotSlashed + " / edayNotSlashed : "+edayNotSlashed + " / enddayNotSlashed : "+enddayNotSlashed);
	
	
		
	//주간(일요일 ~ 현재요일까지) 이용자 수 user_cnt 산출
	var w_user_cnt = 0; 
	$.ajax({
		url : "getUser_cnt",
		data : "sday="+sdayNotSlashed+"&eday="+edayNotSlashed,
		dataType : "text",
		async:false,
		success : function(data){
			w_user_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
	
	//주간(일요일 ~ 현재요일까지) 채팅 수 chat_cnt 산출
	var chat_cnt = 0;
	$.ajax({
		url : "getChat_cnt",
		data : "sday="+sdayNotSlashed+"&eday="+edayNotSlashed,
		dataType : "text",
		async:false,
		success : function(data){
			chat_cnt = data;
		},error : function(data){
			console.log(data);
		}
	});
	
	console.log(sday+"->"+eday+" _ 사용자 수 : "+w_user_cnt+"명 / "+ "채팅 수 : "+chat_cnt+"개");
	
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
	
	console.log("전체기간 이용자 수 : " + t_user_cnt);
	/*
	
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

 */



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

