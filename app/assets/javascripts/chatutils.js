
var unselected = '';
var selected = 'rgb(255,232,179)';

function reshade(e){
	var e = document.getElementById(e);
	if (e.style.backgroundColor == unselected){
		e.style.backgroundColor = selected;
	} else {
		e.style.backgroundColor = unselected;
	}
}

function toggle(e){
	var e = document.getElementById(e);
	if (e.checked){
		e.checked=false;
	} else {
		e.checked=true;
	}
}

$(document).ready(function(){
	$(".hide").hide();

})