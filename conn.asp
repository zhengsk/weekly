<% 
Set conn=Server.CreateObject("Adodb.connection")
sql="driver={microsoft access driver (*.mdb)};dbq="&server.MapPath("#date/#news.mdb")
	conn.Open sql
%>
