<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>修改学院专业</title>
<style type="text/css" >
	body{text-align:center;}
	.main{text-align:left; width:800px; margin:auto; margin-bottom:90px; padding:10px 20px; border:#999999 5px dashed;}
	dt{background:#D4D4D4; display:block; border-bottom:#FF0000 2px solid; margin:30px 0 10px; position:relative; padding:15px 0 10px 1em; }
	dd a,dt a{text-align:right; float:right; position:relative; top:-1.2em; left:-1.5em;}
	dd{background-color: #DDFED3;border-bottom:1px #006633 solid; padding:5px 5px; }
	dd:hover{background-color:#77F7A7;color:#ff0000}
	
	#wrapper{ margin:auto; display:block;text-align:center;}
	form,input{display:block; margin:auto;}
</style>
</head>

<body>
<h1>显示学院和专业</h1>
<div class="main">
<%  
	id=cint(request.QueryString("ID"))
	num=cint(request.QueryString("num"))
	set rs=server.CreateObject("adodb.recordset")
	sql="select * from college order by ID asc, number asc"
	rs.open sql,conn,1,3


	response.Write("<dl>")
	do while not rs.eof 
		rsid=rs("ID")
		rsnum=rs("number")
		if rsnum=0 then
			response.Write("<dt>")
				response.Write(rs("speciality")&"<a href=""college-modify.asp?num="&rsnum&"&ID="&rsid&""">修改޸</a>")
			response.Write("</dt>")
			
			if cint(rsid)=id and cint(rsnum)=num then 
			response.Write(	"<div id=""wrapper""><form action=""college-modisave.asp?num="&rsnum&"&ID="&rsid&""" method=""post"" ><input type=""text"" name=""speciality"" value="""&rs("speciality")&""" /><textarea name=""speinfor"" cols=""60"" rows=""10"" style=""display:none"">"&rs("speinfor")&"</textarea><iframe ID=""eWebEditor1"" src=""../editor/ewebeditor.htm?id=speinfor&amp;style=coolblue"" frameborder=""0"" scrolling=""no"" width=""700"" HEIGHT=""350""></iframe><input name=""ok"" type=""submit"" value=""OK"" /></form></div>")
            end if 
		else

			response.Write("<dd>")
				response.Write(rs("speciality")&"<a href=""college-modify.asp?num="&rsnum&"&ID="&rsid&""">޸修改</a>")
			response.Write("</dd>")
			
			if cint(rsid)=id and cint(rsnum)=num then 
			response.Write(	"<div id=""wrapper""><form action=""college-modisave.asp?num="&rsnum&"&ID="&rsid&""" method=""post"" ><input type=""text"" name=""speciality"" value="""&rs("speciality")&""" /><textarea name=""speinfor"" cols=""60"" rows=""10"" style=""display:none"">"&rs("speinfor")&"</textarea><iframe ID=""eWebEditor1"" src=""../editor/ewebeditor.htm?id=speinfor&amp;style=coolblue"" frameborder=""0"" scrolling=""no"" width=""700"" HEIGHT=""350""></iframe><input name=""ok"" type=""submit"" value=""OK"" /></form></div>")
            end if 
         end if   
		rs.movenext
	loop
	response.Write("</dl>")
	
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
</div>
</body>
</html>
