<%@page import="com.wowcomm.dev_chatbot.VO.G5_member_VO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
String mb_Id = (String)session.getAttribute("mb_Id");
if(mb_Id != null){
	out.println("<script>location.href='index?mode=dashboard';</script>");
}
%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="Login, registration forms">
<title>큐봇관리자</title>

<!-- Stylesheets -->
<link href="/resource/login_css/bootstrap.css" rel="stylesheet">
<link href="/resource/login_css/animation.css" rel="stylesheet">
<link href="/resource/login_css/authenty.css" rel="stylesheet">
<style>
.login-error{
	text-align : center;
	font-weight : bold;
	margin : 10px auto;
	background-color: #dc3545;
	color : white;
	padding : 15px 0;
}
</style>
<!-- Font Awesome CDN -->
<link href="/resource/admin_css/font-awesome.css" rel="stylesheet">

<script src="/resource/login_js/jquery-1.10.1.min.js"></script>

<script src="/resource/login_js/jquery-ui.min.js"></script>
<script src="/resource/login_js/bootstrap.min.js"></script>
<script src="/resource/login_js/jquery.icheck.min.js"></script>
<script src="/resource/login_js/waypoints.min.js"></script>


<!-- authenty js -->
<script src="/resource/login_js/authenty.js"></script>

<!-- preview scripts -->
<script src="/resource/login_js/jquery.malihu.PageScroll2id.js"></script>
<script src="/resource/login_js/jquery.address-1.6.min.js"></script>
<script src="/resource/login_js/scrollTo.min.js"></script>
<script src="/resource/login_js/init.js"></script>

<script type="text/javascript">

    jQuery(document).ready(function($) {

        var win_password_lost = function(href) {
            window.open(href, "win_password_lost", "left=50, top=50, width=617, height=330, scrollbars=1");
        }


        $("#login_password_lost, #ol_password_lost").click(function(){
            win_password_lost(this.href);
            return false;
        });
	

    });

</script>
</head>
<body style="zoom: 1;overflow:hidden;">
<form  action="/loginProc" method="post">
    <input type=hidden name='auto_login' value='Y'>
    <section id="authenty_preview" >
        <section id="signin_main" class="authenty signin-main" style="height: 10000px;">
            <div class="section-content">
                <div class="wrap">
                    <div class="container">
                        <div class="form-wrap">
                            <div class="row">
                                <div class="title animated fadeInDown" data-animation="fadeInDown" data-animation-delay=".8s" style="-webkit-animation-delay: 0.8s; animation-delay: 0.8s;">
                                    <h1>큐봇관리자 </h1>
                                    <h5>큐봇관리자 관리자 입니다.</h5>
                                </div>
                                <div id="form_1" data-animation="bounceIn" class="animated bounceIn">
                                    <div class="form-header">
                                        <i class="fa fa-user"></i>
                                    </div>
                                    <c:if test="${error != null }">
                                     <p class="login-error">${error }</p>
                                    </c:if>
                                    <div class="form-main">
                                        <div class="form-group">
                                            <input type="text" name="mb_id" class="form-control" placeholder="사용자ID" required="required">
                                            <input type="password" name="mb_password" class="form-control" placeholder="패스워드" required="required">
                                        </div>
                                        <button id="signIn_1" type="submit" class="btn btn-block signin">로그인</button>
                                    </div>
                                </div>
                                
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</section>

</form>



</body>

</html>