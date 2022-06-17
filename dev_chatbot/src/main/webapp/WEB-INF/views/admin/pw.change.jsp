<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<script type="text/javascript">
	$(document).ready(function() {
		$('.content_main').addClass("active");
	});
</script>

<ul class="breadcrumb no-border no-radius b-b b-light pull-in">
	<li>
		<a href="#">
			<i class="fa fa-home"></i>
		큐봇관리자</a>
	</li>
	<li class="active">비밀번호 변경</li>
</ul>

 
<style>
	.input-group:first-child{margin-bottom:10px;}
	.input-group { width:100%;}
	 div{line-height:21px;}
	.panel {max-width:100%;}
</style>

<script type="text/javascript">
	$(document).ready(function () {

		$(".save").click(function(){
			
			var mb_homepage = $('.mb_homepage').val();
			var mb_profile = $('.logo').val();
			var pw1 = $('.mb_pass').val();
			var pw2 = $('.mb_pass2').val();
			
			if (pw1 == "" || pw2 == ""){
				alert("pw == null");
				return;
			}
			
			if (pw1 != pw2) {
				alert("비밀번호가 같지 않습니다.\n확인해주세요.");	
				return;
			}
			

			var param="pw1="+pw1+"&pw2="+pw2;	
			
			var answer = confirm("비밀번호를 변경하시겠습니까?");
				if(answer){
				$.ajax({
					url : "password_change",
					type : 'POST',
					data : param,
					success : function (data) {
						if(data == 1){
							alert("정보가 변경되었습니다.");
							location.reload();
						}else{
							alert("정보 변경에 실패하였습니다.");
						}
					},error : function(data){
						console.log(data);								
					}
				});
				}
		});
		
		
		
/*		프로필 사진 업로드 ----> 더이상 사용하지 않음
  
 		$(".logo").click(function(){
			$("#mb_profile").trigger("click");
		});
		
		$("#mb_profile").change(function(){
			if ($("#mb_profile").val() != ""){
				var formData = new FormData();
				formData.append("mb_profile",$("input[name=mb_profile]")[0].files[0]);
				$.ajax({   
					url: "./ajax/ajax.profile.upload.php", 
					type : "post",
					data : formData,
					processData: false,
					contentType: false,
					datatype : "html",
					timeout : 10000,  
					error:function(request,status,error){
						alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
					},
					success : function(getData){
						$(".logo").val(getData);
						$(".img_logo").attr("src","/data/profile/" + getData);
					}
				});
			}
			$(".logo").val(($(this).val().replace("C:\\fakepath\\","")));
		}); */
		
	});
</script>

<div>
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title" id="panel-title"><i class="fa fa-gear"></i> 비밀번호 변경

			<a class="anchorjs-link" href="#panel-title"><span class="anchorjs-icon"></span></a></h3>
			</div>
			<div class="panel-body" style="overflow:auto;">

				<div class="input-group">
					<input type="password" class="form-control mb_pass" placeholder="변경할비밀번호" aria-describedby="sizing-addon2" value="">
				</div>

				<div class="input-group">
					<input type="password" class="form-control mb_pass2" placeholder="변경할비밀번호(확인)" aria-describedby="sizing-addon2" value="">
				</div>

				<div class="msg_area" style='float:left;margin-top:30px;'>
				</div>
				<button type="button" class="btn btn-danger save" style='float:right; margin-top:20px;' id="save">변경하기</button>
			</div>
		</div>
</div>


	<aside class="bg-light lter b-l aside-md hide" id="notes">
		<div class="wrapper">알림</div>
	</aside>