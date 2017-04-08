<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本周人物--人物修改、留言修改与删除 </title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/people.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
.infor p.modifyAll,.remark table td p.modifyThisRemark{background-color:#333; text-align:center;}
.infor p.modifyAll a,.remark table td p.modifyThisRemark a{color:#FFF; border-bottom:2px solid #F00; padding:3px; margin: auto 5px;}
.infor p.modifyAll a:hover,.remark table td p.modifyThisRemark a:hover{ background-color:#FFF; color:#000;}

</style>
<script type="text/javascript"  src="js/formInOutIt.js"></script>
<script type="text/javascript"  src="js/peoplePic.js"></script>
<script type="text/javascript" language="javascript" defer="defer">
//-------为了本合IE6的问题,把评分里要用到的全局变量调到这里来-------------------  
var maxScore=5; //分数最大分值,只能3到10个
var imgOn="image/star_big.gif"; //打开的分数图--------
var imgOff="image/star_big_off.gif";//关闭的图片分数---
var allImg=""
//-------为了适合IE6的问题,把评分里要用到的全局变量调到这里来-------------------

  var showall="false"
  var xmlHttp = false;
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
	creatObject();
	 if(showall=="false")
	  {
		  showall="true"
		}
		else
		{
			showall="false"
		}
	  var theID=document.getElementById("theID").value
	  var url="admin-peo-remark-for-ajax.asp?id="+ theID +"&showall="+ showall
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
	  iFocusChange();
	  changeInput();
	  showAll();
	  vote("voteImg");
	  overImg();//这里调用此函数是为了第一次加载把初值绍它;
	  face(3);
	  ifExistChildWindow();
  }
</script>
</head>
<body >
	<h1 id="top"><img src="image/logo.gif" /></h1>
<ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a class="here">本周人物</a></li>
    <li><a href="article.asp">原创文学</a></li>
    <li><a href="college.asp">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a href="elective.asp">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
</ul>


<%  dim week
	week=request.QueryString("week")
	showall=request.QueryString("showall")
	set rs=server.CreateObject("adodb.recordset")
	if week="" or week=empty then 
		sql="select top 1 * from people order by week desc"
	else
		sql="select * from people where week="&week
	end if 
	rs.open sql,conn,0,1
	week=rs("week")
	dim infor                  '定义一个变量为要列出的人物的简介
	infor="<li><span>"&rs("name")&"<img src=""image/peo-sex01.gif"" ></span></li>"
	for i=7 to 13
		if rs(i)<>"" then
			select case i
				case 8
					infor=infor&"<li>身高："&rs(i)&"cm</li>"
				case 12
					infor=infor&"<li>特长："&rs(i)&"</li>"
				case 13
					infor=infor&"<li>兴趣："&rs(i)&"</li>"
				case else
					infor=infor&"<li>"&rs(i)&"</li>"
			end select
		end if 
	next
	dim l_img,s_img,motto,experience,title,contant '其各项内容
	l_img=rs("l_img"):s_img=rs("s_img"):motto=rs("motto"):title=rs("title"):contant=rs("contant")
	if rs("experience")<>"" or rs("experience")<>empty then experience="<br />经历："& rs("experience")
	rs.close
%>
	<input name="theID" id="theID" type="hidden" value="<%=week%>" />
<div class="people">


	<div class="infor">
        <p class="modifyAll">
        <a href="admin/peo-modify.asp?week=<%=week%>" target="_blank">修改当前页面</a>
        </p>
      <div id="ifocus">
        <div id="ifocus_pic">
      <div id="ifocus_piclist" style="left:0; top:0;"><!----------这个大图片------->
          <ul>
          		<%
					l_img=split(l_img,"|")
				for i=1 to 4
					response.Write("<li><a href=""#""><img src=" &l_img(i)&" alt="""" /></a></li>")
				next
					
				%>
		  </ul>
    </div>
    <div id="ifocus_opdiv"></div>
        <div id="ifocus_tx">
          <ul>
            	<li class="current">1</li>
                <li class="normal">2</li>
                <li class="normal">3</li>
                <li class="normal">4</li>
          </ul>
    </div>
    </div>
    <div id="ifocus_btn">										<!----------这个小图片------->
        <ul>
          		<%
					s_img=split(s_img,"|")
					response.Write("<li class=""current""><a href=""#""><img src=" &s_img(1)&" alt="""" /></a></li>")
				for i=2 to 4
					response.Write("<li class=""normal""><a href=""#""><img src=" &s_img(i)&" alt="""" /></a></li>")
				next
					
				%>
        </ul>
    </div>
 </div><!--ifocus end输出图片的地方-->

   	  <ul class="peoinfor">
		<%=infor%>      <!--在这里输出人物简介-->
      </ul>
        <p>
			<%=motto&experience%> 
      	</p>
        <br />
  </div>


     <div class="contant">
  			<h1><%=title%></h1>
     	<%=contant%>
			
     </div>
        <div class="pre-nex"> <!--#include file="admin-peo-pre-next.asp"--> </div><!--------------------------------------------上下篇人物导航--------->
     <div class="remark" id="remark">
     <!--#include file="admin-peo-remark.asp"-->
     </div>
     <div class="remarkform">
		<form action="peo-check-leaveword.asp?week=<%=week%>" name="msg" id="msg" method="post">
        	<label for="user">评委: </label><input type="text" name="user" id="user" />&nbsp;&nbsp;&nbsp;
            分数:<label id="voteImg" ></label><input name="score" id="score" type="hidden" value="2" />
        <div class="face">
                	<img src="image/s1.jpg" id="img1" name="x" />
             		<img src="image/s2.jpg" id="img2" name="y"/>
                	<img src="image/s3.jpg" id="img3" name="z"/>
                <input name="face" id="face" type="hidden"/>
       	  </div>
          <textarea name="message" cols="85" rows="5" ></textarea>
          <input name="ok" id="ok" type="submit" value="提交留言" style="padding:5px; color:#899BE4; margin-top:1em;" /> 
	   </form>
	</div>

</div>
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</body>
</html>
