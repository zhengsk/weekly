<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>福建农林大学___人物周刊网</title>
		<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
		<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
	</head>
<body class="home">
	<h1 id="top"><img src="image/logo.gif" /></h1>
    <ul class="navi">
    	<li><a >首页</a></li>
    	<li><a href="people.asp">本周人物</a></li>
    	<li><a href="article.asp">原创文学</a></li>
        <li><a href="college.asp">专业交流</a></li>
        <li><a href="#">CET</a></li>
        <li><a href="elective.asp">选修课</a></li>
        <li><a href="#">公共课</a></li>
        <li><a href="forum.asp">论坛</a></li>
  	</ul>

<div id="main">
<div id="inmain">
  <!-------------------------------------校内新闻---------------------------------------------------------------------------->
  <ul class="news">
    <span><a href="news.asp">校内新闻</a></span>
    
	<%
		set rs=server.CreateObject("adodb.recordset")
		sql="select top 8 [ID],[title],[contant],[author] from news order by ID desc "
		rs.open sql, conn ,0,1         							 '打开新闻数据库
	%>
    <% do until  rs.eof%>
	<li>
    	<a href="news.asp?ID=<%response.Write(rs("ID"))%>" title="作者:<%=rs("author")%>">
    
      	<% 	'以下修剪新闻题目长度并输出
	  		a=rs("title")
			if len(a)>10 then a=left(a,10)&"…"
			response.Write(a&"</a></li>")
    		rs.movenext
			loop
			rs.close											 '关闭新闻数据库
		%>
  </ul>
  <!-------------------------------------失物认领---------------------------------------------------------------------------->
  <ul class="lost">
    <span><a href="lost.asp">失物认领</a></span>
    <%
		sql="select top 8 [title] from lost order by ID desc "
		rs.open sql, conn ,0,1									'打开失物认领数据库
		dim i
		i=2
	%>
    <% 
		do until  rs.eof
			i=i+1
			if i=cint("9") then i=10	'为了在倒二个能够链接到最到一个锚点10
			if i=11 then i=10			'为了在最后一个能够国链接到最到一个锚点10
	%>
    <li>
    	<a href="lost.asp#<%=i%>">
      		<% a=rs("title")
			if len(a)>10 then a=left(a,10)&"…"
			response.Write(a&"</a></li>")
    		rs.movenext
			loop
			rs.close											 '关闭新闻数据库
		%>
  </ul>
  <!------------------------------------本周人物----------------------------------------------------------------------------->
  <div id="people">
    <h3><b>Persons of the Week</b><span>本周人物</span><a href="people.asp"></a></h3>
    <% 
		sql="select top 1 * from people order by ID desc "
		rs.open sql, conn,0,1										 '打开人物数据库
	infor="<li>"&rs("name")&"</li>"
	for i=7 to 13
		if rs(i)<>"" then
			select case i
				case 7
					infor=infor&"<li>"&rs(7)
				case 8
					if rs(8)<>empty then
						infor=infor&"&nbsp;&nbsp;&nbsp;身高："&rs(8)&"cm</li>"
					else
						infor=infor&"</li>"
					end if
				case 12
					infor=infor&"<li>特长："&rs(12)&"</li>"
				case 13
					infor=infor&"<li>兴趣："&rs(13)&"</li>"
				case else
					infor=infor&"<li>"&rs(i)&"</li>"
			end select
		end if 
	next

	%>
    <img src="<%=rs("home_img")%>" title="本周人物" />
    <ul>
    	<%=infor%>
    </ul>
    <h5><%=rs("title")%></h5>
    <p><%=rs("s_contant")%></p>
    <% 	
		rs.close												'关闭人物数据库	
	%>
  </div>
  <!---------------------------------原创文学-------------------------------------------------------------------------------->
  <div id="article">
    <h3><b>Original Articles</b><span>原创文学</span><a href="article.asp"></a></h3>
    <% 
		sql="select top 1 [title],[author],[s_contant] from article order by ID desc "
		rs.open sql, conn,0,1										 '打开原创文学数据库
	%>
 
    <h5><% response.Write(rs("title"))%> </h5>
    <p><% response.Write(rs("s_contant"))%> </p>
    <% 
		 rs.close											'关系原创文学数据库
	%>
  </div>
  <!------------------------------------商店推荐----------------------------------------------------------------------------->
  <div id="store">
  <h3><b>Recommended store</b><span>商店推荐</span><a href="store.asp"></a></h3>
  	<% 
		sql="select top 1 [title],[s_contant],[home_img] from store order by ID desc "
		rs.open sql, conn,0,1										 '打开商店推荐数据库
    response.Write("<h5>" & rs("title") & "</h5><img src=""" &rs("home_img") & """ /><p>"&rs("s_contant")&"</p>")
		rs.close													'关闭商店推荐数据库
		set rs=nothing 											 	'释放recordset对象
		conn.close
		set conn=nothing
	%>
    <br style=" display:block; clear:both;" />
  </div>
</div>
</div>
<!----------------------------------------------页脚------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008&#8212;2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com <a href="http://www.vdoing.com" title="Vdoing StatsX No.55174"><img src="http://simg.vdoing.com/m/55174/x01.gif" border="0" width="15"></a></em></h1>

<!----------------------------------------------论坛------------------------------------------------------------------->
<span> <img src="image/forum-bg.gif" class="forum"/> </span>
<div id="forum">
  <iframe src="default.asp" align="middle" scrolling="no" width="200" height="150%" frameborder="0" ></iframe>
</div>

</body>
</html>
