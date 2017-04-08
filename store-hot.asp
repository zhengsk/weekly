<% 
sql="select top 10 ID,max(tim) from [store_remark] group by ID order by max(tim) desc"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,0,1

set rs02=server.CreateObject("adodb.recordset")

do while not rs.eof 

		sql="select title from store where id="&rs("id")
		rs02.open sql,conn,0,1
%>
 			<li>
            	<a href="store.asp?ID=<%=rs("id")%>"><%=rs02("title")%></a>
            </li>
            
<%	rs02.close
	rs.movenext
	loop
%>