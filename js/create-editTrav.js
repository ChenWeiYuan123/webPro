var textareaFlag=false
function editTrav(t){

		t.classList.remove("opacity")	
		document.querySelector(".head-main-button").firstElementChild.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.classList.add("opacity")
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.nextElementSibling.nextElementSibling.classList.add("opacity")
		document.querySelector(".edit").classList.add("hidden")
		document.querySelector(".imgList").classList.add("hidden")
		// document.querySelector(".modify").classList.add("hidden")
		document.getElementById("nobr").innerHTML=""
		document.querySelector(".edit").innerHTML=""
		document.querySelector(".publish").classList.add("hidden")
		document.getElementById("imgUpload").classList.add("hidden")
		document.querySelector(".title").classList.remove("hidden")
		showEdit()
	}
	function showEdit(){
		document.querySelector(".modify").classList.remove("hidden")

		var RouteNewList=document.querySelectorAll(".addRouteNew")
		var lenRoute=RouteNewList.length
		

		var routeListArray=new Array()
		for(var i=0;i<lenRoute;i++){
			changeBlock(RouteNewList.item(i),"addRouteNewBlock","addRouteNew")

			var imgBlockList=RouteNewList.item(i).querySelectorAll(".imgBlockSmall")

			var lenImg=imgBlockList.length

			var addrImgArray=new Array()

			var addrName=RouteNewList.item(i).querySelector(".addrNew").innerHTML
			changeBlock(RouteNewList.item(i).querySelector(".addrNew"),"addrNewBlock","addrNew")
			var addrE=document.createElement("p")
			addrE.innerHTML=addrName
			// document.querySelector(".edit").appendChild(addrE)

			for(var j=0;j<lenImg;j++){
				changeBlock(imgBlockList.item(j),"imgBlockSmallBlock","imgBlockSmall")
				var comment=document.createElement("textarea")
				comment.setAttribute("placeholder","在此写上对照片的描述~")
				comment.rows=15
				comment.classList.add("text")
				if(!textareaFlag){
					
					if(j!=lenImg-1){
						
						RouteNewList.item(i).insertBefore(comment,imgBlockList.item(j).nextElementSibling)
					}else{
						RouteNewList.item(i).appendChild(comment)
					}
				}
				else{
					imgBlockList.item(j).nextElementSibling.classList.remove("hidden")
				}
				var imgSrc=imgBlockList.item(j).firstElementChild.src
				var imgE=document.createElement("p")
				imgE.innerHTML=imgSrc
				// document.querySelector(".edit").appendChild(imgE)
				addrImgArray.push(imgSrc)
			}
			routeListArray.push(addrImgArray)
		}
		if(!textareaFlag)
			textareaFlag=true
		document.getElementById("add").innerHTML="下一步[发布行程]"
		
	}

	function changeBlock(list,Class,classOld){	
			list.classList.remove(classOld)
			list.classList.add(Class)
	}