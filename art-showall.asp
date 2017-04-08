<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原创文学---列表</title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<style type="text/css">
.shouall_ul{display:block; position:relative;}
.showall_ul li{color: #666666;position:relative;}
.showall_ul li span.time{ margin-right:100px;}
.showall_ul li span.author{ margin:0; padding:0; border:none; position:absolute; top:auto;right:10px; _right:40px; color:#182937;}
.showall_ul li span.s_contant{display:none;}
.showall_ul li a{display:block;width:580px;padding:10px 0 5px 0;color:#7c7979;}
.showall_ul li a.ahover{background-color:#c9de96;}
.showall_ul li span.title{color:#93B05C; font-weight:bold; padding-bottom:5px; margin-left:20px;}
.showall_ul li .titlehover{color:#0461fb;font-weight:bold; margin-left:20px;}
.showall_ul li span.s_contant{display:none;}
.showall_ul li .show_contant{display:block;background-color:#ecf5d3; margin:15px 5px 0 5px; padding:10px 20px; height:100px; overflow:hide;cursor:pointer;font-size:12px; color:#182937; }
.showall_ul li.libgcolor{background:#e7ebdc; }
.showpage{text-align:center; margin:15px; color:#666666;}
.showpage a{color:#4d87ce;}
.showpage a:hover{color:#000066;}
</style>
<script type="text/javascript" src="js/showList.js" ></script>
<script type="text/javascript" src="js/listHoverShow.js" ></script>
<script type="text/javascript" language="javascript" defer="defer">
  window.onload = function() 
  {
	  hideDiv();
	  rolinTab("rolin");
	  toThisPage();
	  hoverShow();
  }
</script>
</head>          

<body>

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
  <div class="left">
		<h5>原创文学--列表</h5><!------------------------------------------------------------文章标题--------->
       <%
	 set rs=server.CreateObject("adodb.recordset")
	 sql="select ID,title,author,tim,[s_contant] from article order by ID desc"
	 rs.open sql,conn,1,1
	 rs.pagesize=20		'第页有几条内容
	 pagcount=cint(rs.pagecount)'一共分层几页
 	 abspage=cint(request.QueryString("abspage"))'获取当前是第几页
	 if abspage=empty then abspage=1
	 rs.absolutepage=abspage
	 response.Write("<div class=""showpage"">")
	 showpage abspage   '这个是调用了文件尾部的页布函数
	 response.Write("</div>")
	response.Write(" <ul class=""showall_ul"">")
	 for i=1 to rs.pagesize
	 	if i mod 2<>0 then
	 		response.Write("<li><a href=""article.asp?ID="&rs("ID")&""" name=""list"" ><span class=""title"">"&rs("title")&"</span><span class=""time"">"&left(rs("tim"),10)&"</span><span class=""author"">"&rs("author")&"</span><span class=""s_contant"">"&rs("s_contant")&"</span></a></li>")
	 		rs.movenext
		else 
	 		response.Write("<li class=""libgcolor""><a href=""article.asp?ID="&rs("ID")&""" name=""list""><span class=""title"">"&rs("title")&"</span><span class=""time"">"&left(rs("tim"),10)&"</span><span class=""author"">"&rs("author")&"</span><span class=""s_contant"">"&rs("s_contant")&"</span></a></li>")
	 		rs.movenext
		end if 
	 	if rs.eof=true then 
			exit for
		end if 
	 next
	 response.Write("</ul><div class=""showpage"">")
	 showpage abspage   '这个是调用了文件尾部的页布函数
	 response.Write("</div>")
	 rs.close 
	 set rs=nothing
	%>
	
    
  	</div>
	<div class="newestarticle"><!------------------------------------------------------------------------热门文章--------->
    	<p class="newest">最新文章</p>
        	<ul class="rolinList" id="rolin">
   		<!--#include file="art-newest.asp"--> <!--------------------------------------------左侧最新文章------------------------>	
        	</ul>								
    </div>
    <div class="hotarticle">
    <p class="hot">热门文章</p>
       	<ul>
   		<!--#include file="art-hot.asp"--> <!--------------------------------------------左侧最新文章------------------------>	

        </ul>
    </div>
	<div class="clear"></div><!-------------------------------------------------------------------清除浮动---------->
</div>

<!----------------------------------------------页脚------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>


	<%	sub showpage(abspage)            '<!-----------------------------以下是导航分页的函数------------------------------------->

		if cint(abspage)=<1 or abspage="" then
			abspage=1
			response.Write("首页&nbsp;&nbsp;上一页")
		else
			response.Write("<a href=""art-showall.asp?abspage=1"">首页</a>&nbsp;&nbsp;<a href=""art-showall.asp?abspage="&abspage-1&""">上一页</a>")
		end if 

		response.Write("&nbsp;&nbsp;"&abspage&"/"&pagcount&"&nbsp;&nbsp;")
		
		if abspage >= pagcount then
			abspage=pagcount
			response.Write("下一页&nbsp;&nbsp;尾页")
		else
			response.Write("<a href=""art-showall.asp?abspage="&abspage+1&""">下一页</a>&nbsp;&nbsp;<a href=""art-showall.asp?abspage="&pagcount&""">尾页</a>")
		end if
		
		
		Response.Write "&nbsp;&nbsp;&nbsp;转到：<SELECT name='page' size='1' ID='Select1'>"   
    	for i = 1 to pagcount   
    		Response.Write "<option value='" & i & "'"
			Response.Write ">第" & i & "页</option>"   
	    next
		Response.Write "</SELECT>"
 
	end sub	
	   %> 	
<script type="text/javascript" language="javascript" defer="defer">
 function toThisPage()
 {
	 document.getElementsByName("page").item(0).selectedIndex= <%=abspage-1%>;
	 document.getElementsByName("page").item(0).onchange=toIt;
	 document.getElementsByName("page").item(1).selectedIndex= <%=abspage-1%>;
	 document.getElementsByName("page").item(1).onchange=toIt;
 }
 function toIt()
 {
	 document.location.href="art-showall.asp?abspage="+ this.value;
 }
</script>
</body>
</html>
