<% 
'sql="select top 10 ID,max(time) as tim,avg(score) as avgscore ,sum(score) as totalscore from [art_remark] as remark group by ID order by max(time) desc"
 sql="select theremark.avgscore as theavgscore,theremark.totalscore as thetotalscore,thearticle.title as thetitle, thearticle.author as theauthor,theremark.ID as theID from article as thearticle,(select top 10 ID,avg(score) as avgscore ,sum(score) as totalscore from [art_remark] as remark group by ID order by max(time) desc) as theremark where thearticle.ID=remark.ID"
set rs=server.CreateObject("adodb.recordset")
rs.open sql,conn,0,1

do while not rs.eof 

response.Write("<li><a href=""article.asp?ID="& rs("theID") & """>"&rs("thetitle")&"<span>作者:"&rs("theauthor")&"<br />总分:"& rs("thetotalscore") & "<br />平均分:" & formatnumber(rs("theavgscore"),2) & "</span></a></li>")
	rs.movenext
	loop
			%>
			
