<%--
  Class Name : EgovIndvdlSchdulManageList.jsp
  Description : 일정관리 월별/주간별/일별 조회
  Modification Information

      수정일         수정자                   수정내용
    -------    --------    ---------------------------
     2008.03.09    장동한          최초 생성

    author   : 공통서비스 개발팀 장동한
    since    : 2009.03.09

--%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<c:set var="pageTitle">
	<spring:message code="comCopSmtSim.title" />
</c:set>

<%@include
	file="/WEB-INF/jsp/egovframework/com/cms/include/cms_head.jsp"%>
<%@include file="/WEB-INF/jsp/egovframework/com/cms/include/cms_snb.jsp"%>

<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/fullcalendar.print.css' />" type="text/css" media="print">
<link rel="stylesheet" href="<c:url value='/css/egovframework/com/cms/fullcalendar.css' />"	type="text/css">

<script	src="<c:url value='/js/egovframework/com/cms/jquery-1.10.2.js' />"></script>
<script	src="<c:url value='/js/egovframework/com/cms/jquery-ui.custom.min.js' />"></script>
<script	src="<c:url value='/js/egovframework/com/cms/fullcalendar.js' />"></script>


<script type="text/javaScript" language="javascript">
	$(document).ready(
			function() {
				var date = new Date();
				var d = date.getDate();
				var m = date.getMonth();
				var y = date.getFullYear();

				/*  className colors

				className: default(transparent), important(red), chill(pink), success(green), info(blue)

				 */

				/* initialize the external events
				-----------------------------------------------------------------*/

				$('#external-events div.external-event').each(function() {

					// create an Event Object (http://arshaw.com/fullcalendar/docs/event_data/Event_Object/)
					// it doesn't need to have a start or end
					var eventObject = {
						title : $.trim($(this).text())
					// use the element's text as the event title
					};

					// store the Event Object in the DOM element so we can get to it later
					$(this).data('eventObject', eventObject);

					// make the event draggable using jQuery UI
					$(this).draggable({
						zIndex : 999,
						revert : true, // will cause the event to go back to its
						revertDuration : 0
					//  original position after the drag
					});

				});

				/* initialize the calendar
				-----------------------------------------------------------------*/

				var calendar = $('#calendar').fullCalendar(
						{
							header : {
								left : 'title',
								center : 'agendaDay,agendaWeek,month',
								right : 'prev,next today'
							},
							editable : true,
							firstDay : 1, //  1(Monday) this can be changed to 0(Sunday) for the USA system
							selectable : true,
							defaultView : 'month',

							axisFormat : 'h:mm',
							columnFormat : {
								month : 'ddd', // Mon
								week : 'ddd d', // Mon 7
								day : 'dddd M/d', // Monday 9/7
								agendaDay : 'dddd d'
							},
							titleFormat : {
								month : 'MMMM yyyy', // September 2009
								week : "MMMM yyyy", // September 2009
								day : 'MMMM yyyy' // Tuesday, Sep 8, 2009
							},
							allDaySlot : false,
							selectHelper : true,
							select : function(start, end, allDay) {
								var title = prompt('Event Title:');
								if (title) {
									calendar.fullCalendar('renderEvent', {
										title : title,
										start : start,
										end : end,
										allDay : allDay
									}, true // make the event "stick"
									);
								}
								calendar.fullCalendar('unselect');
							},
							droppable : true, // this allows things to be dropped onto the calendar !!!
							drop : function(date, allDay) { // this function is called when something is dropped

								// retrieve the dropped element's stored Event Object
								var originalEventObject = $(this).data(
										'eventObject');

								// we need to copy it, so that multiple events don't have a reference to the same object
								var copiedEventObject = $.extend({},
										originalEventObject);

								// assign it the date that was reported
								copiedEventObject.start = date;
								copiedEventObject.allDay = allDay;

								// render the event on the calendar
								// the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
								$('#calendar').fullCalendar('renderEvent',
										copiedEventObject, true);

								// is the "remove after drop" checkbox checked?
								if ($('#drop-remove').is(':checked')) {
									// if so, remove the element from the "Draggable Events" list
									$(this).remove();
								}

							},

							events : [ {
								title : 'All Day Event',
								start : new Date(y, m, 1)
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d - 3, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								id : 999,
								title : 'Repeating Event',
								start : new Date(y, m, d + 4, 16, 0),
								allDay : false,
								className : 'info'
							}, {
								title : 'Meeting',
								start : new Date(y, m, d, 10, 30),
								allDay : false,
								className : 'important'
							}, {
								title : 'Lunch',
								start : new Date(y, m, d, 12, 0),
								end : new Date(y, m, d, 14, 0),
								allDay : false,
								className : 'important'
							}, {
								title : 'Birthday Party',
								start : new Date(y, m, d + 1, 19, 0),
								end : new Date(y, m, d + 1, 22, 30),
								allDay : false,
							}, {
								title : 'Click for Google',
								start : new Date(y, m, 28),
								end : new Date(y, m, 29),
								url : 'http://google.com/',
								className : 'success'
							} ],
						});

			});

	<!--
	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fnTabMenuSelect(objArr) {

		var FLength = document.getElementsByName("tabMenu").length;

		for (var i = 0; i < FLength; i++) {
			if (i == objArr) {
				document.getElementsByName("tabMenu")[i].bgColor = '#BBBBBB';
			} else {
				document.getElementsByName("tabMenu")[i].bgColor = '#DDDDDD';
			}
		}

		//경로 이동
		if (objArr == 0)
			document.getElementById('SchdulView').src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />";

		if (objArr == 1)
			document.getElementById('SchdulView').src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do' />";

		if (objArr == 2)
			document.getElementById('SchdulView').src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />";

	}

	/* ********************************************************
	 * 등록 처리 함수
	 ******************************************************** */
	function fnInit() {
		fn_egov_main_tab("tabMonth");
		fnTabMenuSelect(0);
		do_resize(); // 추가...
	}

	/* ********************************************************
	 * IFRAME AUTO HEIGHT
	 ******************************************************** */
	function do_resize() {
		resizeFrame("SchdulView", 1);
	}

	function resizeFrame(ifr_id, re) {
		//가로길이는 유동적인 경우가 드물기 때문에 주석처리!
		var ifr = document.getElementById(ifr_id);
		var innerBody = ifr.contentWindow.document.body;
		var innerHeight = innerBody.scrollHeight
				+ (innerBody.offsetHeight - innerBody.clientHeight);
		//var innerWidth = document.body.scrollWidth + (document.body.offsetWidth - document.body.clientWidth);

		if (ifr.style.height != innerHeight) //주석제거시 다음 구문으로 교체 -> if (ifr.style.height != innerHeight || ifr.style.width != innerWidth)
		{
			ifr.style.height = innerHeight;
			//ifr.style.width = innerWidth;
			//ifr.attributes['height'] = innerHeight;
			//ifr.setAttribute("height",innerHeight);
		}

		if (!re) {
			try {
				innerBody.attachEvent('onclick', parent.do_resize);
				innerBody.attachEvent('onkeyup', parent.do_resize);
				//글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
			} catch (e) {
				innerBody.addEventListener("click", parent.do_resize, false);
				innerBody.addEventListener("keyup", parent.do_resize, false);
				//글작성 상황에서 클릭없이 타이핑하면서 창이 늘어나는 상황이면 윗줄 주석제거
			}
		}
	}

	function fn_egov_main_tab(objName) {
		document.getElementById("tabMonth").className = "";
		document.getElementById("tabWeek").className = "";
		document.getElementById("tabDay").className = "";

		document.getElementById(objName).className = "on";

		if (objName == 'tabMonth') {
			document.getElementById("SchdulView").src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageMonthList.do' />";
		} else if (objName == 'tabWeek') {
			document.getElementById("SchdulView").src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageWeekList.do' />";
		} else if (objName == 'tabDay') {
			document.getElementById("SchdulView").src = "<c:url value='/cop/smt/sim/EgovIndvdlSchdulManageDailyList.do' />";
		}
	}
	-->
</script>

<style>
/* #cal-wrap {
	width: 1100px;
	margin: 0 auto;
} */

#external-events {
	float: left;
	width: 150px;
	padding: 0 10px;
	text-align: left;
}

#external-events h4 {
	font-size: 16px;
	margin-top: 0;
	padding-top: 1em;
}

.external-event { /* try to mimick the look of a real event */
	margin: 10px 0;
	padding: 2px 4px;
	background: #3366CC;
	color: #fff;
	font-size: .85em;
	cursor: pointer;
}

#external-events p {
	margin: 1.5em 0;
	font-size: 11px;
	color: #666;
}

#external-events p input {
	margin: 0;
	vertical-align: middle;
}

#calendar {
	/* 		float: right; */
	/* margin: 0 auto; 
	width: 900px;*/
	background-color: #FFFFFF;
	border-radius: 6px;
	box-shadow: 0 1px 2px #C3C3C3;
}
</style>
</head>
<body onLoad="fnInit()">

	<div class="layout-container">
		<h2>${pageTitle}
			<spring:message code="title.list" />
		</h2>

		<div id="cal-wrap">

			<div id="calendar" class="fc fc-ltr">
				<table class="fc-header" style="width: 100%">
					<tbody>
						<tr>
							<td class="fc-header-left"><span class="fc-header-title"><h2>May
										2019</h2></span></td>
							<td class="fc-header-center"><span
								class="fc-button fc-button-agendaDay fc-state-default fc-corner-left"
								unselectable="on">day</span><span
								class="fc-button fc-button-agendaWeek fc-state-default"
								unselectable="on">week</span><span
								class="fc-button fc-button-month fc-state-default fc-corner-right fc-state-active"
								unselectable="on">month</span></td>
							<td class="fc-header-right"><span
								class="fc-button fc-button-prev fc-state-default fc-corner-left"
								unselectable="on"><span class="fc-text-arrow">‹</span></span><span
								class="fc-button fc-button-next fc-state-default fc-corner-right"
								unselectable="on"><span class="fc-text-arrow">›</span></span><span
								class="fc-header-space"></span><span
								class="fc-button fc-button-today fc-state-default fc-corner-left fc-corner-right fc-state-disabled"
								unselectable="on">today</span></td>
						</tr>
					</tbody>
				</table>
				<div class="fc-content" style="position: relative;">
					<div class="fc-view fc-view-month fc-grid"
						style="position: relative" unselectable="on">
						<div class="fc-event-container"
							style="position: absolute; z-index: 8; top: 0; left: 0">
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 259px; width: 121px; top: 66px;">
								<div class="fc-event-inner">
									<span class="fc-event-title">All Day Event</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end info"
								style="position: absolute; left: 771px; width: 125px; top: 385px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">4p</span><span
										class="fc-event-title">Repeating Event</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end info"
								style="position: absolute; left: 771px; width: 125px; top: 491px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">4p</span><span
										class="fc-event-title">Repeating Event</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end important"
								style="position: absolute; left: 259px; width: 121px; top: 509px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">10:30a</span><span
										class="fc-event-title">Meeting</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end important"
								style="position: absolute; left: 259px; width: 121px; top: 527px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">12p</span><span
										class="fc-event-title">Lunch</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<div
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end"
								style="position: absolute; left: 387px; width: 121px; top: 491px;">
								<div class="fc-event-inner">
									<span class="fc-event-time">7p</span><span
										class="fc-event-title">Birthday Party</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div>
							</div>
							<a href="http://google.com/"
								class="fc-event fc-event-hori fc-event-draggable fc-event-start fc-event-end success"
								style="position: absolute; left: 131px; width: 249px; top: 491px;"><div
									class="fc-event-inner">
									<span class="fc-event-title">Click for Google</span>
								</div>
								<div class="ui-resizable-handle ui-resizable-e">&nbsp;&nbsp;&nbsp;</div></a>
						</div>
						<table class="fc-border-separate" style="width: 100%"
							cellspacing="0">
							<thead>
								<tr class="fc-first fc-last">
									<th class="fc-day-header fc-mon fc-widget-header fc-first"
										style="width: 128px;">Mon</th>
									<th class="fc-day-header fc-tue fc-widget-header"
										style="width: 128px;">Tue</th>
									<th class="fc-day-header fc-wed fc-widget-header"
										style="width: 128px;">Wed</th>
									<th class="fc-day-header fc-thu fc-widget-header"
										style="width: 128px;">Thu</th>
									<th class="fc-day-header fc-fri fc-widget-header"
										style="width: 128px;">Fri</th>
									<th class="fc-day-header fc-sat fc-widget-header"
										style="width: 128px;">Sat</th>
									<th class="fc-day-header fc-sun fc-widget-header fc-last">Sun</th>
								</tr>
							</thead>
							<tbody>
								<tr class="fc-week fc-first">
									<td
										class="fc-day fc-mon fc-widget-content fc-other-month fc-past fc-first"
										data-date="2019-04-29"><div style="min-height: 106px;">
											<div class="fc-day-number">29</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-tue fc-widget-content fc-other-month fc-past"
										data-date="2019-04-30"><div>
											<div class="fc-day-number">30</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2019-05-01"><div>
											<div class="fc-day-number">1</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2019-05-02"><div>
											<div class="fc-day-number">2</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2019-05-03"><div>
											<div class="fc-day-number">3</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past"
										data-date="2019-05-04"><div>
											<div class="fc-day-number">4</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sun fc-widget-content fc-past fc-last"
										data-date="2019-05-05"><div>
											<div class="fc-day-number">5</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-mon fc-widget-content fc-past fc-first"
										data-date="2019-05-06"><div style="min-height: 105px;">
											<div class="fc-day-number">6</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2019-05-07"><div>
											<div class="fc-day-number">7</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2019-05-08"><div>
											<div class="fc-day-number">8</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2019-05-09"><div>
											<div class="fc-day-number">9</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2019-05-10"><div>
											<div class="fc-day-number">10</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past"
										data-date="2019-05-11"><div>
											<div class="fc-day-number">11</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sun fc-widget-content fc-past fc-last"
										data-date="2019-05-12"><div>
											<div class="fc-day-number">12</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-mon fc-widget-content fc-past fc-first"
										data-date="2019-05-13"><div style="min-height: 105px;">
											<div class="fc-day-number">13</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2019-05-14"><div>
											<div class="fc-day-number">14</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2019-05-15"><div>
											<div class="fc-day-number">15</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2019-05-16"><div>
											<div class="fc-day-number">16</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2019-05-17"><div>
											<div class="fc-day-number">17</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past"
										data-date="2019-05-18"><div>
											<div class="fc-day-number">18</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sun fc-widget-content fc-past fc-last"
										data-date="2019-05-19"><div>
											<div class="fc-day-number">19</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-mon fc-widget-content fc-past fc-first"
										data-date="2019-05-20"><div style="min-height: 105px;">
											<div class="fc-day-number">20</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2019-05-21"><div>
											<div class="fc-day-number">21</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-wed fc-widget-content fc-past"
										data-date="2019-05-22"><div>
											<div class="fc-day-number">22</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-past"
										data-date="2019-05-23"><div>
											<div class="fc-day-number">23</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-past"
										data-date="2019-05-24"><div>
											<div class="fc-day-number">24</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sat fc-widget-content fc-past"
										data-date="2019-05-25"><div>
											<div class="fc-day-number">25</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-sun fc-widget-content fc-past fc-last"
										data-date="2019-05-26"><div>
											<div class="fc-day-number">26</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 18px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week">
									<td class="fc-day fc-mon fc-widget-content fc-past fc-first"
										data-date="2019-05-27"><div style="min-height: 105px;">
											<div class="fc-day-number">27</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-tue fc-widget-content fc-past"
										data-date="2019-05-28"><div>
											<div class="fc-day-number">28</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-wed fc-widget-content fc-today fc-state-highlight"
										data-date="2019-05-29"><div>
											<div class="fc-day-number">29</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-thu fc-widget-content fc-future"
										data-date="2019-05-30"><div>
											<div class="fc-day-number">30</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td class="fc-day fc-fri fc-widget-content fc-future"
										data-date="2019-05-31"><div>
											<div class="fc-day-number">31</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sat fc-widget-content fc-other-month fc-future"
										data-date="2019-06-01"><div>
											<div class="fc-day-number">1</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sun fc-widget-content fc-other-month fc-future fc-last"
										data-date="2019-06-02"><div>
											<div class="fc-day-number">2</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 54px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
								<tr class="fc-week fc-last">
									<td
										class="fc-day fc-mon fc-widget-content fc-other-month fc-future fc-first"
										data-date="2019-06-03"><div style="min-height: 105px;">
											<div class="fc-day-number">3</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-tue fc-widget-content fc-other-month fc-future"
										data-date="2019-06-04"><div>
											<div class="fc-day-number">4</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-wed fc-widget-content fc-other-month fc-future"
										data-date="2019-06-05"><div>
											<div class="fc-day-number">5</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-thu fc-widget-content fc-other-month fc-future"
										data-date="2019-06-06"><div>
											<div class="fc-day-number">6</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-fri fc-widget-content fc-other-month fc-future"
										data-date="2019-06-07"><div>
											<div class="fc-day-number">7</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sat fc-widget-content fc-other-month fc-future"
										data-date="2019-06-08"><div>
											<div class="fc-day-number">8</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
									<td
										class="fc-day fc-sun fc-widget-content fc-other-month fc-future fc-last"
										data-date="2019-06-09"><div>
											<div class="fc-day-number">9</div>
											<div class="fc-day-content">
												<div style="position: relative; height: 0px;">&nbsp;</div>
											</div>
										</div></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div style="clear: both"></div>
		</div>
	</div>

	<%@include
		file="/WEB-INF/jsp/egovframework/com/cms/include/cms_footer.jsp"%>