<% dim sql,rs
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 6 ID,title,author,tim,[s_contant] from article order by ID desc"
	rs.open sql,conn,1,1

       	
        	 do while not rs.eof %>
            <li>
            <h2><%=rs("title")%></h2>
            <div class="content"><p><span>------<%=rs("author")%></span><%=rs("s_contant")%><span><a href="article.asp?ID=<%=rs("ID")%>">ENTER&nbsp;&nbsp;&gt;&gt;&gt;</a></span></p></div>
            </li>
            <% rs.movenext
				loop       %>
