var addrTextArray=new Array()
	function publishTrav(t){
		t.classList.remove("opacity")	
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.classList.add("opacity")
		
		var publish=document.getElementById("nobr")

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
			document.querySelector(".edit").appendChild(addrE)

			var routrT=document.createElement("div")
			routrT.innerHTML=addrName
			routrT.classList.add("addrNewBig")
			routrT.classList.add("height")
			publish.appendChild(routrT)

			for(var j=0;j<lenImg;j++){

				var imgTemp=document.createElement("div")
				imgTemp.innerHTML=imgBlockList.item(j).innerHTML
				imgTemp.classList.add("imgBlockSmallBlockNew")
				imgTemp.firstElementChild.nextElementSibling.classList.add("hidden")
				publish.appendChild(imgTemp)

				var imgSrc=imgBlockList.item(j).firstElementChild.src

				var imgE=document.createElement("p")
				imgE.innerHTML=imgSrc
				document.querySelector(".edit").appendChild(imgE)
				var imgText=imgBlockList.item(j).nextElementSibling.value

				console.log("nodeName:"+imgBlockList.item(j).nextElementSibling.value)

				var imgT=document.createElement("p")
				imgT.innerHTML=imgText
				console.log("imgText:"+imgText)
				
				document.querySelector(".edit").appendChild(imgT)
				var imgSpan=document.createElement("div")
				imgSpan.classList.add("inline")
				imgSpan.innerHTML=imgText
				imgSpan.classList.add("margin")
				publish.appendChild(imgSpan)
				addrImgArray.push(imgSrc)
				addrTextArray.push(imgText)
			}
			// alert(addrTextArray.toString())
			routeListArray.push(addrImgArray)
		}
		document.querySelector(".edit").classList.add("hidden")
		document.querySelector(".modify").classList.add("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
		document.querySelector(".publish").classList.remove("hidden")
	}