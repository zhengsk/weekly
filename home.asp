<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
		<title>����ũ�ִ�ѧ___�����ܿ���</title>
		<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
		<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
	</head>
<body class="home">
	<h1 id="top"><img src="image/logo.gif" /></h1>
    <ul class="navi">
    	<li><a >��ҳ</a></li>
    	<li><a href="people.asp">��������</a></li>
    	<li><a href="article.asp">ԭ����ѧ</a></li>
        <li><a href="college.asp">רҵ����</a></li>
        <li><a href="#">CET</a></li>
        <li><a href="elective.asp">ѡ�޿�</a></li>
        <li><a href="#">������</a></li>
        <li><a href="forum.asp">��̳</a></li>
  	</ul>

<div id="main">
<div id="inmain">
  <!-------------------------------------У������---------------------------------------------------------------------------->
  <ul class="news">
    <span><a href="news.asp">У������</a></span>
    
	<%
		set rs=server.CreateObject("adodb.recordset")
		sql="select top 8 [ID],[title],[contant],[author] from news order by ID desc "
		rs.open sql, conn ,0,1         							 '���������ݿ�
	%>
    <% do until  rs.eof%>
	<li>
    	<a href="news.asp?ID=<%response.Write(rs("ID"))%>" title="����:<%=rs("author")%>">
    
      	<% 	'�����޼�������Ŀ���Ȳ����
	  		a=rs("title")
			if len(a)>10 then a=left(a,10)&"��"
			response.Write(a&"</a></li>")
    		rs.movenext
			loop
			rs.close											 '�ر��������ݿ�
		%>
  </ul>
  <!-------------------------------------ʧ������---------------------------------------------------------------------------->
  <ul class="lost">
    <span><a href="lost.asp">ʧ������</a></span>
    <%
		sql="select top 8 [title] from lost order by ID desc "
		rs.open sql, conn ,0,1									'��ʧ���������ݿ�
		dim i
		i=2
	%>
    <% 
		do until  rs.eof
			i=i+1
			if i=cint("9") then i=10	'Ϊ���ڵ������ܹ����ӵ��һ��ê��10
			if i=11 then i=10			'Ϊ�������һ���ܹ������ӵ��һ��ê��10
	%>
    <li>
    	<a href="lost.asp#<%=i%>">
      		<% a=rs("title")
			if len(a)>10 then a=left(a,10)&"��"
			response.Write(a&"</a></li>")
    		rs.movenext
			loop
			rs.close											 '�ر��������ݿ�
		%>
  </ul>
  <!------------------------------------��������----------------------------------------------------------------------------->
  <div id="people">
    <h3><b>Persons of the Week</b><span>��������</span><a href="people.asp"></a></h3>
    <% 
		sql="select top 1 * from people order by ID desc "
		rs.open sql, conn,0,1										 '���������ݿ�
	infor="<li>"&rs("name")&"</li>"
	for i=7 to 13
		if rs(i)<>"" then
			select case i
				case 7
					infor=infor&"<li>"&rs(7)
				case 8
					if rs(8)<>empty then
						infor=infor&"&nbsp;&nbsp;&nbsp;��ߣ�"&rs(8)&"cm</li>"
					else
						infor=infor&"</li>"
					end if
				case 12
					infor=infor&"<li>�س���"&rs(12)&"</li>"
				case 13
					infor=infor&"<li>��Ȥ��"&rs(13)&"</li>"
				case else
					infor=infor&"<li>"&rs(i)&"</li>"
			end select
		end if 
	next

	%>
    <img src="<%=rs("home_img")%>" title="��������" />
    <ul>
    	<%=infor%>
    </ul>
    <h5><%=rs("title")%></h5>
    <p><%=rs("s_contant")%></p>
    <% 	
		rs.close												'�ر��������ݿ�	
	%>
  </div>
  <!---------------------------------ԭ����ѧ-------------------------------------------------------------------------------->
  <div id="article">
    <h3><b>Original Articles</b><span>ԭ����ѧ</span><a href="article.asp"></a></h3>
    <% 
		sql="select top 1 [title],[author],[s_contant] from article order by ID desc "
		rs.open sql, conn,0,1										 '��ԭ����ѧ���ݿ�
	%>
 
    <h5><% response.Write(rs("title"))%> </h5>
    <p><% response.Write(rs("s_contant"))%> </p>
    <% 
		 rs.close											'��ϵԭ����ѧ���ݿ�
	%>
  </div>
  <!------------------------------------�̵��Ƽ�----------------------------------------------------------------------------->
  <div id="store">
  <h3><b>Recommended store</b><span>�̵��Ƽ�</span><a href="store.asp"></a></h3>
  	<% 
		sql="select top 1 [title],[s_contant],[home_img] from store order by ID desc "
		rs.open sql, conn,0,1										 '���̵��Ƽ����ݿ�
    response.Write("<h5>" & rs("title") & "</h5><img src=""" &rs("home_img") & """ /><p>"&rs("s_contant")&"</p>")
		rs.close													'�ر��̵��Ƽ����ݿ�
		set rs=nothing 											 	'�ͷ�recordset����
		conn.close
		set conn=nothing
	%>
    <br style=" display:block; clear:both;" />
  </div>
</div>
</div>
<!----------------------------------------------ҳ��------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008&#8212;2012 ��ũ�ִ�ѧ�����ܿ���</span> <em>www.fafurwzk.com <a href="http://www.vdoing.com" title="Vdoing StatsX No.55174"><img src="http://simg.vdoing.com/m/55174/x01.gif" border="0" width="15"></a></em></h1>

<!----------------------------------------------��̳------------------------------------------------------------------->
<span> <img src="image/forum-bg.gif" class="forum"/> </span>
<div id="forum">
  <iframe src="default.asp" align="middle" scrolling="no" width="200" height="150%" frameborder="0" ></iframe>
</div>

</body>
</html>
