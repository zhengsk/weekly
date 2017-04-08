<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>选修课目录－人物周刊</title>
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/elective.css" rel="stylesheet" type="text/css" media="all" />
</head>

<body>
<h1 id="top"><img src="image/logo.gif" /></h1>
<ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a href="people.asp">本周人物</a></li>
    <li><a href="article.asp">原创文学</a></li>
    <li><a href="college.asp">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a class="here">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
	<p id="smallNavi">首页--本周人物</p>
  </ul>
<%
elective=request.QueryString("elective")
if elective="" then elective="0"
a=array("自然科学","人文社科","艺术、体育")
strDriver = "Driver={Microsoft Excel Driver (*.xls)};DBQ="& Server.MapPath("#date/elective.xls")  
Set conn = Server.CreateObject("ADODB.Connection")  
conn.Open strDriver  
strSELECT = "SELECT * from ["&elective&"$]"  
Set rS = Server.CreateObject("ADODB.Recordset")  
rS.Open strSELECT,conn 
%>
<h1 class="h1"><span>选修课目录之</span><%=a(elective)%></h1>

<div class="out-div">
<h2>
	<%select case elective
		case 0
	response.Write("<em>自然科学</em><span><a href=""elective.asp?elective=1"">人文社科</a></span><span><a href=""elective.asp?elective=2"">艺术、体育</a></span>")
		case 1
	response.Write("<span><a href=""elective.asp?elective=0"">自然科学</a></span><em>人文社科</em><span><a href=""elective.asp?elective=2"">艺术、体育</a></span>")	
		case 2
	response.Write("<span><a href=""elective.asp?elective=0"">自然科学</a></span><span><a href=""elective.asp?elective=1"">人文社科</a></span><em>艺术、体育</em>")
	end select %>
	
</h2>
<table>

<thead>
	<tr>
    <th width="60px">课程代码</th>
    <th width="120px">课程名称</th>
    <th width="50px">学时</th>
    <th width="50px">学分</th>
    <th width="100px">任课教师</th>
    <th width="100px">职称</th>
    <th >必需先修课程或限选专业</th>
    <th width="60px">限选人数</th>
    <th width="60px">起止周次</th>
    <th width="60px">上课时间</th>
    </tr>
</thead>
<tbody>
<% dim flag: flag=1
do until rs.eof 
	if flag=1 then
		flag=2
		response.Write("<tr class=""tr"">")		
	else
		
		response.Write("<tr>")	
		flag=1
	end if 
%>
	
	 
		<% for i=0 to rs.fields.count-1
			if i mod 2=0 then 
				response.Write("<td>"&rs(i)&"</td>")
			else
				response.Write("<td>"&rs(i)&"</td>")
			end if 
		next%> 
	</tr>
<%
	rs.movenext
loop
%>

</tbody>
</table>
</div>
<% rs.close :set rs=nothing : conn.close :set conn=nothing %>
<!----------------------------------------------页脚------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008&#8212;2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</body>
</html>
