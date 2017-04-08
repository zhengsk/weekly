<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本周人物</title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/people.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript"  src="js/formInOutIt.js"></script>
<script type="text/javascript"  src="js/peoplePic.js"></script>
<script type="text/javascript"  src="js/forAjax.js"></script>
<script type="text/javascript" language="javascript" defer="defer">
  window.onload = function() 
  {
	  iFocusChange();//人物图片轮换
	  showAll();
	  vote("voteImg",5,2);
	  face(3);
	  changeInput("user","message");
  }
</script>
</head>
<body >
	<h1 id="top"><img src="image/logo.gif" /></h1>
<ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a class="here">本周人物</a></li>
    <li><a href="article.asp">原创文学</a></li>
    <li><a href="college.asp">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a href="elective.asp">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
	<p id="smallNavi">首页--本周人物</p>
</ul>


<%  dim week
	week=request.QueryString("week")
	showall=request.QueryString("showall")
	set rs=server.CreateObject("adodb.recordset")
	if week="" or week=empty then 
		sql="select top 1 * from people order by week desc"
	else
		sql="select * from people where week="&week
	end if 
	rs.open sql,conn,0,1
	week=rs("week")
	dim infor                  '定义一个变量为要列出的人物的简介
	infor="<li><span>"&rs("name")&"</span></li>"
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
	dim l_img,s_img,motto,experience,title,contant '其各项内容
	l_img=rs("l_img"):s_img=rs("s_img"):motto=rs("motto"):title=rs("title"):contant=rs("contant")
	if rs("experience")<>"" or rs("experience")<>empty then experience="<br />经历："& rs("experience")
	rs.close
%>
	<input name="thePage" id="thePage" type="hidden" value="peo" />
	<input name="theID" id="theID" type="hidden" value="<%=week%>" />
<div class="people">


	<div class="infor">
      <div id="ifocus">
        <div id="ifocus_pic">
      <div id="ifocus_piclist" style="left:0; top:0;"><!----------这个大图片------->
          <ul>
          		<%
					l_img=split(l_img,"|")
				for i=1 to 4
					response.Write("<li><a href=""#""><img src=" &l_img(i)&" alt="""" /></a></li>")
				next
					
				%>
		  </ul>
    </div>
    <div id="ifocus_opdiv"></div>
        <div id="ifocus_tx">
          <ul>
            	<li class="current">1</li>
                <li class="normal">2</li>
                <li class="normal">3</li>
                <li class="normal">4</li>
          </ul>
    </div>
    </div>
    <div id="ifocus_btn">										<!----------这个小图片------->
        <ul>
          		<%
					s_img=split(s_img,"|")
					response.Write("<li class=""current""><a href=""#""><img src=" &s_img(1)&" alt="""" /></a></li>")
				for i=2 to 4
					response.Write("<li class=""normal""><a href=""#""><img src=" &s_img(i)&" alt="""" /></a></li>")
				next
					
				%>
        </ul>
    </div>
 </div><!--ifocus end输出图片的地方-->

   	  <ul class="peoinfor">
		<%=infor%>      <!--在这里输出人物简介-->
      </ul>
        <p>
			<%=motto&experience%> 
      	</p>
        <br />
  </div>


     <div class="contant">
  			<h1><%=title%></h1>
     	<%=contant%>
			
     </div>
        <div class="pre-nex"> <!--#include file="peo-pre-next.asp"--> </div><!--------------------------------------------上下篇人物导航--------->
     <div class="remark" id="remark">
     <!--#include file="peo-remark.asp"-->
     </div>
     <div class="remarkform">
		<form action="peo-check-leaveword.asp?week=<%=week%>" name="msg" id="msg" method="post">
        	<label for="user">评委: </label><input type="text" name="user" id="user" />&nbsp;&nbsp;&nbsp;
            分数:<label id="voteImg" ></label><input name="score" id="score" type="hidden" value="2" />
        <div class="face">
                	<img src="image/s1.jpg" id="img1" name="x" />
             		<img src="image/s2.jpg" id="img2" name="y"/>
                	<img src="image/s3.jpg" id="img3" name="z"/>
                <input name="face" id="face" type="hidden"/>
       	  </div>
          <textarea name="message" id="message" cols="85" rows="5" ></textarea>
          <input name="ok" id="ok" type="submit" value="提交留言" style="padding:5px; color:#899BE4; margin-top:1em;" /> 
	   </form>
	</div>

</div>
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</body>
</html>
