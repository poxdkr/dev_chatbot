<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@include file="include/admin.head.none.jsp" %>

<%	//전달받은 no (comment_no) 확인 후 변수로 저장 
	String no = request.getParameter("no");
	if(no.equals("") || no==null){ //값이 빈칸이거나 없을 경우
		out.print("<scrpit>alert('제대로된 값이 넘어오지 않았습니다.');</script>");
	}
%>
	
<style>
.tbl_frm01 th {
	border-top: 0px solid #ececec;
	border-bottom: 0px solid #ececec;
	text-align: left;
}
.tbl_frm01 td {
	padding: 7px 3px;
	border-right: 0;
	border-left: 0;
	width: 80%;
}
tbody td {
	border: 0px;
}
.frm_input {
	height: 25px;
	padding-left: 2px;
	width: 140px;
}
</style>
<script>

//jquery Ready
$(function(){
	
	// << no를 comment_no로 조회하기 >>
	
	var no = $("#comment_no").val();
	
	//1.select * from customer_qa_comment where comment_no = no
	var comment_no="";
	var user_id="";
	var comment="";
	var adm_comment="";
	var q_type="";
	var state ="";
	var scn_code="";
	
	$.ajax({
		url:"getCommentByNo",
		data:"comment_no="+no,
		dataType:"json",
		contentType:"application/json",
		async : false,
		success : function(data){
			comment_no = data.comment_no;
			user_id = data.user_id;
			comment = data.comment;
			$("#comment").html(comment);
			adm_comment = data.adm_comment;
			$("#adm_comment").html(adm_comment);
			q_type = data.q_type;
			state = data.state;
			scn_code = data.scn_code;
			
		}, error : function(data){
			console.log(data);
		}
	});
	
	//2. select q_disp_name from cate_info where q_type = '$q_type'
	var q_disp_name ="";
	$.ajax({
		url:"get_q_disp_name_By_Q_type",
		data:"q_type="+q_type,
		dataType:"json",
		contentType:"application/json",
		async : false,
		success : function(data){
			q_disp_name = data.q_disp_name;
			$("#q_disp_name").html(q_disp_name);
		}, error : function(data){
			console.log(data);
			//null값일 경우 처리로직
		}
	});
	
	//3.select * from customer_info where user_id = '$user_id'
	var mobile ="";
	var name ="";
	var company_name ="";
	var last_regdate ="";
	
	$.ajax({
		url:"getUser_By_user_id",
		data:"user_id="+user_id,
		dataType:"json",
		contentType:"application/json",
		async : false,
		success : function(data){
			mobile = data.mobile;
			name = data.name;
			$("#name").html(name);
			company_name = data.company_name;
			$("#company_name").html(company_name);
			last_regdate = data.last_regdate;
			$("#last_regdate").html(last_regdate);
		}, error : function(data){
			console.log(data);
			//null값일 경우 처리로직
		}
	});
	
	//4. select sname from scenario_main_info where scn_code = '$scn_code'
	var sname       ="";
	$.ajax({
		url:"getScene_By_scn_code",
		data:"scn_code="+scn_code,
		dataType:"json",
		contentType:"application/json",
		async : false,
		success : function(data){
			sname = data.sname;
			$("#sname").html(sname);
		}, error : function(data){
			console.log(data);
			//null값일 경우 처리로직
		}
	});
	
	$("#state").val(state).attr("selected","selected");
	var state_name = "";
	
	if(state == 0){
		state_name = "처리중";
	}else if( state = 1){
		state_name = "담당자 이관";
	}else{
		state_name = "상태 알 수 없음";
	}
		
}); //jquery End

</script>


</head>



<div class="panel-body" style='padding:0px;position:relative;'>
  <form  name="myform" id="myform"   method="post" onsubmit="return form_submit(this);">
    <input type="hidden" name="comment_no" id="comment_no" value="<%=no%>">




    <section id="anc_bo_point">
      <div class="tbl_frm01">


        <table width="100%" class="table">
          <tbody>
    

            <tr>
              <th scope="row"><label for="time_type">시나리오 제목</label></th>
              <td id="sname">sname</td>
            </tr>


            <tr>
              <th scope="row"><label for="time_type">구분</label></th>
              <td id="q_disp_name">q_disp_name</td>
            </tr>

            <tr>
              <th scope="row"><label for="time_type">고객명</label></th>
              <td id="name">name</td>
            </tr>

            <tr>
              <th scope="row"><label for="time_type">상태</label></th>
              <td>
                <select name="state" id="state" style="border-width: 1px;width:150px" class="form-control">
                    <option value="0">진행중</option>
                    <option value="1">처리완료</option>

                </select>

              
              </td>
            </tr>




            <tr>
              <th scope="row"><label for="time_type">회사</label></th>
              <td id="company_name">company_name</td>
            </tr>



            <tr>
              <th scope="row"><label for="time_type">최근상담일자</label></th>
              <td id="last_regdate">last_regdate</td>
            </tr>


            <tr>
              <th scope="row"><label for="time_type">문의내용</label></th>
              <td><textarea name="comment" id="comment" rows="5" cols="100"></textarea></td>

            </tr>



            <tr>
              <th scope="row"><label for="time_type">관리자 메모</label></th>
              <td>
              
              <textarea name="adm_comment" id="adm_comment" rows="5" cols="100"></textarea></td>

            </tr>
                    
          </tbody>
        </table>


      </div>
    </section>
  </form>
</div>



<script>
function form_submit(f){
    document.myform.action = "./content.qa.comment.ok.php";
    document.myform.submit();
    return false;

}

</script>










<?php
include_once('./include/admin.tail.none.php');
?> 