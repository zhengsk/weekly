<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商店推荐--保存留言内容</title>
</head>

<body>
<%  
	user=left(request.Form("user"),20)
	face=request.Form("face")
	message=request.Form("message")
	ID=request.QueryString("ID")
	tim=request.Cookies("news")(ID)			'获取当前文章的cookies
	sql="insert into [store_remark] ([ID],[remark_name],[remark],[face],[tim]) values ('" & ID &"','" & user &"','" & changechr(message) & "','" & face & "',#" & now() & "#)"
if tim<>"" then						'如果当前文章的cookies存在
	if cdbl(datediff("s",tim,now))>60  then	'存在且时间大于60秒了
		if user<>"" and face<>"" and message<>"" then 
					conn.execute(sql)
					conn.close
					set conn=nothing
					response.Write("发表评论成功!")
					response.Cookies("news")(ID)=now()'因为之前检查了cookies的时间大于60秒了,发表评论了,所以再把当前时间设置为cookies值
		else
			response.Write("请填写完整！")
		end if 	
	else
		response.Write("请在一分钟以后再发表评论!")
	end if 
else 			'如果获得的cookies的值为空值,就直接把添加数据
		if user<>"" and face<>"" and message<>"" then 
					conn.execute(sql)
					conn.close
					set conn=nothing
					response.Write("发表评论成功!")
					response.Cookies("news")(ID)=now()'这里也是把当前时间设置为cookies值
		else
			response.Write("请填写完整！")
		end if 	
end if 

	function changechr(str)  '将字符转换成网页能识别的字符
    changechr=replace(replace(replace(replace(str,"<","&lt;"),">","&gt;"),chr(13),"<br>")," ","&nbsp;")
	end function

%>

</body>
</html>
