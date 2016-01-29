var addrTextArray=new Array()
var editFlag=false
	function publishTrav(t){
		t.classList.remove("opacity")	
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.classList.add("opacity")
		var publish=document.getElementById("nobr")
		var title1="发布成功"
		titleE.innerHTML=document.getElementById("title").value
		var title2=document.createElement("p")
		titleE.innerHTML="------------以下为存入数据库信息，开发版本可见--------------"
		document.querySelector(".edit").appendChild(title1)
		document.querySelector(".edit").appendChild(title2 )
		var titleE=document.createElement("p")
		titleE.innerHTML=document.getElementById("title").value
		if(!editFlag){
			// document.querySelector(".edit").innerHTML=""
			document.querySelector(".edit").appendChild(titleE)
			
		}
		
		var RouteNewList=document.querySelectorAll(".addRouteNewBlock")
		var lenRoute=RouteNewList.length
		// alert(lenRoute)
		console.log("lenRoute:"+lenRoute)
		var routeListArray=new Array()
		for(var i=0;i<lenRoute;i++){
			

			var imgBlockList=RouteNewList.item(i).querySelectorAll(".imgBlockSmallBlock")

			var lenImg=imgBlockList.length
			console.log("lenImg:"+lenImg)
			var addrImgArray=new Array()
			
			var addrName=RouteNewList.item(i).querySelector(".addrNewBlock").innerHTML
			
			var addrE=document.createElement("p")
			addrE.innerHTML=addrName
			if(!editFlag){
				document.querySelector(".edit").appendChild(addrE)
			}
			var routrT=document.createElement("div")
			routrT.innerHTML=addrName
			routrT.classList.add("addrNewBig")
			routrT.classList.add("height")
			if(!editFlag){
				// publish.innerHTML=""
				publish.appendChild(routrT)
			}
			

			for(var j=0;j<lenImg;j++){

				var imgTemp=document.createElement("div")
				imgTemp.innerHTML=imgBlockList.item(j).innerHTML
				imgTemp.classList.add("imgBlockSmallBlockNew")
				imgTemp.firstElementChild.nextElementSibling.classList.add("hidden")
				if(!editFlag)
				publish.appendChild(imgTemp)

				var imgSrc=imgBlockList.item(j).firstElementChild.src

				var imgE=document.createElement("p")
				imgE.innerHTML=imgSrc
				if(!editFlag)
				document.querySelector(".edit").appendChild(imgE)
				var imgText=imgBlockList.item(j).nextElementSibling.value

				console.log("nodeName:"+imgBlockList.item(j).nextElementSibling.value)

				var imgT=document.createElement("p")
				imgT.innerHTML=imgText
				console.log("imgText:"+imgText)
				if(!editFlag)
				document.querySelector(".edit").appendChild(imgT)
				var imgSpan=document.createElement("div")
				imgSpan.classList.add("inline")
				imgSpan.innerHTML=imgText
				imgSpan.classList.add("margin")
				if(!editFlag)
				publish.appendChild(imgSpan)
				addrImgArray.push(imgSrc)
				addrTextArray.push(imgText)
			}
			// alert(addrTextArray.toString())
			routeListArray.push(addrImgArray)
		}
		// editFlag=true
		document.querySelector(".imgList").classList.add("hidden")
		document.querySelector(".modify").classList.add("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
		document.querySelector(".edit").classList.remove("hidden")
		document.querySelector(".publish").classList.remove("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
	}