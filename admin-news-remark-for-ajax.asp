<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<% 
	dim showall
	dim id
	id=request.QueryString("id")
	showall=request.QueryString("showall")
	set rsmark=server.CreateObject("adodb.recordset")
	set rsmark02=server.CreateObject("adodb.recordset")
		sql="select top 5 [ord],[remark_name],[remark],[face],[tim] from [news_remark] where ID="&ID&" order by ord desc "
		sql02="select count(face) from [news_remark] where ID="&ID
	if showall="true" then sql="select [ord],[remark_name],[remark],[face],[tim] from [news_remark] where ID="&ID&" order by ord desc "
	rsmark.open sql,conn,1,1
	rsmark02.open sql02,conn,0,1
	scorecount=rsmark02(0)
	if scorecount>=1 then
	response.Write("<p class=""score""><a id=""tohere"" name=""tohere""></a>本文共有<span>"&scorecount&"</span>人发表评论</p>")
	'显示--------是否显示所有留言
		if showall="true" then 
			response.write("<div class=""showall""><a name=""forAjax"">取消显示所有评论</a></div>")
		else
			if scorecount>5 then
			response.write("<div class=""showall""><a name=""forAjax"">显示所有评论</a></div>")
			end if 
		end if 
	'显示--------是否显示所有留言



	response.Write("<table>")
	rsmark.movelast
	for i=1 to scorecount
		response.Write("<tr><td>第<cite>")
		if scorecount<5 then
			response.Write(i)
		else
			if showall="true" then 
			response.Write(i)
			else
				response.Write(scorecount-5+i)
			end if 
		end if 
		
		response.Write("</cite>位观看者:<span>"&rsmark("remark_name")&"</span>"&rsmark("tim")&"</td></tr><tr><td><p><b><img src=""image/face"&rsmark("face")&".gif"" alt=""支持"" />评论:</b>"&rsmark("remark").value&"</p><p class=""modifyThisRemark""><a href=""admin/news-remark-modify.asp?ord="&rsmark("ord")&""" onclick=""modifyOrDelete(this);return false"" >修改</a><a href=""admin/news-remark-delete.asp?ord="&rsmark("ord")&""" onclick=""modifyOrDelete(this);return false"" >删除</a></p></td></tr>")
	rsmark.moveprevious
		if rsmark.bof then exit for 
	next
		response.Write("</table>")



	'显示--------是否显示所有留言
		if showall="true" then 
			response.write("<div class=""showall""><a href=""#tohere"" name=""forAjax"" >取消显示所有评论</a></div>")
		else
			if scorecount>5 then
			response.write("<div class=""showall""><a href=""#tohere"" name=""forAjax"">显示所有评论</a></div>")
			end if 
		end if 
	'显示--------是否显示所有留言



	else 
		response.Write("<div class=""showall"">暂无人发表评论!</div>")
	end if 
	rsmark.close
	set rsmark=nothing
	rsmark02.close
	set rsmark02=nothing
%>