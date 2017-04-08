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
	dim ord,action
	ord=request.QueryString("ord")
	if typename(ord)=empty or ord=empty then
	response.Write("出错了!") 
	response.End()
	end if
	action=request.QueryString("action")
	if typename(action)=empty or action=empty then
	sql="select * from news_remark where ord="&ord
	set rs=conn.execute(sql)
%>
<form action="news-remark-modify.asp?ord=<%=ord%>&action=save" method="post">
<table width="400px" border="1">
  <tr>
    <td width="100">留言者:</td>
    <td><input type="text" name="remarkname" value="<%=rs("remark_name")%>" size="40"/></td>
  </tr>
  <tr height="100px">
    <td>留言内容:</td>
    <td><textarea cols="32" rows="6" name="remark"><%=rs("remark")%></textarea></td>
  </tr>
  <tr>
    <td>表情:</td>
    <td><input type="text" name="face" value="<%=rs("face")%>" /></td>
  </tr>
  <tr>
    <td>留言时间:</td>
    <td><%=rs("tim")%></td>
  </tr>
  <tr>
    <td align="center" colspan="2"> <input type="submit" value="&nbsp;&nbsp;提&nbsp;交&nbsp;&nbsp;" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="取消" onclick=" window.close()" /></td>
  </tr>
</table>
</form>
<% 
rs.close
set rs=nothing
else
	remarkname=request.Form("remarkname")
	remark=request.Form("remark")
	face=request.Form("face")
	sql="update news_remark set remark_name='"&remarkname&"',remark='"&remark&"',face='"&face&"' where ord="&ord
	conn.execute(sql)
	conn.close
	set conn=nothing
%>
	
    	<p>修改完成!</p>
    <div>
        <input type="button" value="&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;" onclick="window.close()" />
    </div>
<%end if %>
</body>
</html>
