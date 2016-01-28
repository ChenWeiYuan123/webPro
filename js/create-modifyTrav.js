function edit(){
		alert("排版的页面还没写完")
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
		document.querySelector(".modify").classList.add("hidden")
		document.getElementById("imgUpload").classList.remove("hidden")
	}
	function modifyTrav(t){
		t.classList.remove("opacity")
		document.querySelector(".head-main-button").firstElementChild.classList.add("opacity")
		document.querySelector(".modify").classList.remove("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
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
	function input(){
		if (document.querySelector(".imgList").firstElementChild) {
			document.getElementById("userForm").setAttribute("class", "user display");
			document.getElementById("background").setAttribute("class", "background display");
	    }else{
        	edit()
	    }
		
	}
	function bgdDis(){

		document.getElementById("userForm").setAttribute("class", "user hidden");
		document.getElementById("background").setAttribute("class", "background hidden");
	}