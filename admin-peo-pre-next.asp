<%	
		sql="select min(week) as lastweek , max(week) as firstweek from people"
		rs.open sql,conn,0,1
		firstweek=rs("firstweek")											'获取第一篇文章的ID
		lastweek=rs("lastweek")												'获取最后篇文章的ID
		rs.close

	if week=firstweek then												'如果已经是第一篇文章
		previewtitle="<span>已经是第一周人物</span>"
		if week<>lastweek then '注意这个判断语句的作用,为了防止文章既是第一周也是最后一周时的出错
			sql="select top 1 week,[title] from people where week<"&week&" order by week desc" 		'获取下一篇文章的标题和week
			rs.open sql,conn,0,1
			nexttitle="<a href=""admin-people.asp?week="&rs("week")&""">"&rs("title")&"</a>"
			rs.close
		else
			nexttitle="<span>已经是最后一周人物</span>"
		end if 
	elseif week=lastweek then 												'如果已经最后篇文章
		sql="select top 1 week,title from people where week>"&week&" order by week asc" 		'获取上一篇文章的标题
		rs.open sql,conn,0,1
		previewtitle="<a href=""admin-people.asp?week="&rs("week")&""">"&rs("title")&"</a>"
		rs.close	
		nexttitle="<span>已经是最后一周人物</span>"
	else																'如果不是第一，也不是最后一篇文章
		sql="select top 1 week,title from people where week>"&week&" order by week asc"    	'获取上一篇文章的标题
		rs.open sql,conn,0,1
		previewtitle="<a href=""admin-people.asp?week="&rs("week")&""">"&rs("title")&"</a>"
		rs.close
		sql="select top 1 week,title from people where week<"&week&" order by week desc"  		'获取下一篇文章的标题
		rs.open sql,conn,0,1
		nexttitle="<a href=""admin-people.asp?week="&rs("week")&""">"&rs("title")&"</a>"
		rs.close

	end if 
	response.Write("<span class=""preview"">"&previewtitle&"</span><span class=""next"">"&nexttitle&"</span><a href=""peo-showall.asp""class=""tolist"" title=""查看所有人物"">&nbsp;&nbsp;&nbsp;&nbsp;</a>")
%>
