
var iTagButton = MediumEditor.Extension.extend({
	name: 'IN' ,
	init: function () {
		this.button = this.document.createElement('button');
		this.button.classList.add('medium-editor-action');
		this.button.innerHTML = '<b>IN</b>';
		
		this.on(this.button, 'click', this.handleClick.bind(this));

	} ,
	isDisplayed: function () {
		return MediumEditor.extensions.form.prototype.isDisplayed.apply(this);
	} ,
	hideToolbar: function () {
		if (this.isDisplayed()) {
			this.getToolbarElement().classList.remove('medium-editor-toolbar-active');
			this.trigger('hideToolbar', {}, this.base.getFocusedElement());
		}
	} ,
	getButton: function () {
		return this.button;
	} ,
	handleClick: function (event) {
		// custom value
		var obj = this.base;								// medium editor 객체
        var eleId = obj.origElements;						// 텍스트 에디터가 있는 element의 id
        var posi = obj.exportSelection();					// 블럭 영역의 시작위지와 종료 위치를 가져옴
        var gHtm = obj.getContent();						// 태그가 포함된 텍스트
        var gTxt = obj.getFocusedElement().textContent;		// 태그가 없는 텍스트
        var sTxt = gTxt.substring(posi.start, posi.end);	// 블럭영역의 텍스트
        var sTxtLen = sTxt.length;							// sTxt 길이
        var rTxt = tags[sTxt];								// 텍스트의 태그값
        var beforeArr = new Array();						// html 편집용 배열
        var cTxtPosi = 0;									// getText substring용 위치값 변수 
        var cHtmPosi = 0;									// getHtml substring용 위치값 변수
        var stPosi = posi.start;							// substirng을 위해 블럭영역의 시작위치를 세팅
        var tagName = 'itag';
        
        if(sTxtLen == 0) return;
        eval('var mArr = gTxt.match(/' + sTxt + '/gim);');	// 배열에 searchText가 몇개나 있는지 저장
        
        if(rTxt != undefined) { // tags에 코드가 없다면 toast message 출력
        	var setText = createImage(sTxt, rTxt, tagName); // 텍스트 이미지 변환
        	
        	for(var i = 0; i < mArr.length; i++) { // sTxt의 개수만큼 반복
        		// substring을 위한 위치값 세팅
        		cTxtPosi = gTxt.indexOf(sTxt);
        		cHtmPosi = gHtm.indexOf(sTxt);
        		
            	if(cTxtPosi == stPosi) { // 텍스트 변환할 위치가 맞을 경우
            		//eval('gHtm = gHtm.replace(\/' + sTxt + '\/, "&lt;itag&gt;' + rTxt + '&lt;/itag&gt;");'); // 태그값으로 변환
            		eval('gHtm = gHtm.replace(\/' + sTxt + '\/, \'' + setText + '\');'); // 태그값으로 변환
            		var sHtm = beforeArr.join('') + gHtm; // 변환된 텍스트 합침
            		obj.setContent(sHtm); // 변환 후 텍스트 세팅
            		break;
            	} else { // 텍스트 변환할 위치가 틀릴 경우
            		var tTxt = gHtm.substring(0, cHtmPosi + sTxtLen);		// 틀린위치까지 substring 한 텍스트
            		gTxt = gTxt.substring(cTxtPosi + sTxtLen, gTxt.length);	// getText 자르기
            		gHtm = gHtm.substring(cHtmPosi + sTxtLen, gHtm.length);	// getHtml 자르기
            		beforeArr.push(tTxt);									// 배열에 틀린 위치까지 텍스트 저장
            		stPosi -= cTxtPosi + sTxtLen;							// 블럭영역 시작위치 변경
            	}
            }
		} else {
			toastr['info']('', sTxt + ' 태그가 존재하지 않습니다.<br>태그 등록 후 사용해 주십시오.');
		}
        this.hideToolbar();
	}
});

var oTagButton = MediumEditor.Extension.extend({
	name: 'OUT' ,
	init: function () {
		this.button = this.document.createElement('button');
		this.button.classList.add('medium-editor-action');
		this.button.innerHTML = '<b>OUT</b>';
		
		this.on(this.button, 'click', this.handleClick.bind(this));

	} ,
	getButton: function () {
		return this.button;
	} ,
	handleClick: function (event) {
		// custom value
		var obj = this.base;								// medium editor 객체
        var eleId = obj.origElements;						// 텍스트 에디터가 있는 element의 id
        var posi = obj.exportSelection();					// 블럭 영역의 시작위지와 종료 위치를 가져옴
        var gHtm = obj.getContent();						// 태그가 포함된 텍스트
        var gTxt = obj.getFocusedElement().textContent;		// 태그가 없는 텍스트
        var sTxt = gTxt.substring(posi.start, posi.end);	// 블럭영역의 텍스트
        var sTxtLen = sTxt.length;							// sTxt 길이
        var rTxt = tags[sTxt];								// 텍스트의 태그값
        var beforeArr = new Array();						// html 편집용 배열
        var cTxtPosi = 0;									// getText substring용 위치값 변수 
        var cHtmPosi = 0;									// getHtml substring용 위치값 변수
        var stPosi = posi.start;							// substirng을 위해 블럭영역의 시작위치를 세팅
        var tagName = 'otag';
        
        if(sTxtLen == 0) return;
        eval('var mArr = gTxt.match(/' + sTxt + '/gim);');	// 배열에 searchText가 몇개나 있는지 저장
        
        if(rTxt != undefined) { // tags에 코드가 없다면 toast message 출력
        	var setText = createImage(sTxt, rTxt, tagName); // 텍스트 이미지 변환
        	
        	for(var i = 0; i < mArr.length; i++) { // sTxt의 개수만큼 반복
        		// substring을 위한 위치값 세팅
        		cTxtPosi = gTxt.indexOf(sTxt);
        		cHtmPosi = gHtm.indexOf(sTxt);
        		
            	if(cTxtPosi == stPosi) { // 텍스트 변환할 위치가 맞을 경우
//            		eval('gHtm = gHtm.replace(\/' + sTxt + '\/, "&lt;otag&gt;' + rTxt + '&lt;/otag&gt;");'); // 태그값으로 변환
            		eval('gHtm = gHtm.replace(\/' + sTxt + '\/, \'' + setText + '\');'); // 태그값으로 변환
            		var sHtm = beforeArr.join('') + gHtm; // 변환된 텍스트 합침
            		obj.setContent(sHtm); // 변환 후 텍스트 세팅
            		break;
            	} else { // 텍스트 변환할 위치가 틀릴 경우
            		var tTxt = gHtm.substring(0, cHtmPosi + sTxtLen);		// 틀린위치까지 substring 한 텍스트
            		gTxt = gTxt.substring(cTxtPosi + sTxtLen, gTxt.length);	// getText 자르기
            		gHtm = gHtm.substring(cHtmPosi + sTxtLen, gHtm.length);	// getHtml 자르기
            		beforeArr.push(tTxt);									// 배열에 틀린 위치까지 텍스트 저장
            		stPosi -= cTxtPosi + sTxtLen;							// 블럭영역 시작위치 변경
            	}
            }
		} else {
			toastr['info']('', sTxt + ' 태그가 존재하지 않습니다.<br>태그 등록 후 사용해 주십시오.');
		}
	}
});

var etcTagButton = MediumEditor.Extension.extend({
	name: 'ETC' ,
	init: function () {
		this.button = this.document.createElement('button');
		this.button.classList.add('medium-editor-action');
		this.button.innerHTML = '<b>ETC</b>';
		
		this.on(this.button, 'click', this.handleClick.bind(this));

	} ,
	getButton: function () {
		return this.button;
	} ,
	handleClick: function (event) {
		// custom value
		var obj = this.base;								// medium editor 객체
        var eleId = obj.origElements;						// 텍스트 에디터가 있는 element의 id
        var posi = obj.exportSelection();					// 블럭 영역의 시작위지와 종료 위치를 가져옴
        var gHtm = obj.getContent();						// 태그가 포함된 텍스트
        var gTxt = obj.getFocusedElement().textContent;		// 태그가 없는 텍스트
        var sTxt = gTxt.substring(posi.start, posi.end);	// 블럭영역의 텍스트
        var sTxtLen = sTxt.length;							// sTxt 길이
        var rTxt = etcTags[sTxt];							// 텍스트의 태그값
        var beforeArr = new Array();						// html 편집용 배열
        var cTxtPosi = 0;									// getText substring용 위치값 변수 
        var cHtmPosi = 0;									// getHtml substring용 위치값 변수
        var stPosi = posi.start;							// substirng을 위해 블럭영역의 시작위치를 세팅
        var tagName = 'etag';
        
        if(sTxtLen == 0) return;
        eval('var mArr = gTxt.match(/' + sTxt + '/gim);');	// 배열에 searchText가 몇개나 있는지 저장
        
        if(rTxt != undefined) { // tags에 코드가 없다면 toast message 출력
        	var setText = createImage(sTxt, rTxt, tagName); // 텍스트 이미지 변환
        	
        	for(var i = 0; i < mArr.length; i++) { // sTxt의 개수만큼 반복
        		// substring을 위한 위치값 세팅
        		cTxtPosi = gTxt.indexOf(sTxt);
        		cHtmPosi = gHtm.indexOf(sTxt);
        		
            	if(cTxtPosi == stPosi) { // 텍스트 변환할 위치가 맞을 경우
//            		eval('gHtm = gHtm.replace(\/' + sTxt + '\/, "&lt;etag&gt;' + rTxt + '&lt;/etag&gt;");'); // 태그값으로 변환
            		eval('gHtm = gHtm.replace(\/' + sTxt + '\/, \'' + setText + '\');'); // 태그값으로 변환
            		var sHtm = beforeArr.join('') + gHtm; // 변환된 텍스트 합침
            		obj.setContent(sHtm); // 변환 후 텍스트 세팅
            		break;
            	} else { // 텍스트 변환할 위치가 틀릴 경우
            		var tTxt = gHtm.substring(0, cHtmPosi + sTxtLen);		// 틀린위치까지 substring 한 텍스트
            		gTxt = gTxt.substring(cTxtPosi + sTxtLen, gTxt.length);	// getText 자르기
            		gHtm = gHtm.substring(cHtmPosi + sTxtLen, gHtm.length);	// getHtml 자르기
            		beforeArr.push(tTxt);									// 배열에 틀린 위치까지 텍스트 저장
            		stPosi -= cTxtPosi + sTxtLen;							// 블럭영역 시작위치 변경
            	}
            }
		} else {
			toastr['info']('', sTxt + ' 태그가 존재하지 않습니다.<br>태그 등록 후 사용해 주십시오.');
		}
	}
});

function createImage(sTxt, rTxt, tagName) {
	var canvas = $('#tagCanvas')[0];
	var tempImage = new Image();
	canvas.width = sTxt.length * 16;
	var context = canvas.getContext('2d');
	context.fillStyle = '#ffffff';
	
	if(tagName == 'itag') {
		tempImage.style.background = '#337ab7';
		tempImage.title = 'IN';
	} else if(tagName == 'otag') {
		tempImage.style.background = '#5cb85c';
		tempImage.title = 'OUT';
	} else if(tagName == 'etag') {
		tempImage.style.background = '#f0ad4e';
		tempImage.title = 'ETC';
	}
	
	context.font = 'bold 12px arial';
	context.fillText(sTxt, 3, 16);
	
	tempImage.src = canvas.toDataURL();
	tempImage.name = tagName + '_' + rTxt;
	tempImage.style.margin = '0px 3px 0px 3px';
	
	return tempImage.outerHTML;
}