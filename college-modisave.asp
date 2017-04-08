<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css" media="screen">
body{text-align:center;}
.main{text-align:left; width:800px; margin:auto;}

</style>
</head>

<body>

<h1>对学院或专业修改</h1>
<div class="main">
<%  
	id=cint(request.QueryString("ID"))
	num=cint(request.QueryString("num"))
	
	speciality=request.Form("speciality")
	speinfor=request.Form("speinfor")
	
	
	
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from college where ID="&id&"and number="&num
	rs.open sql,conn,1,3
	rs("speciality")=speciality
	rs("speinfor")=speinfor
	rs.update
	response.Write("更新成功")
	
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
</div>
</body>
</html>
