<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<%
dim week,rs,sql
	week=request.QueryString("week")
	sql="select * from people where week="&week
	set rs=server.CreateObject("ADODB.recordset")
	rs.open sql,conn,0,1
	
	week=rs("week")'------------------取得第几周人物
	allheart=rs("heart")'------------------取得桃心个数
	dim infor							'定义一个变量为要列出的人物的简介
	peoname=rs("name") '-------------人名
	infor="<li><span>"&peoname&"</span></li>" '------取得人物信息
	dim peoHeight
	for i=7 to 13
		if rs(i)<>"" then
			select case i
				case 7
					infor=infor&"<li>"&rs(7)
				case 8
					if rs(8)<>empty then
						infor=infor&"&nbsp;&nbsp;&nbsp;身高："&rs(8)&"cm</li>"
					else
						infor=infor&"</li>"
					end if
				case 12
					infor=infor&"<li>特长："&rs(12)&"</li>"
				case 13
					infor=infor&"<li>兴趣："&rs(13)&"</li>"
				case else
					infor=infor&"<li>"&rs(i)&"</li>"
			end select
		end if 
	next
	dim l_img,s_img,motto,experience,title '其各项内容
	l_img=rs("l_img"):s_img=rs("s_img"):title=rs("title")
	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
	allsponse=week&"$$$$$"&peoname&"$$$$$"&allheart&"$$$$$"&infor&"$$$$$"&title&"$$$$$"&l_img&"$$$$$"&s_img
	response.Write(allsponse)
%>
