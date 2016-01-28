document.addEventListener("dragstart", function(event) {
	    event.dataTransfer.setData("id", event.target.id);

	});
		document.addEventListener("dragend", function(event) {

	});

	document.addEventListener("dragover", function(event) {
	    event.preventDefault();
	});

	document.addEventListener("drop", function(event) {
	    event.preventDefault();
	    if ( event.target.className == "addRouteNew" ) {
	        var data = event.dataTransfer.getData("id");
	        event.target.appendChild(document.getElementById(data));
	        event.target.firstElementChild.innerHTML=""
	        if (document.querySelector(".imgList").firstElementChild) {
	        }else{
	        	document.getElementById("add").innerHTML="图片选择完毕，请点击开始编辑排版"
	        	document.querySelector(".imgList").classList.add("hidden")
	        	// document.getElementById("add").onclick=edit
	        }
	    }
	});

	function drag(e){
		e.dataTransfer.setData("id",e.target.id);
	}
	function drop(e){
		event.preventDefault();
		var d=e.dataTransfer.getData("id");
		e.target.appendChild(document.getElementById(d));

	}
	function allowdrag(e){
		e.preventDefault();
	}