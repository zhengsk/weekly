<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>保存----人物添加</title>
</head>

<body>
<%
	dim week,name,home_img,s_img,l_img,year,month,day,height,hometown,college,speciality,expertise,interest,motto,experience,title,s_contant,contant,birth
	
	theID=cint(request.Form("thisID"))
	week=request.Form("week")
	name=request.Form("name")
	addtime=CDate(request.Form("addtime"))
	home_img=request.Form("indeximg")
	for i=1 to 4
		xx=request.Form("sinput0" & i)
		if xx="" or xx=empty then
			s_img=""
			exit for
		else
			s_img=s_img & "|" & xx

		end if 
	next
	for i=1 to 4
		yy=request.Form("input0" & i)
		if yy="" or yy=empty then
			l_img=""
			exit for
		else
			l_img=l_img & "|" & yy
		end if 
	next
	year=request.Form("year")
	month=request.Form("month")
	day=request.Form("day")
	theHeight=request.Form("height")
	hometown=request.Form("hometown")
	college=request.Form("province")
	speciality=request.Form("city")
	expertise=request.Form("expertise")
	interest=request.Form("interest")
	motto=request.Form("motto")
	experience=request.Form("experience")
	title=request.Form("title")
	s_contant=request.Form("s_contant")
	contant=request.Form("contant")
	
'判断是不有输入正确的出生年月日
	birth=""
	if year<>"0" then 	
		birth=year & "年"
		if month<>"0" then
			birth=birth & month & "月"
			if day<>"0" then
				birth=birth & day & "日"
			end if
		end if 
	end if 
'判断是不有输入正确的出生年月日 在这里最终得出birth值
	
' 添加人物的sql 语句	
	sql="update people set week='"&week&"',name='"&name&"', addtime='"&addtime&"', home_img='"&home_img&"', s_img='"&s_img&"', l_img='"&l_img&"',birth='"&birth&"',height='"&theHeight&"',hometown='"&hometown&"',college='"&college&"',speciality='"&speciality&"',expertise='"&expertise&"',interest='"&interest&"',motto='"&motto&"',experience='"&experience&"',title='"&title&"',s_contant='"&s_contant&"',contant='"&contant&"'where ID="&theID
' 添加人物的sql 语句
	if 	week="" or name="" or home_img="" or s_img="" or l_img="" or hometown="" or college="" or speciality="" or title="" or s_contant="" or contant="" then 
		response.Write("<center>----------请注意要求,您有填写不完整的内容-------------------<br />---------------带""*""号的为必填内容--------------<center />")
	else
		response.Write(interest)
		conn.execute(sql)
	end if 

%>
</body>
</html>
