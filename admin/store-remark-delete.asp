<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言修改</title>
<style type="text/css">
table{ margin:auto}
table tr:hover{background-color:#CCC;}
div{text-align:center; margin-top:150px;}
div input{padding:5px;}
</style>
</head>

<body>
<%
	dim ord
	ord=request.QueryString("ord")
	if typename(ord)=empty or ord=empty then
	response.Write("出错了!") 
	response.End()
	end if
	sql="delete from store_remark where ord="&ord
	conn.Execute(sql)
	conn.close
	set conn=nothing
%>
	
    	<p>删除完成!</p>
    <div>
        <input type="button" value="&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;" onclick="window.close()" />
    </div>
</body>
</html>
