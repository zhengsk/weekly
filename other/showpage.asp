<%

'***********************************************
'函数名：PasteURL
'作  用：向地址中加入 ? 或 &
'参  数：strUrl  ----网址
'返回值：加了 ? 或 & 的网址
'***********************************************
function PasteURL(strUrl)
	if strUrl="" then
		PasteURL=""
		exit function
	end if
	'如果传入的URL末尾不是"?"，有两种情况：
	'1.无“？”，此时需加入一个“？”
	'2. 有“？”再判断有无“&”
	if InStr(strUrl,"?")<len(strUrl) then 
		if InStr(strUrl,"?")>1 then
			if InStr(strUrl,"&")<len(strUrl) then 
				PasteURL=strUrl & "&"
			else
				PasteURL=strUrl
			end if
		else
			PasteURL=strUrl & "?"
		end if
	else
		PasteURL=strUrl
	end if
end function

'***********************************************
'过程名：ShowPage
'作  用：显示“上一页 下一页”等信息
'参  数：sDesURL  ----链接地址，可以是一个文件名，也可以是一个有一些参数所URL
'       nTotalNumber ----总数量
'       nMaxPerPage  ----每页数量
'		    nCurrentPage ----当前页
'       bShowTotal   ----是否显示总数量
'       bShowCombo ---是否用下拉列表显示所有页面以供跳转。有某些页面不能使用，否则会出现JS错误。
'       sUnit     ----计数单位
'***********************************************
sub ShowPage(sDesURL, nTotalNumber, nMaxPerPage, nCurrentPage, bShowTotal, bShowCombo, sUnit)
	dim n, i,strTemp,strUrl
	'计算页数
	if nTotalNumber mod nMaxPerPage=0 then
    	n= nTotalNumber \ nMaxPerPage
  	else
    	n= nTotalNumber \ nMaxPerPage+1
  	end if
  	'判断nCurrentPage
  	if nCurrentPage < 1 then
  		nCurrentPage = 1
  	elseif nCurrentPage > n then
  		nCurrentPage = n
  	end if
  	
  	Response.Write "<table align='center' ID='Table1'><form name='ShowPages' method='Post' action='" & sDesURL & "' ID='Form1'><tr><td>"
	if bShowTotal=true then 
		Response.Write "共 <b>" & nTotalNumber & "</b> " & sUnit & "&nbsp;&nbsp;"
	end if
	'根据输入的sDesURL向它加入?或&
	strUrl=PasteURL(sDesURL)
  	if nCurrentPage<2 then
    		Response.Write "首页 上一页&nbsp;"
  	else
    		Response.Write "<a href='" & strUrl & "page=1'>首页</a>&nbsp;"
    		Response.Write "<a href='" & strUrl & "page=" & (nCurrentPage-1) & "'>上一页</a>&nbsp;"
  	end if

  	if n-nCurrentPage<1 then
    		Response.Write "下一页 尾页"
  	else
    		Response.Write "<a href='" & strUrl & "page=" & (nCurrentPage+1) & "'>下一页</a>&nbsp;"
    		Response.Write "<a href='" & strUrl & "page=" & n & "'>尾页</a>"
  	end if
   	Response.Write "&nbsp;页次：<strong><font color=red>" & nCurrentPage & "</font>/" & n & "</strong>页 "
    Response.Write "&nbsp;<b>" & nMaxPerPage & "</b>" & sUnit & "/页"
	if bShowCombo=True then
		Response.Write "&nbsp;转到：<SELECT name='page' size='1' onchange='javascript:submit()' ID='Select1'>"   
    	for i = 1 to n   
    		Response.Write "<option value='" & i & "'"
			if cint(nCurrentPage)=cint(i) then Response.Write " selected "
			Response.Write ">第" & i & "页</option>"   
	    next
		Response.Write "</SELECT>"
	end if
	Response.Write "</td></tr></form></table>"
end sub
%>