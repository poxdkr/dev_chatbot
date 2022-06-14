// HTML ELEMENT 객체 생성 -----------------------------------------------------------------------
var cellWidth = 160;	// element width
var cellHeight = 110;	// element height
var scaleValue = 1;

joint.shapes.html = {};
joint.shapes.html.Element = joint.shapes.basic.Rect.extend({
    defaults: joint.util.deepSupplement({
        type: 'html.Element',
        attrs: {
            rect: { stroke: 'none', 'fill-opacity': 0 }
        }
    }, joint.shapes.basic.Rect.prototype.defaults)
});

joint.shapes.html.ElementView = joint.dia.ElementView.extend({

    template: [ // TEMPLATE 생성
        '<div class="html-element">',
        '	<div class="text-left">',
        '		<span class="label label-default">객관식</span>',
        '		<span class="label label-success" style="display:none;">주관식</span>',
        '		<span class="label label-info" style="display:none;">API</span>',
        '		<button type="button" method="update" class="btn btn-default btn-xs col-xs-offset-3" data-toggle="modal" data-target="#dialog-form">',
        '			<i class="glyphicon glyphicon-pencil"></i>',
        '		</button> ',
        '		<button type="button" method="delete" class="btn btn-default btn-xs">',
        '			<i class="glyphicon glyphicon-trash"></i>',
        '		</button>',
        '	</div><br/>',
        '',
        '	<div class="viewTitle" name="viewTitle"></div>',
        '	<div class="viewText" name="viewText"></div>',
        '',
        '   <input name="qustId1" type="hidden" value="" />',
        '   <input name="qustId2" type="hidden" value="" />',
        '   <input name="qustId3" type="hidden" value="" />',
        '   <input name="qustType" type="hidden" value="" />',
        '   <input name="ansTxt" type="hidden" value="" />',
        '   <input name="qustTxt" type="hidden" value="" />',
        '   <input name="external" type="hidden" value="" />',
        '   <input name="eleId" type="hidden" value="" />',
        '   <input name="cal" type="hidden" value="N" />',
        '   <input name="parentId" type="hidden" value="" />',



        '   <input name="disp_link1" type="hidden" value="" />',
        '   <input name="disp_link2" type="hidden" value="" />',
        '   <input name="disp_link3" type="hidden" value="" />',
        '   <input name="disp_link4" type="hidden" value="" />',
        '   <input name="disp_link5" type="hidden" value="" />',


        '   <input name="link1" type="hidden" value="" />',
        '   <input name="link2" type="hidden" value="" />',
        '   <input name="link3" type="hidden" value="" />',
        '   <input name="link4" type="hidden" value="" />',
        '   <input name="link5" type="hidden" value="" />',


        '   <input name="img_file1" type="hidden" value="" />',
        '   <input name="img_file2" type="hidden" value="" />',




        '   <input name="talkText_check" type="hidden" value="" />',
        '   <input name="alias" type="hidden" value="" />',


        '</div>'
    ].join(''),

    initialize: function() {
        _.bindAll(this, 'updateBox');
        joint.dia.ElementView.prototype.initialize.apply(this, arguments);

        // 객체 생성시 데이터 세팅
        this.$box = $(_.template(this.template)());
        this.$box.find('input[name=eleId]').val(this.model.id);
        this.$box.find('input[name=qustId1]').val(this.model.get('qustId1'));
        this.$box.find('input[name=qustId2]').val(this.model.get('qustId2'));
        this.$box.find('input[name=qustId3]').val(this.model.get('qustId3'));
        this.$box.find('input[name=qustType]').val(this.model.get('qustType'));
        this.$box.find('input[name=ansTxt]').val(this.model.get('ansTxt'));
        this.$box.find('input[name=qustTxt]').val(this.model.get('qustTxt'));
        this.$box.find('input[name=external]').val(this.model.get('external'));
        this.$box.find('input[name=cal]').val(this.model.get('cal'));
        this.$box.find('input[name=parentId]').val(this.model.get('parentId'));


        this.$box.find('input[name=disp_link1]').val(this.model.get('disp_link1'));
        this.$box.find('input[name=disp_link2]').val(this.model.get('disp_link2'));
        this.$box.find('input[name=disp_link3]').val(this.model.get('disp_link3'));
        this.$box.find('input[name=disp_link4]').val(this.model.get('disp_link4'));
        this.$box.find('input[name=disp_link5]').val(this.model.get('disp_link5'));


        this.$box.find('input[name=link1]').val(this.model.get('link1'));
        this.$box.find('input[name=link2]').val(this.model.get('link2'));
        this.$box.find('input[name=link3]').val(this.model.get('link3'));
        this.$box.find('input[name=link4]').val(this.model.get('link4'));
        this.$box.find('input[name=link5]').val(this.model.get('link5'));


        this.$box.find('input[name=img_file1]').val(this.model.get('img_file1'));
        this.$box.find('input[name=img_file2]').val(this.model.get('img_file2'));






        this.$box.find('input[name=talkText_check]').val(this.model.get('talkText_check'));
        this.$box.find('input[name=alias]').val(this.model.get('alias'));


        var viewTitle = '';
        this.model.get('ansTxt') != undefined ? viewTitle = this.model.get('ansTxt') : viewTitle = '답변';
        var viewText = '';
        this.model.get('qustTxt') != undefined ? viewText = this.model.get('qustTxt') : viewText = '질문';
        if(viewTitle.length > 0) viewTitle = viewTitle.replace(/\n/g, '<br>');
        if(viewText.length > 0) viewText = viewText.replace(/\n/g, '<br>');

        this.$box.find('div[name=viewTitle]').html(viewTitle);
        this.$box.find('div[name=viewText]').html(viewText);

		/* @ 다이어그램에서 수정 버튼 클릭시 해당 데이터를 폼에 입력시켜주는 부분 */
        this.$box.find('button[method=update]').on('click', function() {
            var obj = $(this).parent('div.text-left').parent('div.html-element');
            var ansTxt = obj.children('input[name=ansTxt]').val();
            var qustTxt = obj.children('input[name=qustTxt]').val();
            var qustId1 = obj.children('input[name=qustId1]').val();
            var qustId2 = obj.children('input[name=qustId2]').val();
            var qustId3 = obj.children('input[name=qustId3]').val();
            var qustType = obj.children('input[name=qustType]').val();
            var external = obj.children('input[name=external]').val();
            var eleId = obj.children('input[name=eleId]').val();
            var cal = obj.children('input[name=cal]').val();


            var disp_link1 = obj.children('input[name=disp_link1]').val();
            var disp_link2 = obj.children('input[name=disp_link2]').val();
            var disp_link3 = obj.children('input[name=disp_link3]').val();
            var disp_link4 = obj.children('input[name=disp_link4]').val();
            var disp_link5 = obj.children('input[name=disp_link5]').val();



            var link1 = obj.children('input[name=link1]').val();
            var link2 = obj.children('input[name=link2]').val();
            var link3 = obj.children('input[name=link3]').val();
            var link4 = obj.children('input[name=link4]').val();
            var link5 = obj.children('input[name=link5]').val();

            var img_file1 = obj.children('input[name=img_file1]').val();
            var img_file2 = obj.children('input[name=img_file2]').val();


            var talkText_check = obj.children('input[name=talkText_check]').val();
            var alias = obj.children('input[name=alias]').val();

            if(qustType == '') qustType = 1; // 초기값 1 세팅(1 : 객관식, 2 : 주관식)

            ansEditor.setContent(ansTxt, 0);
            qustEditor.setContent(qustTxt, 0);

            // Dialog에 데이터 세팅
            $('#dialog-form textarea#ansTxt').text(ansTxt);
            $('#dialog-form textarea#qustTxt').text(qustTxt);
            $('#dialog-form input#qustId1').val(qustId1);
            $('#dialog-form input#qustId2').val(qustId2);
            $('#dialog-form input#qustId3').val(qustId3);
            $('#dialog-form select#qustType').val(qustType);
            $('#dialog-form select#external').val(external);


            $('#dialog-form input#disp_link1').val(disp_link1);
            $('#dialog-form input#disp_link2').val(disp_link2);
            $('#dialog-form input#disp_link3').val(disp_link3);
            $('#dialog-form input#disp_link4').val(disp_link4);
            $('#dialog-form input#disp_link5').val(disp_link5);

            $('#dialog-form input#link1').val(link1);
            $('#dialog-form input#link2').val(link2);
            $('#dialog-form input#link3').val(link3);
            $('#dialog-form input#link4').val(link4);
            $('#dialog-form input#link5').val(link5);


            $('#dialog-form input#img_file1').val(img_file1);
            $('#dialog-form input#img_file2').val(img_file2);

			/* @ 추가 변경 */
            if(qustType != 1) {

                $('#ip_talkText_check').show();

                //비동기 통신을 하여 json타입으로 호출한다.
                $.ajax({
                    url: './ajax/ajax_scn_selectbox.php?param=' + qustType,
                    dataType : 'html',
                    success: function(data) {

                        $("#dialog-form select#talkText_check").html(data);
                        $("#dialog-form select#talkText_check").val(talkText_check);

                    }
                });

                switch(talkText_check) {

                    case "reservation" :

                        $('#ip_alias').show();

                        //비동기 통신을 하여 json타입으로 호출한다.
                        $.ajax({
                            url: './ajax/ajax_scn_alias.php',
                            dataType : 'html',
                            success: function(data) {

                                $("#dialog-form select#alias").html(data);
                                $("#dialog-form select#alias").val(alias);

                                $("#dialog-form select#alias").on('change', function(){

                                    var alias = $('#alias').val();

                                    $("#disp_link1").val("예약하기");
                                    $("#link1").val("https://ai.wowdream.kr/reservation.php?alias=" + alias);
                                    $("#disp_link2").val("예약수정");
                                    $("#link2").val("https://ai.wowdream.kr/reservation.php?alias=" + alias + "&act=modi");
                                    $("#disp_link3").val("예약취소");
                                    $("#link3").val("https://ai.wowdream.kr/reservation.php?alias=" + alias + "&act=cancel");

                                });

                            }
                        });

                        break;

                }

            } else {

                $('#ip_talkText_check').hide();
                $('#ip_alias').hide();


				/*

                $("#disp_link1").val("");
                $("#link1").val("");
                $("#disp_link2").val("");
                $("#link2").val("");
                $("#disp_link3").val("");
                $("#link3").val("");

				*/

            }


            $('#dialog-form input#eleId').val(eleId);
            if(cal == "Y") {
                $('#dialog-form input#cal').prop('checked', true);
            } else {
                $('#dialog-form input#cal').prop('checked', false);
            }
        });

        // 삭제 버튼 이벤트 매핑
        this.$box.find('button[method=delete]').on('click', _.bind(this.model.remove, this.model));

        // 객체 변경시 div 변경 적용
        this.model.on('change', this.updateBox, this);

        // 객체 삭제
        this.model.on('remove', this.removeBox, this);

        // 결과 반영
        this.updateBox();
    },
    render: function() {
        joint.dia.ElementView.prototype.render.apply(this, arguments);
        this.paper.$el.prepend(this.$box);
        this.updateBox();
        return this;
    },
    updateBox: function() {
        var bbox = this.model.getBBox();
        this.$box.css({ width: bbox.width, height: bbox.height, left: bbox.x, top: bbox.y, transform: 'rotate(' + (this.model.get('angle') || 0) + 'deg)' });

        var div = $('input[value=' + this.model.id + ']').parent('div.html-element');
        if(div.length > 0) {
            var agent = window.navigator.userAgent.toLowerCase();

            if(agent.indexOf('edge') != -1) { // Edge
                $('div.html-element').css('zoom', scaleValue);
            } else if(agent.indexOf('trident') != -1) { // IE 11
                $('div.html-element').css('zoom', scaleValue)
                    .each(function(idx) {
                        var modelId = $(this).children('input[name=eleId]').val();
                        var obj = $('g[model-id=' + modelId + ']');
                        $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                    });
            } else { // Chrome
                $('div.html-element')
                    .css('-webkit-transform', 'scale(' + (scaleValue) + ')')
                    .css('-webkit-transform-origin', '0 0')
                    .each(function(idx) {
                        var modelId = $(this).children('input[name=eleId]').val();
                        var obj = $('g[model-id=' + modelId + ']');
                        $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                    });
            }
        }
    },
    removeBox: function(evt) {
        this.$box.remove();
    }
});
// HTML ELEMENT 객체 생성 -----------------------------------------------------------------------



// LINK 객체 생성 -------------------------------------------------------------------------------
function link(source, target, breakpoints) { // 연결

    var cell = new joint.shapes.org.Arrow({
        source		: { id : source.id } , // 상위 객체 ID
        target		: { id : target.id } , // 하위 객체 ID
        vertices	: breakpoints , // LINK의 변곡점
        attrs		: {
            '.connection'	: {
                'fill'				: 'none' ,
                'stroke-linejoin'	: 'round' ,
                'stroke-width'		: '2' ,
                'stroke'			: '#4b4a67'
            },
            '.marker-target'	: { d: 'M 10 0 L 0 5 L 10 10 z' },	// LINK 모양 세팅
            '.marker-arrowhead'	: { d: 'M 16 0 L 0 8 L 16 16 Z' }	// LINK 변형 상태 모양 세팅
        }
    });
    //graph.addCell(cell); // 객체 추가
    return cell;
}

var createLabel = function(txt) {
    return {
        labels: [{
            position: -10,
            attrs: {
                text: { text: txt, fill: 'red', 'font-weight' : 'bold', 'font-size' : '20px' },
                rect: { fill: '#f5f5f5' }
            }
        }]
    };
};

function labelHide(cell) {
    var linkArr = graph.getConnectedLinks(cell, { outbound : true });
    for(var key in linkArr) {
        var curLink = linkArr[key];
        curLink.set(removeLabel());
    }
}

var removeLabel = function() {
    $('div.html-element').css('border', '2px solid #2980B9');
    return {
        labels: []
    };
}
// LINK 객체 생성 ------------------------------------------------------------------------------



// MYSQLDB 저장용 객체 생성 -----------------------------------------------------------------------
// LINK DATA
function aJson(type, source, target, vertices) {
    this.type = type;
    this.source = source;
    this.target = target;
    this.vertices = vertices;
}

// HTML ELEMENT 저장용 객체 생성
function mJson(type, id, xPosi, yPosi, ansTxt, qustTxt, qustId1, qustId2, qustId3, qustType, external, stat, cal, parentId , disp_link1, disp_link2, disp_link3, disp_link4, disp_link5, link1, link2, link3, link4, link5, img_file1, img_file2, talkText_check, alias) {
    this.type = type;
    this.id = id;
    this.xPosi = xPosi;
    this.yPosi = yPosi;
    this.ansTxt = ansTxt;
    this.qustTxt = qustTxt;
    this.qustId1 = qustId1;
    this.qustId2 = qustId2;
    this.qustId3 = qustId3;
    this.qustType = qustType;
    this.external = external;
    this.stat = stat;
    this.cal = cal;
    this.parentId = parentId;

    this.disp_link1 = disp_link1;
    this.disp_link2 = disp_link2;
    this.disp_link3 = disp_link3;
    this.disp_link4 = disp_link4;
    this.disp_link5 = disp_link5;

    this.link1 = link1;
    this.link2 = link2;
    this.link3 = link3;
    this.link4 = link4;
    this.link5 = link5;

    this.img_file1 = img_file1;
    this.img_file2 = img_file2;





    this.talkText_check = talkText_check ;
    this.alias = alias ;


}
// MYSQLDB 저장용 객체 생성 -----------------------------------------------------------------------



// 객체 데이터 JSON 형태로 변환 ----------------------------------------------------------------------
// GRAPH 저장용 객체 생성
function graphToJson(graph) {
    var jsonData = graph.toJSON();
    var cells = jsonData["cells"];
    var tempArr = new Array();

    // TEMP 배열에 저장할 데이터 세팅
    for(var key in cells) {
        var obj = cells[key];
        if(obj.type == "org.Arrow") { // LINK TYPE
            var type = obj.type;
            var source = obj.source.id;
            var target = obj.target.id;
            var vertices = obj.vertices;
            tempArr.push(new aJson(type, source, target, vertices));
        } else if(obj.type == "html.Element") { // HTML TYPE
            var type = obj.type;
            var id = obj.id;
            var xPosi = obj.position.x;
            var yPosi = obj.position.y;
            var ansTxt = obj.ansTxt;
            var qustTxt = obj.qustTxt != undefined ? obj.qustTxt.replace(/&lt;/gm, '<').replace(/&gt;/gm, '>') : obj.qustTxt;
            var qustId1 = obj.qustId1;
            var qustId2 = obj.qustId2;
            var qustId3 = obj.qustId3;
            var qustType = obj.qustType;
            var external = obj.external;
            var stat = '';
            var cal = obj.cal;
            var parentId = obj.parentId;



            var disp_link1 = obj.disp_link1;
            var disp_link2 = obj.disp_link2;
            var disp_link3 = obj.disp_link3;
            var disp_link4 = obj.disp_link4;
            var disp_link5 = obj.disp_link5;


            var link1 = obj.link1;
            var link2 = obj.link2;
            var link3 = obj.link3;
            var link4 = obj.link4;
            var link5 = obj.link5;


            var img_file1 = obj.img_file1;
            var img_file2 = obj.img_file2;




            var talkText_check = obj.talkText_check;
            var alias = obj.alias;









            var curCell = graph.getCell(obj.id);
            if(graph.isSource(curCell)) {
                stat = 'S'; // 시작
            } else if(graph.isSink(curCell)) {
                stat = 'E'; // 끝
            } else {
                stat = 'N'; // 중간
            }

            tempArr.push(new mJson(type, id, xPosi, yPosi, ansTxt, qustTxt, qustId1, qustId2, qustId3, qustType, external, stat, cal, parentId, disp_link1, disp_link2, disp_link3, disp_link4, disp_link5, link1, link2, link3, link4, link5, img_file1, img_file2, talkText_check, alias ));
        }
    }

    jsonData["cells"] = tempArr; // 화면을 그리는데 필요한 데이터 정보
    return jsonData;
}

// ELEMENT 중복 체크
function chkExistElement() {
    var allElements = graph.getElements();
    var elLength = allElements.length;
    var existArr = new Array();
    var existFlag = false;
    for(var i = 0; i < elLength; i++) {
        var chkCell = allElements[i];
        var chkId = [
            chkCell.get('qustId1'),
            chkCell.get('qustId2'),
            chkCell.get('qustId3')
        ].join('|');

        for(var j = i + 1; j < elLength; j++) {
            var curCell = allElements[j];
            var curId = [
                curCell.get('qustId1'),
                curCell.get('qustId2'),
                curCell.get('qustId3')
            ].join('|');

            if(chkId == curId) {
                existFlag = true;
                existArr.push('input[value=' + chkCell.id + ']');
                existArr.push('input[value=' + curCell.id + ']');
            }
        }
    }

    var el = $(existArr.join()).parent('div.html-element');

    el.css('background', 'red');

    setTimeout(function() {
        el.css('background', '#3498DB');
    }, 2000);

    return existFlag;
}
//질문 NULL 체크
function chkNullQuestion(){
    var allElements = graph.getElements();
    var elLen = allElements.length;
    var nullArr = new Array();
    var nullFlag = false;
    for(var i = 0; i < elLen; i++) {
        var chkCell = allElements[i];
        var chkqustTxt = chkCell.get('qustTxt');
        if (typeof(chkqustTxt) == "undefined" || chkqustTxt.replace("<p><br></p>","") == ""){
            nullFlag = true;
        }
    }
    return nullFlag;
}
//ELEMENT ID NULL 체크
function chkNullQuestionId() {
    var allElements = graph.getElements();
    var elLen = allElements.length;
    var nullArr = new Array();
    var nullFlag = false;
    for(var i = 0; i < elLen; i++) {
        var chkCell = allElements[i];
        var chkId1 = chkCell.get('qustId1');
        var chkId2 = chkCell.get('qustId2');
        var chkId3 = chkCell.get('qustId3');

        if(chkId1 == undefined || chkId2 == undefined || chkId3 == undefined) {
            nullFlag = true;
            nullArr.push('input[value=' + chkCell.id + ']');
            continue;
        }

        if(chkId1.length < 1 || chkId2.length < 1 || chkId3.length < 1) {
            nullFlag = true;
            nullArr.push('input[value=' + chkCell.id + ']');
        }
    }

    var el = $(nullArr.join()).parent('div.html-element');

    el.css('background', 'yellow');

    setTimeout(function() {
        el.css('background', '#3498DB');
    }, 2000);

    return nullFlag;
}

// ELEMENT LINK NULL CHECK
function chkLink() {
    var allElements = graph.getElements();
    var elLen = allElements.length;
    var nullArr = new Array();
    var nullFlag = false;
    for(var i = 0; i < elLen; i++) {
        var chkCell = allElements[i];

        var links = graph.getConnectedLinks(chkCell);

        if(links.length < 1) {
            nullFlag = true;
            nullArr.push('input[value=' + chkCell.id + ']');
        }
		/*
		 else if(links.length = 1){
		 var cellArr = graph.getCells();
		 var cellLength = cellArr.length;
		 console.log("here ::: " + cellLength);
		 }
		 */
    }

    var el = $(nullArr.join()).parent('div.html-element');

    el.css('background', 'green');

    setTimeout(function() {
        el.css('background', '#3498DB');
    }, 2000);

    return nullFlag;
}

// etag 상위에 해당 itag 존재 체크
function chkEtcElement() {
    var flag = false;
    var sourceArr = graph.getSources();

    $('div.html-element input[value*="etag"]').each(function() {
        var obj = $(this).parent('div.html-element');
        var modelId = obj.children('input[name=eleId]').val();
        var tempCode = $(this).val().match(/etag.*\s/)[0];
        var st = tempCode.indexOf('_');
        var end = tempCode.indexOf('"');
        var tagCode = tempCode.substring(st + 1, end);
        var tagParams = etcParams[tagCode];
        var curCell = graph.getCell(modelId);
        var chkCnt = 0;
        var getPreArr = graph.getPredecessors(curCell, { inbound : true });
        for(var i = 0; i < getPreArr.length; i++) {
            var qustTxt = getPreArr[i].get('qustTxt');
            var tagName = tagParams[chkCnt].replace('#', '');
            if(qustTxt.indexOf('itag_' + tagName) != -1) {
                chkCnt++;
                if(chkCnt == tagParams.length) break;
            }
        }
        if(chkCnt != tagParams.length) flag = true;
    });

    return flag;
}
//객체 데이터 JSON 형태로 변환 ----------------------------------------------------------------------



// CSV 저장 --------------------------------------------------------------------------------
function getCsvData() {
    var firstCell = graph.getSources()[0]; // GRAPH의 첫번째 CELL 탐색
    var cellArr = new Array();
    var csvData = new Array();



    if(!firstCell){
        //	alert('첫 로드로 연결이 불가합니다.')

        toastr['info']('', '첫 로드로 연결이 불가합니다.');

    }



    cellArr.push(firstCell);
    csvData.push(setFirstCellCsv(firstCell)); // CSV 파일의 첫번재 ROW 세팅
    setSessId(cellArr, csvData); // CSV 파일 저장을 위해 각 CELL에 SESSION_ID 1, 2, 3 세팅
    setQustAndAns(csvData); // CSV 파일 저장을 위해 CELL 별로 연결된 LINK 정보를 탐색하면서 하위의 객관식 텍스트 세팅

    console.log("csvData : "+ csvData );




    return csvData;
}

//CSV 파일의 첫번재 ROW 세팅
function setFirstCellCsv(firstCell) {

    console.log("firstCell : "+ firstCell );
    var setData = {};

    setData._id = firstCell.id;

    // 첫번재 ROW의 경우 일부 데이터가 고정되어 있음
    setData.qustType = '';
    setData.sessId1 = '#';
    setData.sessId2 = '#';
    setData.sessId3 = '#';
    setData.qustId1 = '#' + firstCell.get('qustId1');
    setData.qustId2 = '#' + firstCell.get('qustId2');
    setData.qustId3 = '#' + firstCell.get('qustId3');

    return setData;
}

//객관식일 때 노드 개수 확인하기
function qtypeValidate(){
    var result = false;
    //각 엘리먼트(노드)의 정보 가져오기
    $('div.html-element').each(function(idx) {
        var divObj = $(this);
        //질문유형(객관식, 주관식, API) 가져오기
        var qustType = divObj.find('input[name=qustType]').val();
        //객관식일 경우 체크
        if (qustType == 1){
            var cnt = 0;
            var chkCell = graph.getElements()[idx];
            var models = chkCell.collection.models;

            for(i=0; i <= models.length - 1; i++){
                if (models[i].attributes.source != undefined)
                    if(models[i].attributes.source.id == divObj.find("input[name=eleId]").val())		//엘리먼트가 부모로 등록되어 있을 경우 카운트
                        cnt++;
            }
            //엘리먼트가 객관식이면서 자식노드가 한 개일 때 css변경
            if (cnt == 1){
                result = true;
                divObj.css("background","#fff");
                divObj.css("border","1px solid #ff0000");
            }else{
                divObj.css("background","#f39c12");
                divObj.css("border","1px solid #F39C13");
            }
        }
    });
    return result;
}




//CSV 파일 저장을 위해 각 CELL에 SESSION_ID 1, 2, 3 세팅
//최상위 CELL에 LINK 되어 있는 개수 만큼 배열에 객체를 담고 그 수만큼 재귀 호출 하면서 SESSION ID 세팅
function setSessId(cellArr, csvData) {
    var posiNum = 1;
    var nextArr = new Array(); // 다음 재귀 호출을 위해 CELL을 저장할 배열
    for(var i = 0; i < cellArr.length; i++) {
        var cell = cellArr[i]; // 이전에 저장된 배열에서 순서대로 CELL을 꺼내옴
        var neighCellArr = graph.getNeighbors(cell);
        for(var j = 0; j < neighCellArr.length; j++) { // 연결된 element 탐색
            var neighCell = neighCellArr[j];
            var lineCnt = csvData.length;

            if(graph.isPredecessor(neighCell, cell)) { // 하위 element 여부
                var sessId1 = cell.get('qustId1');
                var sessId2 = cell.get('qustId2');
                var sessId3 = cell.get('qustId3');
                var qustId1 = neighCell.get('qustId1');
                var qustId2 = neighCell.get('qustId2');
                var qustId3 = neighCell.get('qustId3');

                var chkId = ['#' + sessId1,
                    '#' + sessId2,
                    '#' + sessId3,
                    '#' + qustId1,
                    '#' + qustId2,
                    '#' + qustId3
                ].join('|');

                if(isExistData(csvData, chkId)) continue; // 중복일 경우 다음 LINK로 이동

                var setData = {};

                setData._id = neighCell.id;

                // 질문 유형 세팅(객관식 : 1, 주관식 : 2)
                if(cell.get('qustType') == 1) { // 객관식
                    setData.qustType = posiNum;
                } else if(cell.get('qustType') == 2) { // 주관식
                    setData.qustType = '#';
                }else if(cell.get('qustType') == 3) { // API
                    setData.qustType = '#';
                }

                setData.sessId1 = '#' + sessId1;
                setData.sessId2 = '#' + sessId2;
                setData.sessId3 = '#' + sessId3;

                setData.qustId1 = '#' + qustId1;
                setData.qustId2 = '#' + qustId2;
                setData.qustId3 = '#' + qustId3;


                csvData.push(setData);

                posiNum++;
                nextArr.push(neighCell);
            }
        }
        posiNum = 1;
    }

    // 하위 CELL에 CHILD ELEMENT가 존재 하면 재귀 호출
    if(nextArr.length > 0) {
        setSessId(nextArr, csvData);
    }
}

//CSV용 중복 데이터 탐색
function isExistData(csvData, chkId) {
    var returnFlag = false;
    // CSV에 이미 추가된 데이터가 있는지 탐색
    // 비교값은 SESSION ID 와 QUESTION ID 6개를 비교
    for(var i = 0; i < csvData.length; i++) {
        var csvId = [csvData[i].sessId1,
            csvData[i].sessId2,
            csvData[i].sessId3,
            csvData[i].qustId1,
            csvData[i].qustId2,
            csvData[i].qustId3
        ].join('|');
        if(chkId == csvId) {
            returnFlag = true;
            break;
        }
    }
    return returnFlag;
}

// 시나리오명 공백 체크
function chkViewNameSpace(val) {
    var regExp = /\s/g;
    var spArr = val.match(regExp);
    if(spArr != null) return true;
}

//질문과 객관식 보기 텍스트를 합쳐서 세팅
function setQustAndAns(csvData) {
    var rowCnt = csvData.length;
    var regExp = /<(\/)?(p|b|u|i|a|br|\s+.)>/gim;
    for(var i = 0; i < rowCnt; i++) {
        var cell = graph.getCell(csvData[i]._id);
        var qustType = cell.get('qustType');

        var qustAndAns = cell.get('qustTxt').replace(/<a/gim, '<a target="_blank"').replace(/&lt;/gm, '<').replace(/&gt;/gm, '>');
        qustAndAns = replaceData(qustAndAns);
        var childLinks = graph.getConnectedLinks(cell, { outbound : true });
        var childCnt = childLinks.length;


        var disp_link1 = cell.get('disp_link1');
        var link1 = cell.get('link1');

        var disp_link2 = cell.get('disp_link2');
        var link2 = cell.get('link2');

        var disp_link3 = cell.get('disp_link3');
        var link3 = cell.get('link3');

        var disp_link4 = cell.get('disp_link4');
        var link4 = cell.get('link4');

        var disp_link5 = cell.get('disp_link5');
        var link5 = cell.get('link5');

        var img_file1 = cell.get('img_file1');
        var img_file2 = cell.get('img_file2');





        var talkText_check = cell.get('talkText_check');
        var alias = cell.get('alias');






        csvData[i].disp_link1 = disp_link1 ; // disp_link1
        csvData[i].link1 = link1 ; // link1


        csvData[i].disp_link2 = disp_link2 ; // disp_link1
        csvData[i].link2 = link2 ; // link1


        csvData[i].disp_link3 = disp_link3 ; // disp_link1
        csvData[i].link3 = link3 ; // link1

        csvData[i].disp_link4 = disp_link4 ; // disp_link1
        csvData[i].link4 = link4 ; // link1

        csvData[i].disp_link5 = disp_link5 ; // disp_link1
        csvData[i].link5 = link5 ; // link1



        csvData[i].img_file1 = img_file1 ; // img_file1
        csvData[i].img_file2 = img_file2 ; // img_file2







        csvData[i].talkText_check = talkText_check ;
        csvData[i].alias = alias ;




        csvData[i].cal = 'N'; // 초기값

        // 객관식은 질문과 보기의 형식으로 저장되고 주관식의 경우 질문만 존재함
        if(qustType == 1) { // 객관식
            if(childCnt > 1) {
                for(var j = 0; j < childCnt; j++) {
                    var curLink = childLinks[j];
                    var target = graph.getCell(curLink.get('target').id);
                    var ansTxt = target.get('ansTxt').replace(/<a/gim, '<a target="_blank"');
                    var external = target.get('external');
                    var replText = ansTxt.replace(regExp, '');
                    var inPosi = ansTxt.indexOf(replText.substring(0, 1));
                    var beforeText = ansTxt.substring(0, inPosi);
                    var afterText = ansTxt.substring(inPosi, ansTxt.length);

                    if(external != '') {
                        //qustAndAns += beforeText + '$$$^' + external + afterText;
                        qustAndAns += beforeText + '$$$' +  afterText;
                    } else {
                        qustAndAns += beforeText + '$$$' + afterText;
                    }
                }
                csvData[i].cal = cell.get('cal');
            }
        }
        csvData[i].qustAndAns = qustAndAns;
    }
}

function replaceData(val) {
    var regex = /<img[^>]*[^>]*>/g; // 이미지 태그 찾기
    var matArr = val.match(regex);

    if(matArr == null) return val;

    for(var i = 0; i < matArr.length; i++) {
        if(matArr[i].indexOf("itag") == -1 && matArr[i].indexOf("otag") == -1 && matArr[i].indexOf("etag") == -1) continue;

        var st = matArr[i].indexOf("name=\"") + 6;
        var tempVal = matArr[i].substring(st, matArr[i].length);
        var end = tempVal.indexOf("\"");
        var tempArr = tempVal.substring(0, end).split("_");
        var tagName = tempArr[0];
        var tagValue = tempArr[1];

        if(tempArr.length > 2) {
            tempArr.shift();
            tagValue = tempArr.join('_');
        }

        var qs = '<' + tagName + '>' + tagValue + '</' + tagName + '>';
        qs.replace('width=""', 'width="100%"').replace('height=""', 'height="100%"');
        val = val.replace(matArr[i], qs);
    }
    return val;
}
// CSV 저장 --------------------------------------------------------------------------------



//DRAG & DROP 설정 ------------------------------------------------------------------------
function onDragStart(event){
    // 드래그 대상이 member 일 경우에만 드롭 가능토록 설정함
    if(mode != 1) { // member 객체 선택
        event.preventDefault();
        return;
    }
}

function onDragEnter(event) {
    // 드래그 대상이 member 일 경우에만 드롭 가능토록 설정함
    if(mode == 1) { // member 객체 선택
        event.preventDefault();
        return;
    }
}

function onDragOver(event) {
    //드롭이 가능하도록 기본 상태를 취소함
    event.preventDefault();
}

function onDrop(event) {
    if(mode == 1) { // HTML ELEMENT 객체 추가
        var paperPoint = paper.clientToLocalPoint({ x: event.clientX, y: event.clientY }); // PAPER 상의 X, Y POSITION RETURN
        var xPosi = paperPoint.x - 100;
        var yPosi = paperPoint.y - 70;

        var cellArr = graph.getCells();
        var cellLength = cellArr.length;

        eval('var newObj' + cellLength + ' = new joint.shapes.html.Element({ '
            + 'position: { x: ' + xPosi + ', y: ' + yPosi + ' }, '
            + 'size: { width: ' + cellWidth + ', height: ' + cellHeight + ' }, '
            + 'viewTitle: "답변", '
            + 'viewText: "질문" });');
        eval('graph.addCell(newObj' + cellLength + ');');
    }

    //드롭 완료 후 이벤트 버블링을 막기 위해 호출
    event.stopPropagation();
}
//DRAG & DROP 설정 ------------------------------------------------------------------------



// 기타 함수 ----------------------------------------------------------------------------------
// DIALOG에서 입력받은 데이터를 CELL과 HTML ELEMENT에 세팅
function setData() {
    var eleId = $('#dialog-form input#eleId').val();
    var ansTxt = $('#dialog-form textarea#ansTxt').text();
    var qustTxt = $('#dialog-form textarea#qustTxt').text();
    var qustId1 = $('#dialog-form input#qustId1').val();
    var qustId2 = $('#dialog-form input#qustId2').val();
    var qustId3 = $('#dialog-form input#qustId3').val();
    var qustType = $('#dialog-form select#qustType').val();
    var external = $('#dialog-form select#external').val();

    var disp_link1 = $('#dialog-form input#disp_link1').val();
    var link1 = $('#dialog-form input#link1').val();

    var disp_link2 = $('#dialog-form input#disp_link2').val();
    var link2 = $('#dialog-form input#link2').val();


    var disp_link3 = $('#dialog-form input#disp_link3').val();
    var link3 = $('#dialog-form input#link3').val();

    var disp_link4 = $('#dialog-form input#disp_link4').val();
    var link4 = $('#dialog-form input#link4').val();


    var disp_link5 = $('#dialog-form input#disp_link5').val();
    var link5 = $('#dialog-form input#link5').val();


    var img_file1 = $('#dialog-form input#img_file1').val();
    var img_file2 = $('#dialog-form input#img_file2').val();






    var talkText_check = $('#dialog-form select#talkText_check').val();
    var alias = $('#dialog-form select#alias').val();

    var cal = '';





    console.log("eleId : "+ eleId );
    console.log("ansTxt : "+ ansTxt );
    console.log("qustTxt : "+ qustTxt );

    console.log("qustId1 : "+ qustId1 );
    console.log("qustId2 : "+ qustId2 );
    console.log("qustId3 : "+ qustId3 );


    console.log("disp_link1 : "+ disp_link1 );
    console.log("link1 : "+ link1 );

    console.log("disp_link2 : "+ disp_link2 );
    console.log("link2 : "+ link2 );

    console.log("disp_link3 : "+ disp_link3 );
    console.log("link3 : "+ link3 );


    console.log("disp_link4 : "+ disp_link4 );
    console.log("link4 : "+ link4 );

    console.log("disp_link5 : "+ disp_link5 );
    console.log("link5 : "+ link5 );


    console.log("img_file1 : "+ img_file1 );
    console.log("img_file2 : "+ img_file2 );




    console.log("talkText_check : "+ talkText_check );
    console.log("alias : "+ alias );



    $('#dialog-form input#cal').is(':checked') ? cal = 'Y' : cal = 'N';

    ansTxt = ansEditor.getContent(0);
    qustTxt = qustEditor.getContent(0);

    // CELL에 데이터 세팅
    var curCell = graph.getCell(eleId);
    curCell.set('ansTxt', ansTxt);
    curCell.set('qustTxt', qustTxt);
    curCell.set('qustId1', qustId1);
    curCell.set('qustId2', qustId2);
    curCell.set('qustId3', qustId3);
    curCell.set('qustType', qustType);
    curCell.set('external', external);

    curCell.set('disp_link1', disp_link1);
    curCell.set('link1', link1);

    curCell.set('disp_link2', disp_link2);
    curCell.set('link2', link2);

    curCell.set('disp_link3', disp_link3);
    curCell.set('link3', link3);

    curCell.set('disp_link4', disp_link4);
    curCell.set('link4', link4);

    curCell.set('disp_link5', disp_link5);
    curCell.set('link5', link5);


    curCell.set('img_file1', img_file1);
    curCell.set('img_file2', img_file2);







    curCell.set('talkText_check', talkText_check);
    curCell.set('alias', alias);




    curCell.set('cal', cal);

    // HTML ELEMENT에 데이터 세팅
    var obj = $('div.html-element input[value=' + eleId + ']').parent('div');
    obj.children('input[name=ansTxt]').val(ansTxt);
    obj.children('input[name=qustTxt]').val(qustTxt);
    obj.children('input[name=qustId1]').val(qustId1);
    obj.children('input[name=qustId2]').val(qustId2);
    obj.children('input[name=qustId3]').val(qustId3);
    obj.children('input[name=qustType]').val(qustType);
    obj.children('input[name=external]').val(external);
    obj.children('input[name=eleId]').val(eleId);

    obj.children('input[name=disp_link1]').val(disp_link1);
    obj.children('input[name=link1]').val(link1);


    obj.children('input[name=disp_link2]').val(disp_link2);
    obj.children('input[name=link2]').val(link2);


    obj.children('input[name=disp_link3]').val(disp_link3);
    obj.children('input[name=link3]').val(link3);

    obj.children('input[name=disp_link4]').val(disp_link4);
    obj.children('input[name=link4]').val(link4);

    obj.children('input[name=disp_link5]').val(disp_link5);
    obj.children('input[name=link5]').val(link5);


    obj.children('input[name=img_file1]').val(img_file1);
    obj.children('input[name=img_file2]').val(img_file2);




    obj.children('input[name=talkText_check]').val(talkText_check);
    obj.children('input[name=alias]').val(alias);





    console.log("qustType 값: "+ qustType );





    obj.children('input[name=cal]').val(cal);
    if(qustType == 1) { // 객관식
        obj.find('span.label-success').hide();
        obj.find('span.label-info').hide();
        obj.find('span.label-default').show();
    } else if(qustType == 2) { // 주관식
        obj.find('span.label-success').show();
        obj.find('span.label-info').hide();
        obj.find('span.label-default').hide();
    }else { // api
        obj.find('span.label-info').show();
        obj.find('span.label-success').hide();
        obj.find('span.label-default').hide();
    }

    // 줄바꿈 문자 br태크로 변경하여 화면에 뿌려줌
    if(ansTxt.length > 0) ansTxt = ansTxt.replace(/\n/g, '<br>');
    if(qustTxt.length > 0) qustTxt = qustTxt.replace(/\n/g, '<br>');

    obj.children('div[name=viewTitle]').html(ansTxt);
    obj.children('div[name=viewText]').html(qustTxt);

    // DIALOG 초기화
    $('#dialog-form input').val('');
    $('#dialog-form').modal('hide');

    $('#saveBtn').attr('disabled', false);
    $('#delBtn').attr('disabled', true);
    $('#csvBtn').attr('disabled', true);
}

// PAPER 셋팅
// HTML ELEMENT 생성수 해당 CELL의 ID를 이용해 LINK 객체 연결
function setPaper(data) {





    graph.clear();
    var elements = data.elements;
    var links = data.links;
    var idJson = {}; // LINK 연결을 위한 CELL ID 저장용도
    var replArr = new Array();
    var addArr = new Array(); // 노드 배열
    var addLinkArr = new Array(); // 링크 배열

    // HTML ELEMENT 생성
    for(var key in elements) {
        var obj = elements[key];
        var _id = obj.id;
        var xPosi = obj.xPosi;
        var yPosi = obj.yPosi;
        var ansTxt = obj.ansTxt;
        var qustTxt = obj.qustTxt != undefined ?
            obj.qustTxt.replace(/<itag>/gm, '&lt;itag&gt;').replace(/<\/itag>/gm, '&lt;\/itag&gt;')
                .replace(/<otag>/gm, '&lt;otag&gt;').replace(/<\/otag>/gm, '&lt;\/otag&gt;')
            : obj.qustTxt;
        var qustId1 = obj.qustId1;
        var qustId2 = obj.qustId2;
        var qustId3 = obj.qustId3;
        var qustType = obj.qustType != undefined ? obj.qustType : 1;
        var external = obj.external;
        var cal = obj.cal;
        var parentId = obj.parentId;

        var disp_link1 = obj.disp_link1;
        var link1 = obj.link1;

        var disp_link2 = obj.disp_link2;
        var link2 = obj.link2;

        var disp_link3 = obj.disp_link3;
        var link3 = obj.link3;

        var disp_link4 = obj.disp_link4;
        var link4 = obj.link4;

        var disp_link5 = obj.disp_link5;
        var link5 = obj.link5;


        var img_file1 = obj.img_file1;
        var img_file2 = obj.img_file2;





        var talkText_check =obj.talkText_check;
        var alias =obj.alias;



        console.log("data 값 talkText_check: "+ talkText_check );
        console.log("data 값 alias: "+ alias );






        // HTML ELEMENT 생성
        var tempCell = new joint.shapes.html.Element({
            position	: { x: xPosi, y: yPosi },
            size		: { width: cellWidth, height: cellHeight },
            ansTxt		: ansTxt,
            qustTxt		: qustTxt,
            qustId1		: qustId1,
            qustId2		: qustId2,
            qustId3		: qustId3,
            qustType	: qustType,
            external	: external,
            viewTitle	: ansTxt,
            viewText	: qustTxt,
            cal			: cal,
            disp_link1	: disp_link1,
            link1	: link1,
            disp_link2	: disp_link2,
            link2	: link2,
            disp_link3	: disp_link3,
            link3	: link3,
            disp_link4	: disp_link4,
            link4	: link4,
            disp_link5	: disp_link5,
            link5	: link5,

            img_file1	: img_file1,
            img_file2	: img_file2,




            talkText_check: talkText_check,
            alias: alias,

            parentId	: parentId
        });
        tempCell.set("id", _id);
        addArr.push(tempCell);
    }
    graph.addCells(addArr);

    // LINK 객체 생성
    for(var key in links) {
        var obj = links[key];
        var type = obj.type;
        var source = graph.getCell(obj.source);
        var target = graph.getCell(obj.target);
        var vertices = obj.vertices;
        addLinkArr.push(link(source, target, vertices)); // LINK 생성
    }
    graph.addCells(addLinkArr);

    $('div.html-element').each(function() {
        var divObj = $(this);
        var qustType = divObj.find('input[name=qustType]').val();


        console.log("qustType 값 -->: "+ qustType );

//label label-default

        if(qustType == 1) { // 객관식
            divObj.find('span.label-success').hide();
            divObj.find('span.label-info').hide();
            divObj.find('span.label-default').show();
        } else if(qustType == 2) { // 주관식
            divObj.find('span.label-success').show();
            divObj.find('span.label-info').hide();
            divObj.find('span.label-default').hide();
        } else  { //
            divObj.find('span.label-success').hide();
            divObj.find('span.label-info').show();
            divObj.find('span.label-default').hide();
        }



    });

    $('#saveBtn').attr('disabled', true);
    $('#delBtn').attr('disabled', false);
}

// SET SELECT BOX(VALIDATAION FUNCTION)
function setValidataionFunction(data) {
    var qs = '<option value="">선택</option>';
    for(var key in data) {
        var obj = data[key];
        qs += '<option value=' + obj['function'] + '>' + obj.name + '</option>';
    }
    $('#valiType').html('').append(qs);
}

// EXCEL UPLOAD
function excelToJoint(data) {
    var rowCnt = Number(data.rowCnt);

    // GRAPH를 그려준 후 DB에 저장시 구분값(구분 기준 VIEW ID)
    var paperCnt = 0;

    if(rowCnt < 1) return;

    var comView = '';
    var jsonData = {};
    var objData = {};
    var uploadData = {};
    var curRow = 1;
    for(var i = 1; i <= rowCnt; i++) {
        // EXCEL의 마지막 줄 정보
        if(i == rowCnt) {
            paperCnt++;
            jsonData.dataCnt = i - curRow; // 이전에 읽은 데이터 건너뛰기
            jsonData.curRow = curRow;
            curRow = i;
            uploadData[paperCnt] = setExcelPaper(jsonData); // PAPER에 EXCEL 정보를 그려줌
            graph.clear();
            return uploadData;
        }

        var obj = data[i];
        var viewName = obj.VIEW_NAME;

        if(i == 1) comView = viewName;

        // EXCEL의 나머지 정보
        if(comView != viewName && comView != '') {
            paperCnt++;
            jsonData.dataCnt = i - curRow;
            jsonData.curRow = curRow;
            curRow = i;
            uploadData[paperCnt] = setExcelPaper(jsonData);
            graph.clear();
            jsonData = {};
            comView = viewName;
        }

        // EXCEL 데이터
        objData.objType = obj.OBJ_TYPE;		// 데이터 형태(1 : ELEMENT, 2 : LINK)
        objData.parentId = obj.PARENT_ID;	// SOURCE ELEMENT
        objData.objId = obj.OBJ_ID;			// TARGET ELEMENT
        objData.qustType = obj.QUST_TYPE;	// 질문유형(1: 객관식, 2: 주관식)
        objData.depth1 = obj.DEPTH1;		// DEPTH1(SESSION ID, QUESTION ID 공통)
        objData.depth2 = obj.DEPTH2;		// DEPTH2(SESSION ID, QUESTION ID 공통)
        objData.position = obj.POSITION;	// ELEMENT 높이값
        objData.qustTxt = obj.QUST_TXT;		// 질문 텍스트
        objData.ansTxt = obj.ANS_TXT;		// 답변 텍스트
        objData.external = obj.EXTERNAL;	// 외부연결(1 : OCR, 2 : 화상통화)
        objData.cal = obj.cal;				// 점수합산 체크박스(Y, N)
        objData.parentId = obj.parentId;				// 점수합산 체크박스(Y, N)


        objData.disp_link1 = obj.disp_link1;
        objData.disp_link2 = obj.disp_link2;
        objData.disp_link3 = obj.disp_link3;
        objData.disp_link4 = obj.disp_link4;
        objData.disp_link5 = obj.disp_link5;


        objData.link1 = obj.link1;
        objData.link2 = obj.link2;
        objData.link3 = obj.link3;
        objData.link4 = obj.link4;
        objData.link5 = obj.link5;



        objData.img_file1 = obj.img_file1;
        objData.img_file2 = obj.img_file2;





        objData.talkText_check = obj.talkText_check;
        objData.alias = obj.alias;





        jsonData.viewName = viewName;
        jsonData['data' + i] = objData;
        objData = {};
    }
}

// 읽은 정보를 PAPER에 그려주고 해당 정보를 RETURN
function setExcelPaper(json) {
    graph.clear();
    var viewName = json.viewName;
    var rowCnt = json.dataCnt;
    var curRow = json.curRow;
    var idJson = {};
    var xPosi = 50;
    var yPosi = 50;
    var curPosi = 1;
    var addArr = new Array(); // 노드 배열
    var addLinkArr = new Array(); // 링크 배열

    for(var i = 0; i < rowCnt; i++) {
        // EXCEL에서 읽은 데이터
        var dataKey = 'data' + (curRow + i);

        var objType = json[dataKey].objType;
        var parentId = json[dataKey].parentId;
        var objId = json[dataKey].objId;
        var qustType = json[dataKey].qustType;
        var depth1 = json[dataKey].depth1;
        var depth2 = json[dataKey].depth2;
        var position = json[dataKey].position * 1;
        var qustTxt = json[dataKey].qustTxt;
        var ansTxt = json[dataKey].ansTxt;
        var external = json[dataKey].external;
        var cal = json[dataKey].cal;
        var parentId = json[dataKey].parentId;


        var disp_link1 = json[dataKey].disp_link1;
        var disp_link2 = json[dataKey].disp_link2;
        var disp_link3 = json[dataKey].disp_link3;
        var disp_link4 = json[dataKey].disp_link4;
        var disp_link5 = json[dataKey].disp_link5;

        var link1 = json[dataKey].link1;
        var link2 = json[dataKey].link2;
        var link3 = json[dataKey].link3;
        var link4 = json[dataKey].link4;
        var link5 = json[dataKey].link5;


        var img_file1 = json[dataKey].img_file1;
        var img_file2 = json[dataKey].img_file2;




        var talkText_check = json[dataKey].talkText_check;
        var alias = json[dataKey].alias;




        if(objType == 1) { // ELEMENT 만 그려줌
            // POSITION에 따라 동적으로 위치 지정(고정형태)
            if(curPosi != position) {
                curPosi = position;
                xPosi = 50;
            }

            // HTML ELEMENT 생성
            // HTML ELEMENT 생성
            var tempCell = new joint.shapes.html.Element({
                position	: { x: xPosi, y: yPosi + ((curPosi - 1) * cellWidth) },
                size		: { width: cellWidth, height: cellHeight },
                ansTxt		: ansTxt,
                qustTxt		: qustTxt,
                qustId1		: depth1,
                qustId2		: depth2,
                qustId3		: objId,
                qustType	: qustType,
                external	: external,
                viewTitle	: ansTxt,
                viewText	: qustTxt,
                cal			: cal,

                disp_link1	: disp_link1,
                disp_link2	: disp_link2,
                disp_link3	: disp_link3,
                disp_link4	: disp_link4,
                disp_link5	: disp_link5,


                link1	: link1,
                link2	: link2,
                link3	: link3,
                link4	: link4,
                link5	: link5,

                img_file1	: img_file1,
                img_file2	: img_file2,


                talkText_check	: talkText_check,
                alias	: alias,



                parentId	: parentId
            });

            addArr.push(tempCell);

            idJson[objId] = tempCell.id;
            xPosi += 210; // 다음 생성될 위치 변경
        }
    }
    graph.addCells(addArr);

    // 생성될때마다 CELL의 ID가 변경되므로 변경된 CELL ID 세팅
    for(var i = 0; i < rowCnt; i++) {
        var dataKey = "data" + (curRow + i);
        var objId = json[dataKey].objId;
        var parentId = json[dataKey].parentId;

        json[dataKey].objId = idJson[objId];
        json[dataKey].parentId = idJson[parentId];
    }

    // 변경된 CELL의 ID를 이용하여 LINK 생성
    for(var i = 0; i < rowCnt; i++) {
        var dataKey = "data" + (curRow + i);
        var objId = json[dataKey].objId;
        var parentId = json[dataKey].parentId;

        if(objId == undefined || parentId == undefined) continue;

        var newArrow = new joint.shapes.org.Arrow({
            source		: { id: json[dataKey].parentId },
            target		: { id: json[dataKey].objId },
            attrs		: {
                '.connection'	: {
                    'fill'				: 'none' ,
                    'stroke-linejoin'	: 'round' ,
                    'stroke-width'		: '2' ,
                    'stroke'			: '#4b4a67'
                },
                '.marker-target': { d: 'M 10 0 L 0 5 L 10 10 z' }
            }
        });

        addLinkArr.push(newArrow);
    }
    graph.addCells(addLinkArr);

    // 화면에 그려진 정보를 DB에 저장할 JSON 형태로 변경하여 RETURN
    var viewData = graphToJson(graph);
    var csvData = getCsvData();
    var jsonData = {
        "viewName"	: viewName,
        "comCode"	: comCode,
        "viewData"	: viewData,
        "csvData"	: csvData
    };

    return jsonData;
}

// 멀티 셀렉트
function embedCell(multiArr, unEmbedCell, originEmbed) {
    $('div.html-element').css('border', '2px solid #2980B9');

    var stX = 0;
    var stY = 0;
    var endX = 0;
    var endY = 0;

    var embedCell = new joint.shapes.basic.Rect({
        attrs: { rect : { fill : '#F1C40F', 'stroke-width' : 1, 'stroke-dasharray' : '4, 1',  opacity : 0.3 } }
    });
    graph.addCell(embedCell);

    for(var i = 0; i < multiArr.length; i++) {
        var curCell = multiArr[i];
        var eleId = curCell.id;
        $('input[value=' + eleId + ']').parent('div.html-element').css('border', '3px dashed orange')
        var cellX = curCell.get('position').x;
        var cellY = curCell.get('position').y;
        var endWidth = cellX + cellWidth;
        var endHeigth = cellY + cellHeight;
        if(i == 0) {
            stX = cellX;
            stY = cellY;
            endX = endWidth;
            endY = endHeigth;
        } else {
            if(stX >= cellX) stX = cellX;
            if(endX <= endWidth) endX = endWidth;
            if(stY >= cellY) stY = cellY;
            if(endY <= endHeigth) endY = endHeigth;
        }
    }

    embedCell.position(stX, stY);
    embedCell.resize(endX - stX, endY - stY);

    if(originEmbed != null) {
        var cells = originEmbed.getEmbeddedCells();
        for(var i = 0; i < cells.length; i++) {
            originEmbed.unembed(cells[i]);
        }
    }

    for(var i = 0; i < multiArr.length; i++) {
        embedCell.embed(multiArr[i]);
    }

    if(originEmbed != null) originEmbed.remove();
    embedCell.toBack();
    return embedCell;
}

// 멀티 셀렉트 해제
function unembedAllCell(embedCell) {
    if(embedCell != null) {
        $('div.html-element').css('border', '2px solid #2980B9');
        var cells = embedCell.getEmbeddedCells();
        for(var i = 0; i < cells.length; i++) {
            embedCell.unembed(cells[i]);
        }
        embedCell.remove();
        embedCells = null;
        multiArr = new Array();
    }
}

//상세화면 축소 버튼 이벤트
function minus() {
    if(scaleValue > 0.2) {
        scaleValue -= 0.1;
        paper.scale(scaleValue, scaleValue);
        var agent = window.navigator.userAgent.toLowerCase();

        if(agent.indexOf('edge') != -1) { // Edge
            $('div.html-element').css('zoom', scaleValue);
        } else if(agent.indexOf('trident') != -1) { // IE 11
            $('div.html-element').css('zoom', scaleValue)
                .each(function(idx) {
                    var modelId = $(this).children('input[name=eleId]').val();
                    var obj = $('g[model-id=' + modelId + ']');
                    $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                });
        } else { // Chrome
            $('div.html-element')
                .css('-webkit-transform', 'scale(' + (scaleValue) + ')')
                .css('-webkit-transform-origin', '0 0')
                .each(function(idx) {
                    var modelId = $(this).children('input[name=eleId]').val();
                    var obj = $('g[model-id=' + modelId + ']');
                    $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                });
        }
    }
}

//상세화면 확대 버튼 이벤트
function plus() {
    if(scaleValue < 2.1) {
        scaleValue += 0.1;
        paper.scale(scaleValue, scaleValue);
        var agent = window.navigator.userAgent.toLowerCase();

        if(agent.indexOf('edge') != -1) { // Edge
            $('div.html-element').css('zoom', scaleValue);
        } else if(agent.indexOf('trident') != -1) { // IE 11
            $('div.html-element').css('zoom', scaleValue)
                .each(function(idx) {
                    var modelId = $(this).children('input[name=eleId]').val();
                    var obj = $('g[model-id=' + modelId + ']');
                    $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                });
        } else { // Chrome
            $('div.html-element')
                .css('-webkit-transform', 'scale(' + (scaleValue) + ')')
                .css('-webkit-transform-origin', '0 0')
                .each(function(idx) {
                    var modelId = $(this).children('input[name=eleId]').val();
                    var obj = $('g[model-id=' + modelId + ']');
                    $(this).offset({ top : obj.offset().top, left : obj.offset().left });
                });
        }
    }
}

function showHide() {
    $('.showArea').toggle('fast', function() {
        if($('#showHide').hasClass('glyphicon-resize-full')) {
            $('#showHide').removeClass('glyphicon-resize-full')
                .addClass('glyphicon-resize-small')
                .parent('button').attr('data-original-title', '접기')
                .blur();
            $('div.panel-heading').css('display', 'none');
        } else {
            $('#showHide').removeClass('glyphicon-resize-small')
                .addClass('glyphicon-resize-full')
                .parent('button').attr('data-original-title', '펼치기')
                .blur();
            $('div.panel-heading').css('display', 'block');
        }

        $(window).trigger('resize');
    });
}
