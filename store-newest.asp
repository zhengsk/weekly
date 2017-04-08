<% dim sql,rs
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 6 ID,title,tim,[s_contant] from store order by ID desc"
	rs.open sql,conn,0,1

       	
        	 do while not rs.eof %>
            <li>
            <h2><%=rs("title")%></h2>
            <div class="content"><p><%=rs("s_contant")%><span><a href="store.asp?ID=<%=rs("ID")%>">ENTER&nbsp;&nbsp;&gt;&gt;&gt;</a></span></p></div>
            </li>
            <% rs.movenext
				loop       %>
