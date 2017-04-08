<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商家推荐添加保存</title>
</head>

<body>
<%	
	tit=request.Form("title")
	s_con=request.Form("s_contant")
	home_img=request.Form("imgin")
	con=request.Form("contant")
	s_con=changechr(s_con)
	if tit<>""  and s_con<>"" and con<>"" and home_img<>""  then
		
		sql="insert into store(title,[home_img],tim,[s_contant],contant) values ('"&tit&"','"&[home_img]&"',#"&now()&"#,'"&[s_con]&"','"&con&"')"
		conn.execute(sql)
		response.Write("添加完成")
		conn.close
		set conn=nothing
	else
		response.Write("请填写完整")
	end if 
	
	function changechr(str)  '将字符转换成网页能识别的字符
    changechr=replace(replace(replace(replace(str,"<","&lt;"),">","&gt;"),chr(13),"<br>")," ","&nbsp;")
	end function

%>

</body>
</html>
