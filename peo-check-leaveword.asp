<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本周人物--保存留言内容</title>
</head>

<body>
<% 
	week=int(request.QueryString("week"))
	remarkname=request.Form("user")
	heart=int(request.Form("score"))
	face=request.Form("face")
	remark=request.Form("message")
	
	sql="INSERT INTO [peo_remark] ([week],[remark_name],[remark],[heart],[face],[time]) VALUES ('" & week &"','" & remarkname &"','" & changechr(remark) & "','" & heart & "','" & face  &"',#" & now & "#)"
	conn.Execute(sql)
	
		sql="update [people] set remarknum = remarknum + 1,heart = heart +" & heart
	select case face
		case "x"
			sql=sql&", facex=facex + 1 where week=" &week
		case "y"
			sql=sql&", facey=facey + 1 where week=" &week
		case "z"
			sql=sql&", facez=facez + 1 where week=" &week
	end select
	
	conn.Execute(sql)
	function changechr(str)  '将字符转换成网页能识别的字符
    changechr=replace(replace(replace(replace(str,"<","&lt;"),">","&gt;"),chr(13),"<br>")," ","&nbsp;")
	end function
	'---------------------------释入资源----------------------------------------
	conn.close
	set conn=nothing
	response.Write("添加留言完成")
%>

</body>
</html>
