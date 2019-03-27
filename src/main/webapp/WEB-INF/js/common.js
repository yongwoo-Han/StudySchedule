/**
 * 공통부분 처리 (JS)
 */

// 개인 시간표
var identificationSchedule = function () {
	console.log("테스트");
	$.ajax({
		 url : "/scheduleList.do"
   		,type : "post"
   		,dataType : "json"
		,success : function(response) {
		}
		,exception : function(response) {
		}
	});
}