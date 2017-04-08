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
	title=request.Form("title")
	goods=request.Form("goods")
	losetime=request.Form("time")
	place=request.Form("place")
	infor=request.Form("infor")
	host=request.Form("host")
	contact=request.Form("contact")
	allinfor="<ul><li><span>物品名称:</span>"&goods&"</li><li><span>丢失时间:</span>"&losetime&"</li><li><span>丢失地点:</span>"&place&"</li><li><span>物品描述:</span>"&infor&"</li></ul><p class=""host"">粗心主人:"&host&"</p><p>联系方式:"&contact&"</p>"
	if title="" or goods="" or infor="" then 
		response.Write("请填写完")
	else
	sql="insert into lost([title],[infor],[tim]) values ('"&title&"','"&allinfor&"',#"&now&"#)"
	conn.execute(sql)
	conn.close
	set conn=nothing
	response.Write("失物登记成功")
	end if 
%>
</body>
</html>
