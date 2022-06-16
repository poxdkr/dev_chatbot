<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- nav -->

  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">

		<li class="treeview dashboard">
			<a href="#">
				<i class="fa fa-dashboard"><b class="bg-info"></b></i>
				<span>통계관리</span>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
			</a>
			<ul class="treeview-menu" >

				<li class="dash">
					<a href="?mode=dashboard">
						<i class="fa fa-angle-right"></i>
						<span>대시보드</span>
					</a>
				</li>

				<li class="statistics1">
					<a href="?mode=statistics1">
						<i class="fa fa-angle-right"></i>
						<span>상담 통계</span>
					</a>
				</li>


				<li class="statistics2">
					<a href="?mode=statistics2">
						<i class="fa fa-angle-right"></i>
						<span>신규고객 유입 현황</span>
					</a>
				</li>


				<li class="statistics3">
					<a href="?mode=statistics3">
						<i class="fa fa-angle-right"></i>
						<span>모든 챗봇 상담현황</span>
					</a>
				</li>

			</ul>
		</li>

		<li class="treeview  noanswer">
			<a href="#">
				<i class="fa fa-pie-chart"><b class="bg-info"></b></i>
				<span>챗봇 상담로그관리</span>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
			</a>


			<ul class="treeview-menu" >
				<li class="alllog">
					<a href="?mode=content.total.log">
						<i class="fa fa-angle-right"><b class="bg-info"></b></i>
						<span>챗봇 로그 현황</span>
					</a>
				</li>
			</ul>
		</li>
		
		<li class="treeview member_list">
			<a href="#">
				<i class="fa fa-gears icon">
					<b class="bg-danger">
					</b>
				</i>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
				<span>관리자 권한 관리</span>
			</a>
			<ul class="treeview-menu" >

				<li>
					<a href="?mode=content.member">
						<i class="fa fa-angle-right"></i>
						<span>담당자 등록 관리</span>
					</a>
				</li>

			</ul>
		</li>
		

		<li class="treeview  chatbot">
			<a href="#">
				<i class="fa fa-laptop"><b class="bg-info"></b></i>
				<span>챗봇관리</span>
                <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
                </span>
			</a>
			<ul class="treeview-menu" >

                <li class=" domain">
                    <a href="?mode=content.domain" >
                        
						<i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>도메인 관리</span>
                    </a>
                </li>

                <li class=" cate">
                    <a href="?mode=content.question.cate">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>카테고리 관리</span>
                    </a>
                </li>

                <li class=" default">
                    <a href="?mode=content.question.list">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>일반상담</span>
                    </a>
                </li>

                <li class=" scenario">

                    <a href="?mode=content.scenario.list">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>시나리오 상담</span>
                    </a>

                </li>

                <li class=" template_cate">
                    <a href="?mode=chatbot.template.cate">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>간편 챗봇교육-템플릿</span>
                    </a>
                </li>

                <li class=" keyword">
                    <a href="?mode=content.keyword.list">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>키워드관리</span>
                    </a>
                </li>


                <li class=" monitoring">
                    <a href="?mode=content.monitoring">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>모니터링</span>
                    </a>
                </li>
 

                <li class="learning">
                    <a href="?mode=content.learning.list">
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>미답변</span>
                    </a>
                </li>
			</ul>
		</li>

		<li class="treeview customer">
			<a href="#">
				<i class="fa fa-dashboard"><b class="bg-info"></b></i>
		
			<span>고객관리</span>
                <span class="pull-right-container"><i class="fa fa-angle-left pull-right"></i></span>
			</a>
			
			  <ul class="treeview-menu" >
                <li class="customer_info">
                    <a href="?mode=content.customer" >
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>고객 현황</span>
                    </a>
                </li>

                <li class="customer_qa">
                    <a href="?mode=content.qa" >
                        <i class="fa fa-angle-right"><b class="bg-info"></b></i>
                        <span>고객 문의현황</span>
                    </a>
                </li>

			</ul>
		</li>
        
		<li class="pds">
			<a href="?mode=content.pds" >
				<i class="fa fa-bullhorn"><b class="bg-info"></b></i>
				<span>자료실</span>
			</a>
		</li>

		<li class="content_main">
			<a href="?mode=pw.change">
				<i class="fa fa-angle-right"><b class="bg-info"></b></i>
				<span>비밀번호변경</span>
			</a>
		</li>


		<li class="content_main">
			<a href="/logout">
				<i class="fa fa-angle-right"><b class="bg-info"></b></i>
				<span>로그아웃</span>
			</a>
		</li>



	</ul>
	
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>



