<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
/* //다중 검색용 sql문 제작
String sql_common = " from counselling_info  ";

String sql_search = " where (1) ";


//*** 서버요청 실시해서 설정한 파라미터의 결과값을 확인

String stx = request.getParameter("stx");
if(stx==null){
	stx="";
}
String sfl = request.getParameter("sfl");
if(sfl==null){
	sfl="";
}

String cate_name = request.getParameter("cate_name");

if(cate_name==null){
	cate_name = "ALL";
}


//전체 검색이 아니라면 
if(cate_name!=null){
	sql_search += " and q_type = "+cate_name+" ";
}

//stx(키워드가 있다면)
if(!(stx.equals(""))){
	sql_search += " and ( ";
	if(!(sfl.equals("all"))){ //검색기준이 전체가 아닌경우
	    if(sfl.equals("id_name")){
	        sql_search += " ("+sfl+" like '%"+stx+"%') ";
	    }else if(sfl.equals("ci_question")){
	    	sql_search += " ("+sfl+" like '%"+stx+"%') ";
	    }else{
	    	sql_search += " ("+sfl+" like '%"+stx+"%') ";
	    }
	}else{ //검색기준이 전체인 경우 
		sql_search += " (id_name like '%"+stx+"%' or ci_question like '%"+stx+"') ";
	}
	sql_search += " ) ";
}




//나열 순서 sql 확인
String sst = request.getParameter("sst");
String sst2 = "";
String sod = "";

if (sst==null) {
sst2 = "ci_reg_date";
sod = "desc";
}


if(sst =="question_desc"){
sst2 = "ci_question";
sod = "desc";

}

if(sst =="question_asc"){
sst2 = "ci_question";
sod = "asc";

}

if(sst =="regdate_asc"){
sst2 = "ci_reg_date";
sod = "asc";

}

if(sst =="regdate_desc"){
sst2 = "ci_reg_date";
sod = "desc";

}

if(sst =="state_asc"){
sst2 = "state";
sod = "asc";
}

if(sst =="state_desc"){
sst2 = "state";
sod = "desc";
}


String sql_order = " order by "+sst2+" "+sod;
String cntSql = " select count(*) as cnt "+sql_common + sql_search + sql_order;
 */
%>

<!-- jquery  -->
<script src="/resource/admin/bower_components/jquery/dist/jquery.min.js"></script>
 <link href="/resource/admin/plugins/bootstrap-tagsinput/bootstrap-tagsinput.css?ver=<?= $app_ver ?>" rel="stylesheet">
 <script src="/resource/admin/plugins/bootstrap-tagsinput/bootstrap-tagsinput.js"></script>
<script type="text/javascript" src="/resource/admin/static/admin_js/app.v1.js"></script>
<script type="text/javascript" src="/resource/admin/static/admin_js/mab-jquery-taginput.js"></script>
<script type="text/javascript" src="/resource/admin/static/admin_js/typeahead.bundle.min.js"></script>
<script type="text/javascript" src="/resource/admin/static/admin_js/common.js"></script>
<script src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>
<script>
//페이징용 변수 선언
var current_page = 1;
var current_block = Math.ceil(current_page/10);
var startPage = (current_block*10)-9;
var endPage = current_block *10;
let total = 0;
let totalPage = 0;
let totalBlock = 0

function formatDate_hms(date){
	var myyear = date.getFullYear();
    var mymonth = date.getMonth()+1;
    mymonth = mymonth > 10 ? mymonth : "0"+mymonth;
    var myweekday = date.getDate();
    myweekday = myweekday > 10 ? myweekday : "0"+myweekday;
    var hour = date.getHours();
    var min = date.getMinutes();
    var sec = date.getSeconds();
    
    return (myyear+"-"+mymonth +"-"+ myweekday+" "+hour+":"+min+":"+sec);
}

//페이지 및 검색결과에 따른 서버요청 
function openAjaxSearch(){
	var sfl = $("#sfl").val();
	if (sfl == "all"){
		sfl = "";
	}
	var stx = $("#stx").val();
	var sst = $("#sst").val();
	var cate_name = $(".cate_sel").val();
	if (cate_name == "ALL"){
		cate_name = "";
	}
	var page = 1;
	current_page =1;
	
	$.ajax({
		url : "result_content_question_list",
		data : "sfl="+sfl+"&stx="+stx+"&sst="+sst+"&cate_name="+cate_name+"&page="+page,
		dataType : "json",
		contentType : "application/json",
		success : function(data){
			var idx = 0;
			var bg = idx % 2;
			var html = "";
			//자료가 없을 경우
			if(data.length == 0){
				html += "<tr><td colspan='8' class=\"empty_table\" style=\"text-align:center;\">등록된 자료가 없습니다.</td></tr>";
				$("#table-striped_tbody").html(html);
				return;
			}
			$.each(data,function(index,item){
				 idx ++;
				 html += "<tr class='bg"+bg+"'>";
				 html += "<td align=\"center\"><span class=\"td_chk\">";
				 html += "<input type=\"checkbox\" name=\"chk\" value="+this.seq_num+" id='chk_"+index+"'  data-val="+this.seq_num+">";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.id_name+"</td>";
				 html += "<td align=\"center\"><span style=\"width:250px;word-break;break-all\">";
				 html += "<span class=\"underline modify_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">";
				 html += this.ci_question+"</span>";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.ci_disp_name+"</td>";
				 html += "<td align=\"center\">";
				 html += "<button type=\"button\" class=\"btn btn-default btn-xs modify_sub_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">등록</button>";    
				 html += "</td>";
				 //카테고리명 확인
				 $.ajax({
					 url : "get_q_disp_name_By_Q_type",
					 data : "q_type="+this.q_type,
					 async:false,
					 success : function(data){
						 html += "<td align=\"center\">"+data.q_disp_name+"</td>";
					 },error : function(data){
						 console.log(data);
					 }
				 });
				 
				 var reg_date=new Date(this.ci_reg_date*1000);
				 var frm_reg_date = formatDate_hms(reg_date);
				 
				 html += "<td align=\"center\">"+frm_reg_date+"</td>";
				 html += "<td align=\"center\">";
	             html += "<input class=\"live_btn\" type=\"checkbox\"";
	             	if(this.state == 1){
	             	html += "checked";
	             	}
	             	html += " data-toggle=\"toggle\" data-onstyle=\"success\" data-size=\"small\" data-val=\""+this.seq_num+"\" data-on=\"ON\" data-off=\"OFF\">";
		            html += "</td></tr>";
			});
			
			total = idx;
			totalPage = Math.ceil(total/15);
			totalBlock = Math.ceil(totalPage/10);
			$("#page").val(page);
			current_page = page;
			current_block = Math.ceil(current_page/10); 
			startPage = (current_block*10)-9;
			endPage = current_block *10;
			
			$(".fa-gear").html("질문리스트 ("+total+")");
			console.log("total : " + total);
			console.log("totalPage : " + totalPage);
			console.log("totalBlock : " + totalBlock);
			console.log("startPage : " + startPage);
			console.log("endPage : " + endPage);
			
			
			$("#table-striped_tbody").html(html);
		},error : function(data){
			alert("데이터를 조회할 수 없습니다.");
			console.log(data);
		}
	});
	/* pageHtml 작업 */
	var pageHtml = "";
	pageHtml += "<nav class=\"pg_wrap\">";
	pageHtml += "<span class=\"pg\">";
	pageHtml += "<nav>";
	pageHtml += "<ul class=\"pagination\">";
	//current_page가 1이면 disabled
	if(current_page <=1 ){
		pageHtml += "<li class=\"disabled\">";	
	}else{
		pageHtml += "<li>";
		if(current_block == 1){
			//current_block이 1이면 시작페이지로
			pageHtml += "<a onclick='openAjaxSearchPage("+startPage+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;
		}else{
			//지난 블록 마지막 페이지
			pageHtml += "<a onclick='openAjaxSearchPage("+((current_block*10)-10)+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;	
		}
	}
	//for로 반복
	for (var i = startPage; i<=endPage; i++){
		if(i <= totalPage){
			if(i == current_page){
				pageHtml += "<li class=\"active\"><a href=\"#\">"+i+"</a></li>";		
			}else{
				pageHtml += "<li><a class=\"pg_page\" onclick=\"openAjaxSearchPage("+i+")\">"+i+"</a></li>";
			}	
		}
	}
	if(current_block < totalBlock){
		//다음 블록 첫페이지	
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+((current_block*10)+1)+")\" class=\"pg_page pg_next\">≥</a></li>";
		//가장 끝 페이지
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+(totalPage)+")\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li>";
	}		
	pageHtml += "</ul>";
	pageHtml += "</nav>";
	pageHtml += "</span>";
	pageHtml += "</nav>";
	
	console.log("current_block:" + current_block);
	console.log("current_page : "+ current_page);
	console.log("startPage : " + startPage);
	console.log("endPage : " + endPage);
	
	$("#page_div").html(pageHtml);
	
}

//페이지 이동에 따른 Ajax 처리
//페이지 및 검색결과에 따른 서버요청 
function openAjaxSearchPage(num){
	var page = num;
	$("#page").val(num);
	current_page = num;
	current_block = Math.ceil(current_page/10); 
	
	startPage = (current_block*10)-9;
	endPage = current_block *10;
	
	var sfl = $("#sfl").val();
	if (sfl == "all"){
		sfl = "";
	}
	var stx = $("#stx").val();
	var sst = $("#sst").val();
	var cate_name = $(".cate_sel").val();
	if (cate_name == "ALL"){
		cate_name = "";
	}
	
	
	$.ajax({
		url : "result_content_question_list",
		data : "sfl="+sfl+"&stx="+stx+"&sst="+sst+"&cate_name="+cate_name+"&page="+page,
		dataType : "json",
		contentType : "application/json",
		success : function(data){
			var idx = 0;
			var bg = idx % 2;
			var html = "";
			//자료가 없을 경우
			if(data.length == 0){
				html += "<tr><td colspan='8' class=\"empty_table\" style=\"text-align:center;\">등록된 자료가 없습니다.</td></tr>";
				$("#table-striped_tbody").html(html);
				return;
			}
			$.each(data,function(index,item){
				 idx ++;
				 html += "<tr class='bg"+bg+"'>";
				 html += "<td align=\"center\"><span class=\"td_chk\">";
				 html += "<input type=\"checkbox\" name=\"chk\" value="+this.seq_num+" id='chk_"+index+"'  data-val="+this.seq_num+">";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.id_name+"</td>";
				 html += "<td align=\"center\"><span style=\"width:250px;word-break;break-all\">";
				 html += "<span class=\"underline modify_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">";
				 html += this.ci_question+"</span>";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.ci_disp_name+"</td>";
				 html += "<td align=\"center\">";
				 html += "<button type=\"button\" class=\"btn btn-default btn-xs modify_sub_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">등록</button>";    
				 html += "</td>";
				 //카테고리명 확인
				 $.ajax({
					 url : "get_q_disp_name_By_Q_type",
					 data : "q_type="+this.q_type,
					 async:false,
					 success : function(data){
						 html += "<td align=\"center\">"+data.q_disp_name+"</td>";
					 },error : function(data){
						 console.log(data);
					 }
				 });
				 
				 var reg_date=new Date(this.ci_reg_date*1000);
				 var frm_reg_date = formatDate_hms(reg_date);
				 
				 html += "<td align=\"center\">"+frm_reg_date+"</td>";
				 html += "<td align=\"center\">";
	             html += "<input class=\"live_btn\" type=\"checkbox\"";
	             	if(this.state == 1){
	             	html += "checked";
	             	}
	             	html += " data-toggle=\"toggle\" data-onstyle=\"success\" data-size=\"small\" data-val=\""+this.seq_num+"\" data-on=\"ON\" data-off=\"OFF\">";
		            html += "</td></tr>";
			});
			$(".fa-gear").html("질문리스트 ("+total+")");
			console.log("total : " + total);
			console.log("totalPage : " + totalPage);
			console.log("totalBlock : " + totalBlock);
			$("#table-striped_tbody").html(html);
		},error : function(data){
			alert("데이터를 조회할 수 없습니다.");
			console.log(data);
		}
	});
	
	/* pageHtml 작업 */
	var pageHtml = "";
	pageHtml += "<nav class=\"pg_wrap\">";
	pageHtml += "<span class=\"pg\">";
	pageHtml += "<nav>";
	pageHtml += "<ul class=\"pagination\">";
	//current_page가 1이면 disabled
	if(current_page <=1 ){
		pageHtml += "<li class=\"disabled\">";	
	}else{
		pageHtml += "<li>";
		if(current_block == 1){
			//current_block이 1이면 시작페이지로
			pageHtml += "<a onclick='openAjaxSearchPage("+startPage+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;
		}else{
			//지난 블록 마지막 페이지
			pageHtml += "<a onclick='openAjaxSearchPage("+((current_block*10)-10)+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;	
		}
	}
	
			
	//for로 반복
	for (var i = startPage; i<=endPage; i++){
		if(i <= totalPage){
			if(i == current_page){
				pageHtml += "<li class=\"active\"><a href=\"#\">"+i+"</a></li>";		
			}else{
				pageHtml += "<li><a class=\"pg_page\" onclick=\"openAjaxSearchPage("+i+")\">"+i+"</a></li>";
			}	
		}
		
	}
	if(current_block < totalBlock){
		//다음 블록 첫페이지	
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+((current_block*10)+1)+")\" class=\"pg_page pg_next\">≥</a></li>";
		//가장 끝 페이지
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+(totalPage)+")\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li>";
	}		
	pageHtml += "</ul>";
	pageHtml += "</nav>";
	pageHtml += "</span>";
	pageHtml += "</nav>";
	
	console.log("current_block:" + current_block);
	console.log("current_page : "+ current_page);
	console.log("startPage : " + startPage);
	console.log("endPage : " + endPage);
	
	$("#page_div").html(pageHtml);
}

	



$(function(){/******************* Jquery Ready *******************/
	var current_page = $("#page").val();
	//페이지 새로고침
	$(".reload_btn").click(function(){
		location.reload();
	});
	
	
	//*** 페이지 첫 로드시 ajax 로 카테고리 종류 전부 불러와야함!	
	let cate_sel_html = "<option value='ALL'>카테고리</option>";
	
	$.ajax({
		url : "getCate_info_All",
		dataType : "json",
		contentType : "application/json",
		async:false,
		success : function(data){
			$.each(data,function(index,item){
				//this.q_type과 this.q_disp_name을 Select의 옵션값으로
				cate_sel_html += "<option value='"+this.q_type+"'>"+this.q_disp_name+"</option>";
			});
		},error : function(data){
			console.log("카테고리 정보를 찾을 수 없습니다.");
		}
	});
	$(".cate_sel").html(cate_sel_html);
	
	
	//**일반상담 첫 페이지 로드
	var sfl = $("#sfl").val();
	if (sfl == "all"){
		sfl = "";
	}
	var stx = $("#stx").val();
	var sst = $("#sst").val();
	var cate_name = $(".cate_sel").val();
	if (cate_name == "ALL"){
		cate_name = "";
	}
	
	$.ajax({
		url : "result_content_question_list",
		data : "sfl="+sfl+"&stx="+stx+"&sst="+sst+"&cate_name="+cate_name+"&page=1",
		dataType : "json",
		contentType : "application/json",
		success : function(data){
			var idx = 0;
			var bg = idx % 2;
			var html = "";
			//자료가 없을 경우
			if(data.length == 0){
				html += "<tr><td colspan='8' class=\"empty_table\" style=\"text-align:center;\">등록된 자료가 없습니다.</td></tr>";
				$("#table-striped_tbody").html(html);
				return;
			}
			$.each(data,function(index,item){
				 idx ++;
				 html += "<tr class='bg"+bg+"'>";
				 html += "<td align=\"center\"><span class=\"td_chk\">";
				 html += "<input type=\"checkbox\" name=\"chk\" value="+this.seq_num+" id='chk_"+index+"'  data-val="+this.seq_num+">";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.id_name+"</td>";
				 html += "<td align=\"center\"><span style=\"width:250px;word-break;break-all\">";
				 html += "<span class=\"underline modify_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">";
				 html += this.ci_question+"</span>";
				 html += "</span></td>";
				 html += "<td align=\"center\">"+this.ci_disp_name+"</td>";
				 html += "<td align=\"center\">";
				 html += "<button type=\"button\" class=\"btn btn-default btn-xs modify_sub_question\"  data-val=\""+this.ci_depth1_id+"_"+this.ci_depth2_id+"_"+this.ci_depth3_id+"\" data-val2=\""+this.seq_num+"\">등록</button>";    
				 html += "</td>";
				 //카테고리명 확인
				 $.ajax({
					 url : "get_q_disp_name_By_Q_type",
					 data : "q_type="+this.q_type,
					 async:false,
					 success : function(data){
						 html += "<td align=\"center\">"+data.q_disp_name+"</td>";
					 },error : function(data){
						 console.log(data);
					 }
				 });
				 
				 var reg_date=new Date(this.ci_reg_date*1000);
				 var frm_reg_date = formatDate_hms(reg_date);
				 
				 html += "<td align=\"center\">"+frm_reg_date+"</td>";
				 html += "<td align=\"center\">";
	             html += "<input class=\"live_btn\" type=\"checkbox\"";
	             	if(this.state == 1){
	             	html += "checked";
	             	}
	             	html += " data-toggle=\"toggle\" data-onstyle=\"success\" data-size=\"small\" data-val=\""+this.seq_num+"\" data-on=\"ON\" data-off=\"OFF\">";
		            html += "</td></tr>";
			});
			
			$("#table-striped_tbody").html(html);
			
		},error : function(data){
			alert("데이터를 조회할 수 없습니다.");
			console.log(data);
		}
	});
	
	
	//총 페이지수(totalPage) , 총 블록수(totalPage/pagePerBlock)
	//페이지가 미지정일 경우 첫페이지 (page=1)
	$.ajax({
		url : "cnt_counselling_info",
		async : false,
		success : function(data){
			total = data;
			totalPage = Math.ceil(total/15);
			totalBlock = Math.ceil(totalPage/10);
			$(".fa-gear").html("질문리스트 ("+total+")");
			current_page = $("#page").val();
			
			
			
		},error : function(data){
			console.log(data);
		}
	})
	//row수에 따른 페이지 출력
	console.log("total : " + total);
	console.log("totalPage : " + totalPage);
	console.log("totalBlock : " + totalBlock);
	
	/* pageHtml 작업 */
	var pageHtml = "";
	pageHtml += "<nav class=\"pg_wrap\">";
	pageHtml += "<span class=\"pg\">";
	pageHtml += "<nav>";
	pageHtml += "<ul class=\"pagination\">";
	//current_page가 1이면 disabled
	if(current_page <=1 ){
		pageHtml += "<li class=\"disabled\">";	
	}else{
		pageHtml += "<li>";
		if(current_block == 1){
			//current_block이 1이면 시작페이지로
			pageHtml += "<a onclick='openAjaxSearchPage("+startPage+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;
		}else{
			//지난 블록 마지막 페이지
			pageHtml += "<a onclick='openAjaxSearchPage("+((current_block*10)-10)+")' aria-label=\"Previous\"><span aria-hidden=\"true\">«</span></a></li>";;	
		}
	}
	//for로 반복
	for (var i = startPage; i<=endPage; i++){
		if(i <= totalPage){
			if(i == current_page){
				pageHtml += "<li class=\"active\"><a href=\"#\">"+i+"</a></li>";		
			}else{
				pageHtml += "<li><a class=\"pg_page\" onclick=\"openAjaxSearchPage("+i+")\">"+i+"</a></li>";
			}	
		}
	}
			
	if(current_block < totalBlock){
		//다음 블록 첫페이지	
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+((current_block*10)+1)+")\" class=\"pg_page pg_next\">≥</a></li>";
		//가장 끝 페이지
		pageHtml += "<li><a onclick=\"openAjaxSearchPage("+(totalPage)+")\" aria-label=\"Next\"><span aria-hidden=\"true\">»</span></a></li>";
	}		
	pageHtml += "</ul>";
	pageHtml += "</nav>";
	pageHtml += "</span>";
	pageHtml += "</nav>";
	
	console.log("current_block:" + current_block);
	console.log("current_page : "+ current_page);
	console.log("startPage : " + startPage);
	console.log("endPage : " + endPage);
	
	$("#page_div").html(pageHtml);

	/* 
	$total_page  = ceil($total_count / $rows);  // 전체 페이지 계산
	if ($page < 1) $page = 1; // 페이지가 없으면 첫 페이지 (1 페이지)
	$from_record = ($page - 1) * $rows; // 시작 열을 구함


	include_once('./include/admin.head.php');

	$sql = " select * {$sql_common} {$sql_search} {$sql_order} limit {$from_record}, {$rows} ";

	$result = sql_query($sql);

	$colspan = 16;
	?> */
	
	
});/******************* Jquery Ready *******************/




		


//**페이지 첫 로드시
// page=1
 	

//** 일반상담 삭제시 
//      if _ 선택된 값이 있다면
// 		question_info where fk_seq_num   /    counselling_info where seq_num 2가지를 삭제해야함.
//		삭제 이후 ?mode=content.question.list&page=$page로 돌아옴.

//검색시 사용할 Parameters



</script>        
	
   
  


<script type="text/javascript">
$(document).ready(function() {
    $('.chatbot').addClass("active");
    $('.default').addClass("active");

    $('.question_add_modal').click(function() {
        modal_mode = "add";
        depth_id = "";
        seq_num = "";

        $('.modal-title').html("일반 상담 등록");
        $('#question_reg').modal('show');
    });

    $('.modify_question').click(function() {
        modal_mode = "modify";
        depth_id = $(this).attr("data-val");
        seq_num = $(this).attr("data-val2");

        $('.modal-title').html("일반 상담 수정");
        $('#question_reg').modal('show');
    });




    $('.modify_sub_question').click(function() {
        modal_mode = "add_sub";
        depth_id = $(this).attr("data-val");
        seq_num = $(this).attr("data-val2");

        $('.modal-title').html("일반 상담 유사질문");
        $('#question_reg').modal('show');
    });



    $('.modify_sub_question_modify').click(function() {
        modal_mode = "modify_sub";
        depth_id = $(this).attr("data-val");
        seq_num = $(this).attr("data-val2");

        $('.modal-title').html("일반 상담 수정");
        $('#question_reg').modal('show');
    });






    $('.qa_save').click(function () {
        question_add.edit_submit();
    });




    $('#question_reg').on('show.bs.modal', function (event) {
        $('#question_add').attr("height","800px");

        if(modal_mode=='add') $('#question_add').attr("src","content.question.write.php");
        if(modal_mode=='modify') $('#question_add').attr("src","content.question.write.php?w=u&depth_id="+depth_id+"&seq_num=" + seq_num);
        if(modal_mode=='add_sub') { 
            $('#question_add').attr("height","200px");
            $('#question_add').attr("src","content.question.sub.write.php?w=u&depth_id="+depth_id+"&seq_num=" + seq_num);
        };

        if(modal_mode=='modify_sub') { 
            $('#question_add').attr("height","200px");
            $('#question_add').attr("src","content.question.sub.write.php?w=u&depth_id="+depth_id+"&seq_num=" + seq_num);
        };





    });





    $(".csv_upload").click(function(){
        $('.modal-title').html("엑셀파일로 업로드");
        $('#csv_reg').modal('show');
    });

    $('#csv_reg').on('show.bs.modal', function (event) {
        $('#csv_add').attr("src","content.csv.upload.php");
    });
    $('.csv_save').click(function () {
        $('#csv_add').contents().find('#theForm').submit();
    });



	$('.deletes').click(function () {
		if(confirm("해당 질문을 삭제하시겠습니까?\n유사질문/질문아이디도 삭제됩니다.")){
			var depth_id = $(this).attr("data-val");
			$.ajax({
				url : "./ajax/ajax_ques_del.php",
				type : "post",
				data : "depth_id="+depth_id,
				datatype : "json",
				timeout : 10000,
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				},
				success : function(getData){
					 //var list		 = $.parseJSON(getData);
					 var err_res	= parseInt(getData.err_res);
					 var err_msg	= getData.err_msg;
	
					 if(err_res != 0) {
						alert(err_msg);
					 }else{
						location.reload();
					 }
				}
			});
		}
	});   
	
	$( '#check_all' ).click( function() {
		if($('#check_all').is(':checked') == true){


			$("input[name=chk]").prop("checked", true); 
		}else{
			$("input[name=chk]").prop("checked", false);
		}
	});

    $("#sfl").val("all");
    $("#sfl_txt").val("전체");
    $('.search_select').click(function () {
        var search_txt = $(this).text();
        var search_sfl = $(this).attr('data-val');
        $('.select_search_txt').html(search_txt);
        $('#sfl').val(search_sfl);
        $('#sfl_txt').val(search_txt);
    });






    $('.live_btn').change(function() {

    var no = $(this).attr("data-val");

    if($(this).prop('checked')) {
        var val = 1;
    }else{
        var val = 0;
    }
    
    var param = "mode=questionChangeState&no="+no+"&val="+val;
    $.ajax({
            type : 'POST',
            url : "ajax/save.lib.php",
            data : param,
            success : function (data) {

            }
        });
    });



    $('.delete_cate').click(function () {

      if (getSelectVal("chk") == "") {
             alert("한 개 이상의 일반 상담을\n선택해주세요.");
            return false;
        }





        if(confirm("삭제한 상담은 더 이상 복구할 수 없습니다.\n삭제하시겠습니까?")) {
            $('#act').val("delete");
            $("#no").val(getSelectVal("chk"));
            $('#fsearch').submit();
        }
    });



    //일반상담
    $(".qa_cancle").click(function(){
        if(confirm("입력한 일반 상담 수정이 저장되지 않습니다. 취소하시겠습니까?")){
            $("#question_reg").modal('hide');
        }
    }); 
});


function changeItem(){
    document.fsearch.submit();
}

</script>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
  <li> <a href="#"> <i class="fa fa-home"></i> 큐봇관리자</a> </li>
  <li class="active">일반상담</li>
</ul>
 <div class="m-b-md">
 <h3 class="m-b-none" style='margin-bottom:5px;'>일반상담</h3>
 <small >일반 상담은 Q&A 형식으로 고객의 질문에 자동채팅시스템이 답변하는 방식입니다.</small></div>





<div style='max-width:100%;margin-bottom:60px;'>
  <div class="btn-group" role="group" style='float:left;'>
       
    <button type="button" class="btn btn-primary question_add_modal" >상담등록</button>
    <button type="button" class="btn btn-success csv_upload">엑셀파일로 업로드</button>
    <button type="button" class="btn btn-danger delete_cate">삭제</button>
    



  </div>
  <form id="fsearch" name="fsearch" class="local_sch01 local_sch" method="get">
    <input type="hidden" name="sfl" id="sfl" value="${sfl }">
    <input type="hidden" name="sfl_txt" id="sfl_txt" value="${sfl_txt }">
    <input type="hidden" name="mode" id="mode"  value="${mode }">
    <input type="hidden" name="page" id="page" value="1">
    <input type="hidden" name="part" id="part" value="${part }">

    <input type="hidden" name="act" id="act" value="${act }">
    <input type="hidden" name="no" id="no">


    <button type="button" class="btn btn-info reload_btn"  style='float:right;margin-left:3px;'>새로고침</button>
    <button type="button" class="btn btn-primary" style='float:right;margin-left:3px;' onclick="openAjaxSearch()">검색하기</button>

	<div class="input-group" style="float:right;width:350px;">
	<select name="cate_name" class="form-control cate_sel">
		<!-- option Values Add By Jquery -->
	</select>
		<div class="input-group-btn">
			<button type="button" class="btn btn-info select_search_txt" >전체</button>
			<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
			<span class="caret"></span>
			<span class="sr-only">Toggle Dropdown</span>
			</button>
		
			<ul class="dropdown-menu" role="menu">
				<li><a href="#" data-val="all" class="search_select">전체</a></li>
				<li class="divider"></li>
				<li><a href="#" data-val="id_name" class="search_select">관리자 아이디</a></li>
				<li><a href="#" data-val="ci_question" class="search_select">질문</a></li>
			</ul>
		</div>
		<input type="text" class="form-control btn-info" aria-label="Text input with segmented button dropdown" name="stx" id="stx" value="${stx }">
	</div>

</div>


<select name="sst" id="sst" class="form-control" style="float:right;width:150px;" onChange="changeItem()" >
    <option value="question_asc" >상담제목 오름차순</option>
    <option value="question_desc">상담제목 내림차순</option>

    <option value="regdate_asc" >등록일 오름차순</option>
    <option value="regdate_desc" >등록일 내림차순</option>


    <option value="state_asc" >활성화 오름차순</option>
    <option value="state_desc" >활성화 내림차순</option>
</select>


</form>

<div style="clear: both;margin-bottom:10px;"></div>



<script>
		//일반상담 Table Content
		
		//counselling_info result 확인 후 테이블로 돌림.
		
		
		//0. tr class="bg"
				
		//1. input checkbox
		
		//2. 관리자 아이디 id_name
		
		//3. 상담제목 ci_question 
		
		//4. 되묻기 q_disp_name
		
		//5. 유사질문 수 (select count(*) from question_info where fk_seq_num = seq_num)

		//6. 카테고리 명 select q_disp_name from cate_info where q_type = '".$engine['q_type']."' "
 		
 		//7. 등록일 (unixtime(regdate))
 		
 		//8. </tr>
 		
		//9.tbody로 붙이기 반복 후 </tbody>
</script>
<div class="panel panel-primary is_engine_table" style='max-width:100%;overflow:auto;'>
  <div class="panel-heading">
    <h3 class="panel-title" id="panel-title"><i class="fa fa-gear"></i><!-- 질문리스트 --><a class="anchorjs-link" href="#panel-title"><span class="anchorjs-icon"></span></a>
      <div style='margin-bottom:0px;padding:4px;font-size:1em;font-family:Nanum Gothic;float:right;margin-top:-5px;' id="status_clock"></div>
    </h3>
  </div>
  <div class="panel-body" style='padding:0px;position:relative;overflow:auto;'>
    <form method="post" action="<?=$_SERVER['REQUEST_URI']?>" id="modify_frm">
      <input type="hidden" name="no" id="modify_no" value="">
      <input type="hidden" name="mode" id="modify_mode" value="">
    </form>
    <form name="fboardlist" id="fboardlist" action="" onSubmit="return fboardlist_submit(this);" method="post">
      <input type="hidden" name="sst" value="<%-- <%=sst%> --%>">
      <input type="hidden" name="sod" value="<%-- <%=sod%> --%>">
      <input type="hidden" name="sfl" value="<%-- <%=sfl %> --%>">
      <input type="hidden" name="stx" value="<%-- <%=stx %> --%>">
      <input type="hidden" name="page" value="<%-- <%=page %> --%>">
      <div>
        <table  class="table table-striped">
          <thead>
            <tr>
              <th scope="col"><span style="width:20px;">
                <input type="checkbox" id="check_all" />
              </span></th> 
              <th scope="col">관리자 아이디</th>
              <th scope="col">상담제목</th>
              <th scope="col">되묻기</th>
              <th scope="col">유사질문 수</th>
              <th scope="col">카테고리</th>
              <th scope="col">등록일</th>
              <th scope="col">활성화</th>

            </tr>
          </thead>
	
          <tbody id="table-striped_tbody">
			<!-- table Content -->
		  </tbody>
        </table>
      </div>
      <div id='ajax_script2'></div>
    </form>
    <div style="text-align:center;margin-top:10px;margin-bottom:10px;" id='page_div'>
		<!-- page content -->
    </div>
  </div>
</div>
</div>

<!-- Modal -->
<div class="modal fade" id="question_reg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static">
  <div class="modal-dialog4">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" data-backdrop="static">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">질문 추가</h4>
      </div>
      <div class="modal-body" style='background-color:#FFF;'>
        <iframe src="" id="question_add" name="question_add" frameborder=0 scrolling=YES style='width:100%;'></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default qa_cancle">취소</button>
        <? if ($I_GRADE == "1") { ?>  
        <button type="button" class="btn btn-primary qa_save">저장</button>
        <? } ?>
      </div>
    </div>
  </div>
</div>







<!-- Modal -->
<div class="modal fade" id="csv_reg" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" data-backdrop="static"> 
  <div class="modal-dialog2">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true" data-backdrop="static">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">엑셀파일로 업로드</h4>

      </div>
      <div class="modal-body" style='background-color:#FFF;overflow-y:auto;'>
        <iframe src="" id="csv_add" name="csv_add" frameborder=0 scrolling=YES style='width:100%;height:200px;'></iframe>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default " data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary csv_save">저장</button>
      </div>
    </div>
  </div>
</div>