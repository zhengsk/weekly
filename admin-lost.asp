<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css" media="all" >
*{margin:0; padding:0;}
html{background:#bbce9b url(image/news-bg02.jpg) repeat fixed; font-family:Arial, Helvetica, sans-serif;}
body{text-align:center; background-image:none; position:relative;}

.wrapper{ overflow:auto; height:480px; width:90%; margin:-20px auto; position:relative; border:solid 20px #728c42;  background:#aed16c url(image/lost-wrapper-bg.gif) fixed;/*padding:0;filter:Alpha(Opacity=50); opacity:0.5;*/}
.inner{ width:2880px; height:450px; margin-top:10px; padding:0;}
#top{text-align:left;}
.lost{background:#bdce9c url(image/lost-list-bg.jpg) top left no-repeat; width:260px; height:320px;float:left; display:inline;color:#333333;margin:10px 20px;padding:20px 10px;border:#d7e8b6 20px solid;overflow:auto;position:relative; text-align:left;}
.lost p.title{text-align:center; font-size:18px;font-weight:bold;}
.lost ul{margin:1em auto auto 1em; list-style-type:circle;}
.lost ul li{font-size:14px; margin-top:5px; list-style-image:url(image/navi-bg02.gif); display:list-item; border-bottom:1px dotted #000; line-height:1.5em;}
.lost ul li span{line-height:1em;letter-spacing:0;font-weight:600;margin-right:0.5em; color:#333; font-size:12px;}
.lost p{text-align:right;font-size:12px;}
.lost p.host{ margin-top:15px;}


#last{ position:absolute; top:0; left:254%; visibility:hidden; }/*这个是把最后的一个锚点放在最后的位置*/

.uppage,.downpage{text-align:center;_filter:Chroma(Color=ede9eb); font-weight:bolder; position:relative; font-size:16px;}
.uppage span,.downpage span{ color:#CCCCCC;}
.uppage a, .downpage a{color:#6c8940; text-decoration:none;}
.uppage a:hover, .downpage a:hover{color:#2a4501; border-bottom:#000033 solid 2px;font-weight:900;}

.footer{ position:relative; width:100%;float:left; font-size:20px; color:#fff;}
.message{width:450px; margin:auto; height:100px; margin-top:30px; padding-top:20px;}
.message a{ color:#3e5e0e; font-weight:bolder;}
.message p a:hover{ color:#2a4501; border-bottom:1px #000033 solid; text-decoration:underline;}

.lost1 {background:#bdce9c url(image/lost-list-bg.jpg) top left no-repeat; width:250px; height:320px; float:left; margin:10px 20px; display:inline;}
.lost1 {text-align:center; font-size:24px; color:#333333; padding:20px 15px; font-weight:bolder;  border:#d7e8b6 20px solid; overflow:auto; position:relative; }

p.modify{background-color:#333;padding:4px;text-align:center; display:block;}
p.modify a{color:#FFF; border-bottom:#F00 2px solid; margin:4px; padding:0 2px;}
p.modify a:hover{color:#000; background-color:#FFF;}
</style>

<title>失物认领</title>
</head>

<body>
<h1 id="top"><img src="image/logo.gif" /></h1>
<ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a href="people.asp">本周人物</a></li>
    <li><a href="article.asp">原创文学</a></li>
    <li><a href="college.asp">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a href="elective.asp">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
  </ul>

<%  
	page=cint(request.QueryString("page"))
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from lost order by ID desc"
	rs.open sql,conn,1,1
	rs.pagesize=8
	allcount=rs.recordcount
	allpage=rs.pagecount
	if page=empty or page<1 then page=1
	if page>allpage then page=allpage
	rs.absolutepage=page
	response.Write("<div class=""wrapper""><div class=""inner"">")
	for i=1 to 8
		%>
                
		<div class="lost">
            	<a name="<%=i%>"></a>
                  <p class="modify">
                  	<a href="admin/lost-modify.asp?id=<%=rs(0)%>">修改</a>
                  	<a href="admin/lost-delete.asp?id=<%=rs(0)%>">删除</a>
                  </p>
			<%="<p class=""title"">"&i+(page-1)*8&"、"&rs(1)&"</p>"%>
 			<%=rs(2)%>
 			<p><%=left(rs(3),9)%></p>
		</div>

<%
		rs.movenext
		if rs.eof then 
			for j=i to 7
				response.Write("<div class=""lost1""> 无内容 </div>")
			next
			exit for
		end if 

		next
		response.Write("<a name=""10"" id=""last"">55</a></div></div>")
	%>


<div class="footer">
    	<% '---------------------------------------------这个是为了得到显示导航
			if page=1 then 
				a="<span>上一页</span>"
				aa="<span>&nbsp;&nbsp;首页&nbsp;&nbsp;</span>"
			else
				a="<a href=""admin-lost.asp?page="& page-1&""">上一页</a>"
				aa="<a href=""admin-lost.asp?page=1"">&nbsp;&nbsp;首页&nbsp;&nbsp;</a>"
			end if 
			
			if page=allpage then 
				b="<span>下一页</span>"
				bb="<span>&nbsp;&nbsp;尾页&nbsp;&nbsp;</span>"
			else
				b="<a href=""admin-lost.asp?page="& page+1&""">下一页</a>"
				bb="<a href=""admin-lost.asp?page="&allpage&""">&nbsp;&nbsp;尾页&nbsp;&nbsp;</a>"
			end if 
		%>

    
    <div class="message">
    	<p>共有<%=allcount%>件物品等待Ta的主人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;每页显示8件物品</p>
        <p>&nbsp;</p>
        <p><%=aa&a&page&"/"&allpage&b&bb%><a href="admin/lost-add.asp">失物登记</a></p>
    </div>
    
</div>
</body>
</html>
