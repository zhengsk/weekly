 function hoverShow()//用于新闻列表,文章列表等列表的鼠标移过时改变样式的效果,替换了用CSS效果的缺陷
	{
	  	var everyList=document.getElementsByName("list");
	  
	  	  everyList.item(0).id="current";
		  everyList.item(0).className="ahover";
		  everyList.item(0).firstChild.className="titlehover";
		  everyList.item(0).lastChild.className="show_contant";

	  	for(var i=0; i<everyList.length; i++)
	  		{
				everyList.item(i).onmouseover=function()
				{
					var oldHover=document.getElementById("current");
						oldHover.removeAttribute("id");
						oldHover.className="";
						oldHover.firstChild.className="title";
						oldHover.lastChild.className="s_contant";
					this.id="current"
					this.className="ahover"
					this.firstChild.className="titlehover";
					this.lastChild.className="show_contant";
		 		}
	 		}
	  }
