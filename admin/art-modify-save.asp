<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原创文学修改保存</title>
</head>

<body>
<%
	articleId=request.QueryString("articleId")
	tit=request.Form("title")
	a_nam=request.Form("authorname")
	aut=request.Form("author")
	authorImg=request.Form("imgin")
	s_con=request.Form("s_contant")
	con=request.Form("contant")
	if authorImg="" or authorImg=empty then authorImg="image/nopeole.gif"
	if tit<>""  and a_nam<>"" and s_con<>"" and con<>"" and aut<>"" then
		sql="update article set title='"&tit&"',author='"&a_nam&"',s_contant='"&s_con&"',contant='"&con&"',author_info='"&aut&"',author_img='"&authorImg&"' where ID="&articleId
		conn.execute(sql)
		response.Write("文章修改完成完成!")
		conn.close
		set conn=nothing
	else
		response.Write("请填写完整")
	end if 
%>

</body>
</html>
