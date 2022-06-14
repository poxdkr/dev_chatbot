var params = { // url paramert data
	attr		: {},
	listSize	: 5,
	curPage		: 1,
	lastPage	: 0,
	context		: '',
	init		: function() {
		var pathArr = location.pathname.split('/');
		this.context = '/' + pathArr[1];
		
		var getParams = location.search;
		if(getParams.length < 1) {
			return;
		} else {
			getParams = getParams.replace('?', '');
			var tempUrl = getParams.split('&');
			for(var key in tempUrl) {
				var keyValue = tempUrl[key].split('=');
				this.attr[keyValue[0]] = keyValue[1];
			}
		}
	},
	get			: function(str) {
		if(this.attr[str] != undefined) {
			return this.attr[str];
		} else {
			return '';
		}
	},
	set			: function(param) {
		this.attr = param;
	},
	pageMove		: function(page) {
		var url = location.origin + this.context + '/' + page;
		
		if(page == '' || page == undefined) return location.origin + this.context;
		
		if(this.attr != undefined) {
			var data = this.attr;
			var temp = new Array();
			for(var key in data) {
				temp.push(key + '=' + data[key]);
			}
			if(temp.length > 0) url = url + '?' + temp.join('&');
			return url.replace(/\/\?/, '/');
		} else {
			return url;
		}
	},
	reset			: function() {
		this.attr = {};
	}
};

params.init();

// 로그인 프로세스
function loginProcess(id, pwd) {
	var jsonData = {
		'loginId'	: id,
		'loginPwd'	: pwd
	};
	
	$.post('loginProcess', jsonData, function(data, textStatus, request) {
		var msg = data['msg'];
    	if(msg == 'success') {
			params.reset();
			location.href = params.pageMove('questionSearch');
    	} else {
			return toastr['error']('', '아이디나 비밀번호가 일치하지 않습니다.');
    	}
	}, "json");
}

//로그아웃
function logout() {
	$.post('logout', function(data, textStatus, request) {
		var msg = data['msg'];
    	if(msg == 'success') {
			params.reset();
			location.href = params.pageMove('');
    	} else {
			return toastr['error']('', '로그아웃이 정상 처리 되지 않았습니다.');
    	}
	}, "json");
}

// 패스워드 체크
function chkPassword(val) {
	return /^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[`~!@#\\$%\\^&\\*\\(\\)\\-_=\\+])[0-9a-zA-Z`~!@#\\$%\\^&\\*\\(\\)\\-_=\\+]{8,12}$/.test(val);
}

// 파일 확장자 체크
function chkFileName(val, mode) {
	if(mode == 1) { // excel file
		return /.*\.(xls)|(xlsx)$/.test(val);
	} else if(mode == 2) { // finobot.out
		return /.*\.(out)$/.test(val);
	} else if(mode == 3) { // zip file
		return /.*\.(zip)$/.test(val);
	}
}

// input file 초기화
function initInputFile(name) {
	$('input[name=' + name + ']').replaceWith($('input[name=' + name + ']').clone(true));
}

// 페이징
function setPaging(count, page, size, totalCount) {
	params.curPage = page;
	params.listSize = size;
	params.lastPage = count;
	
	var qs = '<li id="first">'
			+'	<a href="#" aria-label="First Page">'
			+'		<span aria-hidden="true">&laquo;</span>'
			+'	</a>'
			+'</li>'
			+'<li id="prev">'
			+'	<a href="#" aria-label="Previous Page">'
			+'		<span aria-hidden="true">&lsaquo;</span>'
			+'	</a>'
			+'</li>';
	
	if(page % 10 == 0) {
		tempPage = page - 9;
	} else {
		tempPage = (Math.floor(Number(page) / 10) * 10) + 1; // 현재 페이지의 1의 자리 재거
	}
	tempTotalPage = Math.floor(Number(count) / 10) * 10; // 전체 페이지의 1의 자리 재거
	 
	for(var i = 0; i < 10; i++) {
		var pageNum = tempPage + i;
		if(pageNum > count) break;
		qs += '<li class="pageList" id="page' + pageNum + '"><a href="#" >' + pageNum + '</a></li>'
	}
	
	qs +='<li id="next">'
		+'	<a href="#" aria-label="Next Page">'
		+'		<span aria-hidden="true">&rsaquo;</span>'
		+'	</a>'
		+'</li>'
		+'<li id="end">'
		+'	<a href="#" aria-label="End Page">'
		+'		<span aria-hidden="true">&raquo;</span>'
		+'	</a>'
		+'</li>';
	
	$('ul.pagination').html('').append(qs);
	$('#listCnt').text('전체 : ' + totalCount + ' 건');

	var cPage = '#page' + page; // 현재 페이지 list id
	var listName = ['#first', '#end', '#prev', '#next', cPage]; // class selector 용 배열
	$(cPage).addClass('active'); // 현재 페이지 
	$('ul.pagination li').not(listName.join()).removeClass('active');
	
	if(count <= 10){ // 총 페이지 개수 10개 이하
		$('li#prev').addClass('disabled');
		$('li#next').addClass('disabled');
	} else { // 총 페이지 개수 11개 이상
		if(tempPage <= 10) { // 현재 리스트 1 ~ 10 개 사이
			$('li#prev').addClass('disabled');
			$('li#next').removeClass('disabled');
		} else if(count - page <= 10) { // 마지막 리스트
			$('li#prev').removeClass('disabled');
			$('li#next').addClass('disabled');
		} else {
			$('li#prev').removeClass('disabled');
			$('li#next').removeClass('disabled');
		}
	}
}

// 텍스트 금액으로 변경
function setComma(val) {
	var regex = /(\d+)(\d{3})/;
	var temp = val;
	while (regex.test(temp)) {
		temp = temp.replace(regex, '$1' + ',' + '$2');
	}
	return temp;
}

//시간단위 포맷 변환
function formatTime(i) {
	if(i < 10) i="0"+i;
	return i;
}

//날짜 포맷 변환
function formatDate(isodate, type) {
	var str = "";
	if(isodate != "") {

		var dateData = new Date(isodate);
		var year = dateData.getFullYear();
		var month = dateData.getMonth()+1;
		month = formatTime(month); 
		var date = dateData.getDate();
		date = formatTime(date);
		var hour = dateData.getHours();
		hour = formatTime(hour);
		var minute = dateData.getMinutes();
		minute = formatTime(minute);
		var second = dateData.getSeconds();
		second = formatTime(second);
		
		if(type == "data") str += year+month+date+hour+minute;
		else if(type == "view") str += year+"-"+month+"-"+date+" "+hour+":"+minute+":"+second;
	}
	
	return str;
}
	
$(function() {
	// 버튼 툴팁 이벤트
	$('[data-toggle="tooltip"], [data-toggle="modal"]').tooltip();
	
	// 페이지 번호 클릭 이벤트
	$('nav')
		.on('click', 'ul.pagination li.pageList', function() {
			var obj = $(this);
			if(obj.hasClass('disabled') || obj.hasClass('active')) return;
			
			var pageId = obj.prop('id');
			if(pageId.match('page') != null) {
				params.curPage = pageId.replace('page', '');
				listSearch();
			}
		})
		.on('click', 'ul.pagination li#first', function() {
			if(params.lastPage == 0) return;
			params.curPage = 1;
			listSearch();
		})
		.on('click', 'ul.pagination li#prev', function() {
			if($(this).hasClass('disabled')) return;
			
			if(params.curPage % 10 == 0) {
				params.curPage = (Math.floor(Number(params.curPage) / 10) - 1) * 10; // 현재 페이지의 1의 자리 재거
			} else {
				params.curPage = Math.floor(Number(params.curPage) / 10) * 10; // 현재 페이지의 1의 자리 재거
			}
			listSearch();
		})
		.on('click', 'ul.pagination li#next', function() {
			if($(this).hasClass('disabled')) return;
			
			if(params.curPage % 10 == 0) {
				params.curPage = (Math.floor(Number(params.curPage) / 10) * 10) + 1; // 현재 페이지의 1의 자리 재거
			} else {
				params.curPage = ((Math.floor(Number(params.curPage) / 10) + 1) * 10) + 1; // 현재 페이지의 1의 자리 재거
			}
			listSearch();
		})
		.on('click', 'ul.pagination li#end', function() {
			if(params.lastPage == 0) return;
			params.curPage = params.lastPage;
			listSearch();
		})
		.on('change', '#listSize', function() {
			if($('li.pageList').length < 1) return;
			
			params.curPage = 1;
			params.listSize = $(this).val();
			listSearch();
		});
});