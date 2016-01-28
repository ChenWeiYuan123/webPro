function editTrav(t){

		t.classList.remove("opacity")	
		document.querySelector(".head-main-button").firstElementChild.nextElementSibling.classList.add("opacity")

		document.querySelector(".edit").classList.remove("hidden")
		// document.querySelector(".modify").classList.add("hidden")

		showEdit()
	}
	function showEdit(){


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
				if(j!=lenImg-1){
					
					RouteNewList.item(i).insertBefore(comment,imgBlockList.item(j).nextElementSibling)
				}else{
					RouteNewList.item(i).appendChild(comment)
				}
				var imgSrc=imgBlockList.item(j).firstElementChild.src
				var imgE=document.createElement("p")
				imgE.innerHTML=imgSrc
				// document.querySelector(".edit").appendChild(imgE)
				addrImgArray.push(imgSrc)
			}
			routeListArray.push(addrImgArray)
		}
		document.getElementById("add").innerHTML="发布行程"
		
	}

	function changeBlock(list,Class,classOld){	
			list.classList.remove(classOld)
			list.classList.add(Class)
	}