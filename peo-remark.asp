<% set rsmark=server.CreateObject("adodb.recordset")
	set rsmark02=server.CreateObject("adodb.recordset")
		sql="select top 5 [remark_name],[remark],[heart],[face],[time] from [peo_remark] where week="&week&" order by ord desc "
		sql02="select remarknum,heart,facex,facey,facez from [people] where week="&week
	rsmark.open sql,conn,1,1
	rsmark02.open sql02,conn,0,1
	remarknum=rsmark02("remarknum")
	heart=rsmark02("heart")
	response.Write(scorecount)
	if remarknum>=1 then
	response.Write("<p class=""score"">本文共有<span>"&remarknum&"</span>人发表感想&nbsp;&nbsp;&nbsp;共收到:<span>"& heart &"</span>颗<img src=""image/star_big.gif"" /></p>")
	'显示--------是否显示所有留言
			if remarknum>5 then
			response.write("<div class=""showall""><a name=""forAjax"" >显示所有留言</a></div>")
			end if 
	'显示--------是否显示所有留言
	
	
	response.Write("<table>")
	rsmark.movelast
	for i=1 to remarknum				
		response.Write("<tr><td>第<cite>")
		if remarknum<5 then
			response.Write(i)
		else
			if showall="true" then 
			response.Write(i)
			else
				response.Write(remarknum-5+i)
			end if 
		end if 
		
		response.Write("</cite>位评委:<span>"&rsmark("remark_name")&"</span>"&rsmark("time")&"</td><td><em>评分:<span>"&showscore(rsmark("heart"))&"</span></em></td><tr><td colspan=""2"" ><p><img src=""image/"&rsmark("face")&".jpg"" alt=""支持"" /><b>评:</b>"&rsmark("remark").value&"</p></td></tr>")
	rsmark.moveprevious
		if rsmark.bof then exit for 
	next
		response.Write("</table>")
	'显示--------是否显示所有留言
			if remarknum>5 then
			response.write("<div class=""showall""><a href=""#remark"" name=""forAjax"" >显示所有留言</a></div>")
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

<%	
	dim img					'此函数是达到分数用图片显示的作用
	function showscore(score)
		img=""
		for j=1 to score
		img=img+"<img src=""image/star_on.gif"" />"
		next
		for x=score to 4
		img=img+"<img src=""image/star_off.gif"" />"
		next
		showscore=img
	end function
%>
