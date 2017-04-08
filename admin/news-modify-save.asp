<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商家推荐修改----保存</title>
</head>

<body>
<%	
	id=request.QueryString("id")
	tit=request.Form("title")
	author=request.Form("author")
	con=request.Form("contant")
	if tit<>""  and author<>"" and con<>"" then
		sql="update news set title='"&tit&"',author='"&author&"',contant='"&con&"' where ID="&id
		conn.execute(sql)
		response.Write("修改完成")
		conn.close
		set conn=nothing
	else
		response.Write("请填写完整")
	end if 
%>
</body>
</html>
