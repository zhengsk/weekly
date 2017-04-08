<% 
sql="select news.id, news.author,news.title,news.tim,theRemark.face,theRemark.remark,theRemark.remark_name from (select top 10 id,max(ord) as theord from [news_remark] group by ID order by max(ord) desc) as theTenId,news,[news_remark] as theRemark where news.id=theTenId.id and theRemark.ord=theTenId.theord"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,0,1

do while not rs.eof
	
%>

 	<li>
      <a href="news.asp?ID=<%=rs("id")%>"><%=rs("title")%><br /><em>作者:<%=rs("author")%>&nbsp;&nbsp;时间:<%=rs("tim")%></em><br /><span>最后留言:&nbsp;&nbsp;<%=rs("remark_name")%><%="<img src=""image/face"&rs("face")&".gif"" alt=""支持"" />"&remarkname%><br /><blockquote><%=left(rs("remark"),30)&"……"%></blockquote></span></a>
      </li>
<%            
	rs.movenext

loop
rs.close
set rs=nothing
%>