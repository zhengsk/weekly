<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原创文学</title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript" src="js/formInOutIt.js" ></script>
<script type="text/javascript" src="js/showList.js" ></script>

<script type="text/javascript" language="javascript" defer="defer">
  window.onload = function() 
  {
	  hideDiv();
	  rolinTab("rolin");
	  changeInput();
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
showall=request.QueryString("showall")
set rs=server.CreateObject("adodb.recordset")
'
'		sql="select count(ID) from article"  		'<!-----------这一小段代码是获得原创文学中共有多少篇文章---------->
'		rs.open sql,conn,0,1
'		allcount=rs(0)  '得到文章篇数,是为了得到上下篇文章链接需要这个参数
'		rs.close									'<!-----------这一小段代码到这里结束--------------------------->
		
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
rs.close

%>
  <div class="left">
		<h5><%=articletitle%></h5><!------------------------------------------------------------文章标题--------->
		<div class="article"><%=articlecontant%></div><!--------------------------------------------文章内容--------->
        	
        <div class="author"><%=authorinfo%></div>                             <!------------作者介绍--------->
        <div class="pre-nex"> <!--#include file="art-pre-next.asp"--> </div><!--------------------------------------------上下篇文章导航--------->
   	<div class="remark">
   		<!--#include file="art-remark.asp"--> 									
   	</div>
    <div class="remarkform">
		<form action="art-leaveword.asp?ID=<%=ID%>" name="msg" id="msg" method="post">
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
