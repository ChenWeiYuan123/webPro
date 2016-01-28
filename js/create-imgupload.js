document.querySelector(".head-main-button").firstElementChild.classList.remove("opacity")
	var name=""
	var upload=false
	function imgShow(){
		document.getElementById("img").width="100%"
	}
	function show(){

		if(!upload){
			var file = document.getElementById("file").files
			var imgUpload=document.getElementById("imgUpload")
	
			var p=imgUpload.getElementsByTagName("p")
			imgUpload.removeChild(p[0])
			var p=imgUpload.getElementsByTagName("p")
			imgUpload.removeChild(p[0])
	
			var fileLen=file.length
			
			for(var i=0;i<fileLen;i++){
				name+=file[i].name+"/"
				var imgBlock=document.createElement("div")
				imgBlock.setAttribute("class","imgBlock")
				var newImg=document.createElement("img")
				newImg.setAttribute("width","100%")
				newImg.id="img"+i.toString()
				newImg.src=file[i].name
				imgBlock.appendChild(newImg)
				var imgName=document.createTextNode(file[i].name)
				imgBlock.appendChild(imgName)
				imgUpload.appendChild(imgBlock)
			}
			document.getElementById("fileDiv").classList.add("hidden")
			
		}
	}