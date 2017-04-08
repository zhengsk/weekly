<% dim sql,rs
	set rs=server.CreateObject("adodb.recordset")
	sql="select top 6 * from news order by ID desc"
	rs.open sql,conn,1,1
	
       	
        	 do while not rs.eof %><title></title>
            <li>
            <h2><%=rs("title")%></h2>
            <div class="content"><p><span>------<%=rs("author")&"&nbsp;&nbsp;"&left(rs("tim"),len(rs("tim"))-8)%></span><%=checklen(rs("contant"))%><span><a href="news.asp?ID=<%=rs("ID")%>">ENTER&nbsp;&nbsp;&gt;&gt;</a></span></p></div>
            </li>
            <% rs.movenext
				loop       
			
			function checklen(contant)
				if len(contant)>250 then
					contant=left(contant,250)
					contant=contant&"............."
				end if
				checklen=contant
			end function

				%>
