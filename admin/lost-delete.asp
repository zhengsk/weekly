<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>失物登记保存</title>
</head>

<body>
<% 	
	dim id
	id=request.QueryString("id")
	sql="delete from lost where id="&id
	conn.execute(sql)
	conn.close
	set conn=nothing
	response.Write("删除成功")
%>
</body>
</html>
