var imgListFlag=false
function edit(flagText){
	if(flagText=="下一步[修改行程]"){
		modifyTrav(document.getElementById("modify"))
	}
	if(flagText=="图片选择完毕，下一步[编辑排版]"){
		editTrav(document.getElementById("edit"))
	}
	else if(flagText=="下一步[发布行程]"){
		publishTrav(document.getElementById("publish"))
	}
}
	function getAddr(){
		var textt=document.createTextNode("aaa")
		var addRouteOld=document.querySelector(".addRoute")
		var addRoute=document.createElement("div")
		addRoute.setAttribute("class","addRouteNew")
		addRoute.setAttribute("draggable","true")
		var addr=document.createElement("div")
		addr.setAttribute("class","addrNew")
		var add=document.createElement("span")
		add.innerHTML=document.getElementById("text").value
		var addNew=document.createElement("p")
		addNew.setAttribute("class","addNew")
		addNew.innerHTML="请把此景点的图片拖拽到这里"
		addRoute.appendChild(addNew)
		addr.appendChild(add)
		addRoute.appendChild(addr)
		document.querySelector(".modify").insertBefore(addRoute,addRouteOld)
		bgdDis()
	}
	function uploadImg(t){
		t.classList.remove("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".modify").classList.add("hidden")
		document.getElementById("imgUpload").classList.remove("hidden")
		document.querySelector(".edit").classList.add("hidden")
		document.querySelector(".title").classList.add("hidden")
		document.querySelector(".publish").classList.add("hidden")
		document.getElementById("imgUpload").classList.remove("hidden")
	}
	function modifyTrav(t){
		t.classList.remove("opacity")
		document.querySelector(".head-main-button").firstElementChild.classList.add("opacity")
		if(!imgListFlag){
			document.getElementById("imgList").classList.remove("hidden")
			imgListFlag=true
		}
		else{
			document.getElementById("imgList").classList.add("hidden")
		}
		document.getElementById("nobr").innerHTML=""
		document.querySelector(".edit").innerHTML=""
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".modify").classList.remove("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
		document.querySelector(".edit").classList.add("hidden")
		document.querySelector(".publish").classList.add("hidden")
		document.getElementById("add").innerHTML="添加地点"
		showEditRevese()
		showModify()
	}
	function showModify(){
		if(!upload){
			var namelist=name.split("/")	
			var nameLen=namelist.length
			var imgList=document.querySelector(".imgList")
			for(var i=0;i<nameLen-1;i++){
				var imgBlockSmall=document.createElement("div")
				imgBlockSmall.setAttribute("class","imgBlockSmall")
				imgBlockSmall.id="imgBlockSmall"+i.toString()
				imgBlockSmall.setAttribute("draggable","true")
				
				var newImg2=document.createElement("img")
				newImg2.setAttribute("width","100%")
				
				newImg2.id="img2"+i.toString()
				newImg2.src=namelist[i]
				newImg2.setAttribute("draggable","false")
				
				imgBlockSmall.appendChild(newImg2)
				var imgSpan=document.createElement("span")
				imgSpan.innerHTML=namelist[i]
				var imgName=document.createTextNode(namelist[i])
				imgBlockSmall.appendChild(imgSpan)
				imgList.appendChild(imgBlockSmall)
			}
			upload=true
		}
	}
	function input(t){
		var flagText=t.firstElementChild.innerHTML
		
		if (document.querySelector(".imgList").firstElementChild) {
			document.getElementById("userForm").setAttribute("class", "user display");
			document.getElementById("background").setAttribute("class", "background display");
	    }else{
        	edit(flagText)
	    }
		
	}
	function bgdDis(){

		document.getElementById("userForm").setAttribute("class", "user hidden");
		document.getElementById("background").setAttribute("class", "background hidden");
	}

	function showEditRevese(){


		var RouteNewList=document.querySelectorAll(".addRouteNewBlock")
		var lenRoute=RouteNewList.length

		for(var i=0;i<lenRoute;i++){
			changeBlock(RouteNewList.item(i),"addRouteNew","addRouteNewBlock")
			changeBlock(RouteNewList.item(i).querySelector(".addrNewBlock"),"addrNew","addrNewBlock")
			var imgBlockList=RouteNewList.item(i).querySelectorAll(".imgBlockSmallBlock")
			var lenImg=imgBlockList.length
			for(var j=0;j<lenImg;j++){
				// RouteNewList.item(i).removeChild(imgBlockList.item(j).nextElementSibling)
				imgBlockList.item(j).nextElementSibling.classList.add("hidden")
				changeBlock(imgBlockList.item(j),"imgBlockSmall","imgBlockSmallBlock")
				
			}
		}

		
	}