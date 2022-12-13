function insertCheck(){
	if(frm.artist_id.value.length == 0){
		alert("참가번호가 입력되지 않았습니다!");
		frm.artist_id.focus();
		return false;
	}
	else if(frm.artist_name.value.length == 0){
		alert("참가자명이 입력되지 않았습니다!");
		frm.artist_name.focus();
		return false;
	}
	else if(frm.date1.value.length == 0||frm.date2.value.length == 0||frm.date3.value.length == 0){
		alert("생년월일이 입력되지 않았습니다!");
		frm.date1.focus();
		return false;
	}
	else if(frm.gender[0].checked == false && frm.gender[1].checked == false){
		alert("성별이 입력되지 않았습니다!");
		frm.gender.focus();
		return false;
	}
	else if(frm.talent.value==""){
		alert("특기가 입력되지 않았습니다!");
		frm.talent.focus();
		return false;
	}
	else if(frm.agency.value.length==0){
		alert("소속사가 입력되지 않았습니다!");
		frm.agency.focus();
		return false;
	}
	else {
		alert("참가신청이 정상적으로 등록되었습니다!");
		documnet.frm.submit();
		return true;
	}
}
function res(){
	alert("정보를 지우고 다시 입력합니다!");
	document.frm.reset();
}