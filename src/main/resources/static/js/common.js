/**
 * 공통부분 처리 (JS)
 */

//  리다이렉트
var commonRedirect = function (url) {
//	console.log("테스트");
//	
//	$.ajax({
//		 url : "/scheduleList"
//   		,type : "get"
//   		,dataType : "json"
//		,success : function(response) {
//		}
//		,exception : function(response) {
//		}
//	});
	
	$(location).attr('href', url);
}
