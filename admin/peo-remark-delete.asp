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
	
		sql="select heart,face,week from peo_remark where ord="&ord
		set rs=conn.execute(sql)
		dim heart,face
		heart=rs("heart")'获取此留言的桃心数和表情和人物周次,这样为了在总汇表中减去相印的值
		face=rs("face")
		week=rs("week")
		
		sql="delete from peo_remark where ord="&ord
		set rs=conn.execute(sql)'把此留言内容全部删除
		sql="update [people] set remarknum = remarknum - 1,heart = heart -" & heart
	select case face
		case "x"
			sql=sql&", facex=facex - 1 where week="&cint(week)
		case "y"
			sql=sql&", facey=facey - 1 where week="&cint(week)
		case "z"
			sql=sql&", facez=facez - 1 where week="&cint(week)
	end select
	conn.Execute(sql)
%>
	
    	<p>删除完成!</p>
    <div>
        <input type="button" value="&nbsp;&nbsp;关&nbsp;闭&nbsp;&nbsp;" onclick="window.close()" />
    </div>
</body>
</html>
