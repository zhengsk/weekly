<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原创文学</title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
 p.modifyAll,.remark table td p.modifyThisRemark{background-color:#333; text-align:center;}
 p.modifyAll{padding:10px; text-align:center; margin-top:20px;}
 p.modifyAll a,.remark table td p.modifyThisRemark a{color:#FFF; border-bottom:2px solid #F00; padding:3px; margin: auto 5px;}
 p.modifyAll a:hover,.remark table td p.modifyThisRemark a:hover{ background-color:#FFF; color:#000;}

</style>

<script type="text/javascript" src="js/formInOutIt.js" ></script>
<script type="text/javascript" src="js/showList.js" ></script>
<script type="text/javascript" language="javascript" defer="defer">
// JavaScript Document
  var xmlHttp = false;
  var showall="false"
  function creatObject() //创建一个XmlHttp对象
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
		theButton.item(i).onmouseout=function(){this.className="outIE6"}//这一句是为了在IE6中没有链接的A在鼠标经过时不能改变样式的弥补
		theButton.item(i).onclick=function (){mainAjax()};
		}
	  }
	  else
	  {
		  return
	  }
  		
  }
  
  function mainAjax()		//对象上的函数 , 为主要的Ajax方法.
  {
	 if(showall=="false")
	  {
		  showall="true"
		}
		else
		{
			showall="false"
		}
	  var theID=document.getElementById("theID").value
	  var thePage=document.getElementById("thePage").value
	  var url="admin-art-remark-for-ajax.asp?id="+ theID +"&showall="+ showall
	  xmlHttp.open("GET", url, true);
	  xmlHttp.onreadystatechange=getData;
	  xmlHttp.send(null);
	  setTimeout(showAll,1000); //这个的作用是对于函数的初使化. 如果没有它,当第二次,第三次以后的点击没有反应.
  }
  
  function getData() //把数据插入到页面中
  {
	  if (xmlHttp.readyState==4)
  		{
			var theData=xmlHttp.responseText;
			document.getElementById("remark").innerHTML=theData;
		}
  }
function modifyOrDelete(theLi)//这个函数是弹出一个子窗口,修改和删除留言
  {
		var left=window.screen.width/2-220
		var top=window.screen.height/2-250
	  	var windowprops="width=450,height=300,left="+left+",top="+top+",location=no,menubar=no,toolbar=no,status=no,resizable=no"
	 	childWindow=window.open(theLi.getAttribute("href"),"childPage",windowprops);
  }
function ifExistChildWindow()//使子窗口存在时,必须获得焦点
  {
	  window.onblur=function()
	  {
		if(window.childWindow){window.childWindow.focus()}
	  }
  }
  window.onload = function() 
  {
	  hideDiv();
	  rolinTab("rolin");
	  changeInput();
	  creatObject();
	  showAll();
	  ifExistChildWindow();
  }
</script>


</head>          

<body>
<div class="bgtop"><div class="bgbottom">

	<h1 id="top"><img src="image/logo.gif" /></h1>
  <ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a href="people.asp">本周人物</a></li>
    <li><a class="here">原创文学</a></li>
    <li><a href="college.asp">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a href="elective.asp">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
  </ul>
<!----------------------------------------------导航栏到此结束------------------------------------------------------------------->
<div class="main">
<%
ID=request.QueryString("ID")
set rs=server.CreateObject("adodb.recordset")
		
if ID="" then 
	sql="select top 1 * from article order by id desc"
else
	sql="select * from article where ID="&ID
end if 
rs.open sql,conn,0,1
dim ID,contant
ID=rs("ID")
articletitle=rs("title")
articlecontant=rs("contant")
authorinfo=rs("author_info")
authorImg=rs("author_img")
rs.close

if authorImg <>"" then 
else
authorImg="image/nopeole.gif"
end if
%>
	<input name="thePage" id="thePage" type="hidden" value="art" />
	<input name="theID" id="theID" type="hidden" value="<%=ID%>" />
  <div class="left">
        <p class="modifyAll">
        <a href="admin/art-modify.asp?id=<%=ID%>" target="_blank">修改当前页面</a>
        </p>
		<h5><%=articletitle%></h5><!------------------------------------------------------------文章标题--------->
		<div class="article"><%=articlecontant%></div><!--------------------------------------------文章内容--------->
        	
        <div class="author"><%="<img src="""&authorImg&"""/>"&authorinfo%><br class="clearit" /><span class="clearit" ></span></div>                             <!------------作者介绍--------->
        <div class="pre-nex"> <!--#include file="admin-art-pre-next.asp"--> </div><!--------------------------------------------上下篇文章导航--------->
   	<div class="remark" id="remark">
   		<!--#include file="admin-art-remark.asp"--> <!--------------------------------------------留言内容------------------------>	
   	</div>
    <div class="remarkform">
		<form action="art-check-leaveword.asp?ID=<%=ID%>" name="msg" id="msg" method="post">
        	<label for="user">评委:</label> <input type="text" name="user" id="user" />&nbsp;&nbsp;&nbsp;
            <label for="score">分数:</label> <input type="text" name="score"  id="score" />
            <span class="point">*百分制</span>
            <textarea name="message" cols="65" rows="5" ></textarea>
            <input style="padding:5px; color: #899BE4" name="ok" id="ok" type="submit" value="提交评论" />
		</form>
	</div>
  	</div>
    <a class="toallimg" href="art-showall.asp" title="查看更多文章" id="toall" onfocus="this.blur()"><div></div></a>
	<div class="newestarticle"><!------------------------------------------------------------------------热门文章--------->
        <p class="newest">最新文章</p>
        	<ul class="rolinList" id="rolin">
   		<!--#include file="art-newest.asp"--> <!--------------------------------------------左侧最新文章------------------------>	
        	</ul>
    </div>
    <div class="hotarticle">
    <p class="hot">热门文章</p>
       	<ul id="hotarticleUl">
   		<!--#include file="art-hot.asp"--> <!--------------------------------------------左侧最新文章------------------------>	
        </ul>
    </div>
	<div class="clear"></div><!-------------------------------------------------------------------清除浮动---------->
</div>
<!----------------------------------------------页脚------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</div></div>
</body>
</html>
