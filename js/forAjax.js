  var xmlHttp = false;
  var showall="false"
  function creatObject()
  {
	  try 
	  {
  		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	  } 
	catch (e) {
  			try 
			{
    			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  			} 
			catch (e2) 
			{
    			xmlHttp = false;
  			}
		}
	if (!xmlHttp && typeof XMLHttpRequest != 'undefined') 
	{
		xmlHttp = new XMLHttpRequest();
	}
  }
  
  function showAll()  //找到两个对象,用于显示还是隐藏评论,为对象设置函数
  {
	  if(document.getElementsByName("forAjax").length != 0)
	  {
		var theButton=document.getElementsByName("forAjax");
		for(var i=0; i<2;i++)
		{
		theButton.item(i).style.color="#617A1A";
		theButton.item(i).onmouseover=function(){this.className="hoverIE6"};
		theButton.item(i).onmouseout=function(){this.className="outIE6"};
		theButton.item(i).onclick=function (){mainAjax();};
		}
	  }
  }
  
  function mainAjax()		//对象上的函数 , 为主要的Ajax方法.
  {
	  var theButton=document.getElementsByName("forAjax")
	  for(var i=0;i<2; i++){
	  theButton[i].innerHTML="<img src=\"image/load.gif\" />&nbsp;Loading...."
	  theButton[i].style.backgroundColor="#DBE2C7"
	  theButton[i].onclick=function(){return false;};
	  theButton[i].onmouseover=function(){this.className="outIE6"};
	  }
	  creatObject();
	  if(showall=="false"){showall="true";}else{showall="false";};
	  var theID=document.getElementById("theID").value;
	  var thePage=document.getElementById("thePage").value;
	  var url=thePage+"-remark-for-ajax.asp?id="+ theID +"&showall="+ showall+"&time="+new Date().getTime();
	  xmlHttp.open("get", url, true);
	  xmlHttp.onreadystatechange=getData;
	  xmlHttp.send(null);
  }
  
  function getData() //把数据插入到页面中
  {
	  if (xmlHttp.readyState==4)
  		{
			var theData=xmlHttp.responseText;
			document.getElementById("remark").innerHTML=theData;
			showAll();
		}
  }

