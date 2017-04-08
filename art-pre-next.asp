<%	
		sql="select min(ID) as lastID , max(ID) as firstID from article"
		rs.open sql,conn,0,1
		firstID=rs("firstID")											'获取第一篇文章的ID
		lastID=rs("lastID")												'获取最后篇文章的ID
		rs.close
		
	if ID=firstID then													'如果已经是第一篇文章
		sql="select top 1 ID,title from article where ID<"&ID&" order by ID desc" 		'获取下一篇文章的标题和ID
		rs.open sql,conn,0,1
		nexttitle="<a href=""article.asp?ID="&rs("ID")&""">"&rs("title")&"</a>"
		rs.close
		previewtitle="<span>已经是第一篇</span>"
	elseif ID=lastID then 												'如果已经最后篇文章
		sql="select top 1 ID,title from article where ID>"&ID&" order by ID asc" 		'获取上一篇文章的标题
		rs.open sql,conn,0,1
		previewtitle="<a href=""article.asp?ID="&rs("ID")&""">"&rs("title")&"</a>"
		rs.close
		nexttitle="<span>已经是最后一篇</span>"
	else																'如果不是第一，也不是最后一篇文章
		sql="select top 1 ID,title from article where ID>"&ID&" order by ID asc"    	'获取上一篇文章的标题
		rs.open sql,conn,0,1
		previewtitle="<a href=""article.asp?ID="&rs("ID")&""">"&rs("title")&"</a>"
		rs.close
		sql="select top 1 ID,title from article where ID<"&ID&" order by ID desc"  		'获取下一篇文章的标题
		rs.open sql,conn,0,1
		nexttitle="<a href=""article.asp?ID="&rs("ID")&""">"&rs("title")&"</a>"
		rs.close
	end if 
		response.Write("<span class=""preview"">"&previewtitle&"</span><span class=""next"">"&nexttitle&"</span><a href=""art-showall.asp""class=""tolist"" title=""查看所有文章"">&nbsp;&nbsp;&nbsp;&nbsp;</a>")
%>

