<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko" class="app js no-touch no-android chrome no-firefox no-iemobile no-ie no-ie10 no-ie11 no-ios no-ios7 ipad">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Q-BOT</title>

<%@ include file = "./admin.head.common.jsp" %> 

</head>
<body class="hold-transition skin-blue sidebar-mini">
<script>
    $(document).ready(function() {
    	//초기 sideBar width에 따른 content_container의 margin left설정
    	var main_sidebar_width = $(".main-sidebar").css("width");
    	var sideBar_switch = false;
    	main_sidebar_width = main_sidebar_width.substr(0,main_sidebar_width.length-2);
    	console.log("ready_main_sidebar_width : "+ main_sidebar_width);
    	main_sidebar_width = parseInt(main_sidebar_width);
    	$("#content_container").css("margin-left",main_sidebar_width);
    	
    	//reload_btn 새로고침 설정
        $('.reload_btn').click(function(){
            location.reload();
        });
        
    	//.dropdown-toggle 클래스 dropdown 활성화
        $(".dropdown-toggle").dropdown();
        
        //메인화면에 mode에 따라 페이지 load (mode)
        var contentMode = $("#mode").val();
        console.log("contentMode : " + contentMode);
        $("#content_container").load(contentMode);
        
        //sideBar_toggle_click_function
        $(".sidebar-toggle").click(function(){
        	if(!sideBar_switch){
	        	main_sidebar_width -= 180; 
	        	console.log("main_sidebar_width : "+ main_sidebar_width);
	        	$("#content_container").css("margin-left",main_sidebar_width);
	        	$("#content_container").css("transition","0.3s");
	        	sideBar_switch = true;
        	}else{
        		main_sidebar_width += 180; 
	        	console.log("main_sidebar_width : "+ main_sidebar_width);
	        	$("#content_container").css("margin-left",main_sidebar_width);
	        	sideBar_switch = false;
        	}
        });
    });
</script>
	<div class="wrapper">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a href="/" class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>큐</b>봇</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>큐봇</b>관리자</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      <!-- Navbar Right Menu -->
      <div class="navbar-custom-menu">
        <ul class="nav navbar-nav">
          <!-- User Account Menu -->
          <li class="dropdown user user-menu ">
            <!-- Menu Toggle Button -->
            <a href="#" class="dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
            	<img src="resource/data/profile/logo.jpg" class="user-image" alt="User Image">
              <!-- hidden-xs hides the username on small devices so only the image appears. -->
              <span class="hidden-xs">
              <c:if test="${mb_profile == '[ROLE_ADMIN]' }">
              	관리자	
              </c:if>
              <c:if test="${mb_profile != '[ROLE_ADMIN]' }">
			  	${mb_Id }	
              </c:if>
              </span>
            </a>
            <ul class="dropdown-menu">
              <!-- Menu Footer-->
              <li class="user-footer">
                <div class="pull-left">
                  <a href="?mode=pw.change" class="btn btn-default btn-flat">정보변경</a>
                </div>
                <div class="pull-right">
                  <a href="/logout" class="btn btn-default btn-flat">로그아웃</a>
                </div>
              </li>
            </ul>
          </li>
          <!-- Control Sidebar Toggle Button -->
          <li>
            <a href="#" data-toggle="control-sidebar"><i class="fa fa-gears"></i></a>
          </li>
        </ul>
      </div>
    </nav>
  <input type=hidden name="mode" id="mode" value="<%=mode %>">
  </header>
  
  <%@ include file =  "./admin.menu.jsp" %>
  <div id="content_container" style="background-color: ghostwhite; padding: 20px 20px;">
  	<!-- mode에 따라 load됨  -->
  </div>






