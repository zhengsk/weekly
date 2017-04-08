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
	sql="select * from peo_remark where ord="&ord
	set rs=conn.execute(sql)
%>
<form action="peo-remark-modify.asp?ord=<%=ord%>&action=save&heart=<%=rs("heart")%>&face=<%=rs("face")%>&week=<%=rs("week")%>" method="post">
<table width="400px" border="1">
  <tr>
    <td width="100px">留言者:</td>
    <td><input type="text" name="remarkname" value="<%=rs("remark_name")%>" size="40"/></td>
  </tr>
  <tr height="100px">
    <td>留言内容:</td>
    <td><textarea cols="32" rows="6" name="remark"><%=rs("remark")%></textarea></td>
  </tr>
  <tr>
    <td>桃心数:</td>
    <td><input type="text" name="heart" value="<%=rs("heart")%>" />颗</td>
  </tr>
  <tr>
    <td>表情:</td>
    <td><input type="text" name="face" value="<%=rs("face")%>" />X:<img src="../image/s1.jpg" width="25px"/>Y:<img src="../image/s2.jpg" width="25px" />Z:<img src="../image/s3.jpg" width="25px" /></td>
  </tr>
  <tr>
    <td>留言时间:</td>
    <td><%=rs("time")%></td>
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
	heart=request.QueryString("heart")
	face=request.QueryString("face")
	week=request.QueryString("week")
	remarkname=request.Form("remarkname")
	remark=request.Form("remark")
	theheart=request.Form("heart")
	heart=heart-theheart
		sql="update [people] set heart = heart -" & heart
	select case face
		case "x"
			sql=sql&", facex=facex - 1 where week="&cint(week)
		case "y"
			sql=sql&", facey=facey - 1 where week="&cint(week)
		case "z"
			sql=sql&", facez=facez - 1 where week="&cint(week)
	end select
	conn.Execute(sql)
'把汇总表people中的桃心减去原来的值,再加上添加的值,表情减去原来的值.  所以桃心数有对,表情数未加上
	face=request.Form("face")
	sql="update [people] set face"&face&"=face"&face&"+1 where week="&cint(week)
	conn.Execute(sql)
'把汇总表people中的表情添加一个,补充了上一步中表情没有加一
	sql="update peo_remark set remark_name='"&remarkname&"',remark='"&remark&"',heart='"&theheart&"',face='"&face&"' where ord="&ord
	conn.execute(sql)
	conn.close
	set conn=nothing
'更新留言内容表 Peo_remark
%>
	
    	<p>修改完成!</p>
    <div>
        <input type="button" value="&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;" onclick="window.close()" />
    </div>
<%end if %>
</body>
</html>
