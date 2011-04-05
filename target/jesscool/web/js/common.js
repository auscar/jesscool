function show_tab(tab_id){
	//var div_obj = 
	var tab_num = document.getElementById("cloth_tab").getElementsByTagName("li").length + 1;
	
	for(var i = 1; i < tab_num; i++){
		document.getElementById("tab_menu" + i).className = "";	
		document.getElementById("tab_box" + i).style.display = "none";	
	}
	
	document.getElementById("tab_menu" + tab_id).className = "current";	
	document.getElementById("tab_box" + tab_id).style.display = "block";	
	
}