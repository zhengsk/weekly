 function hoverShow()//���������б�,�����б���б������ƹ�ʱ�ı���ʽ��Ч��,�滻����CSSЧ����ȱ��
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
