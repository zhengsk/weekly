<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>删除图片</title>
<%  set fso=server.CreateObject("scripting.filesystemobject")
	deleteimg=request.QueryString("pic")
	imgpath=server.MapPath("./" & "../" & deleteimg)
	if fso.fileexists(imgpath) then
		fso.deletefile imgpath , true 
		response.Write("删除成功！")
	else
		response.Write("图片不存在！")
	end if 
	
	set fso=nothing
%>
</head>

<body>

</body>
</html>
