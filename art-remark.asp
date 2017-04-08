<% set rsmark=server.CreateObject("adodb.recordset")
	set rsmark02=server.CreateObject("adodb.recordset")
		sql="select top 5 [remark_name],[remark],[score] from [art_remark] where ID="&ID&" order by ord desc "
		sql02="select sum(score)  ,avg(score) ,count(score) from [art_remark] where ID="&ID

	rsmark.open sql,conn,1,1
	rsmark02.open sql02,conn,0,1
	scorecount=rsmark02(2)
	if scorecount>=1 then
	response.Write("<p class=""score""><a id=""tohere"" name=""tohere""></a>本文共有<span>"&scorecount&"</span>人发表评论 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;总分:<span>"&rsmark02(0)&"</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;平均分:<span>"&formatnumber(rsmark02(1),2)&"</span></p>")
	'显示--------是否显示所有留言
			if scorecount>5 then
			response.write("<div class=""showall""><a name=""forAjax"" >显示所有评论</a></div>")
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
		
		response.Write("</cite>位评委:<span>"&rsmark("remark_name")&"</span></td><td><em>评分:<span>"&showscore(rsmark("score").value)&"</span></em></td><tr><td colspan=""2"" ><p><b>评:</b>"&rsmark("remark").value&"</p></td></tr>")
	rsmark.moveprevious
		if rsmark.bof then exit for 
	next
		response.Write("</table>")
	'显示--------是否显示所有留言
			if scorecount>5 then
			response.write("<div class=""showall""><a href=""#tohere"" name=""forAjax"">显示所有评论</a></div>")
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

<%	dim img					'此函数是达到分数用图片显示的作用
	function showscore(score)
		img=""
		for j=1 to len(score)
			s=mid(score,j,1)
			if isnumeric(s) then
				img=img&"<img src=""image/"&s&".gif"" />"
			else
				img=img&"<img src=""image/"&dot&".gif"" />"
			end if 
		next
		showscore=img
	end function
%>
