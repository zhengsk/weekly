<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>本周人物</title>
<link href="CSS/title.css" rel="stylesheet" type="text/css" />
<link href="CSS/showallpeo.css" rel="stylesheet" type="text/css" />
<style type="text/css">
.wrapper{width:960px; margin:0 auto 20px auto; background-color:#d5e2b4;}

.allList{width:310px; height:390px; float:left; background-color:#748744; padding:10px;}
.allList ul { margin:auto;}
.allList ul li{float:left; width:87px; height:80px; background-color:#e2ecc9;margin:12px 8px; display:inline;}
.allList ul li a{display:block; height:70px;text-align:center; padding-top:10px;}
.allList ul li a:hover{background-color:#5d693f;}
.allList ul li.onclick{border:solid 2px #e2ecc9; margin:10px 6px; background-color:#5d693f;}
.allList ul li span{font-size:12px; color:#F00; display:block;clear:both; margin-top:5px;} 
.allList ul li span span{display:inline;} 
.allList p.upandDown{ height:70px; background-color:#576633; clear:both;color:#D5E2B4; line-height:70px; text-align:center;}

.oneWeek{width:576px; height:392px; float:right; background-color:#748744; padding:10px 22px; position:relative;}
.oneWeek p.weeknum,.oneWeek p.peotitle{background-color:#effad2; font-size:16px;color:#323a1d; padding:8px;position:relative;}
.oneWeek p.weeknum{padding-right:30px; background:#effad2 url(image/star_big.gif) no-repeat 530px center;}
.oneWeek p.weeknum #peoName{font-weight:bolder;}
.oneWeek p.weeknum .allheart{position:absolute; right:50px;_right:70px;}
.oneWeek p.weeknum .allheart span{color:#F00;font-weight:bold;}
.oneWeek p.peotitle{font-weight:bold;}
.theInfor{clear:both; width:960px; height:190px; background-color:#475428; border-top:10px solid #d5e2b4; position:relative;}
.theInfor ul#peoInfor{color:#EFFAD2; margin:20px; width:600px;}
.theInfor ul#peoInfor li:first-child{font-size:1.2em; font-weight:bold;}
.theInfor a#toPeoplePage{width:50px; height:20px; position:absolute;right:30px; top:30px; background:url(image/home-to.gif) no-repeat 2px 2px; padding-right:20px; border-left:20px solid transparent; _border:none;}
.theInfor a#toPeoplePage:hover{background:url(image/home-to.gif) no-repeat 6px bottom;}
</style>
<script type="text/javascript" defer="defer" src="js/peoplePic.js"></script>
<script type="text/javascript" defer="defer">
  var xmlHttp = false;
  function onPeoLiClick()//改变人物列表的每一个周人物当鼠标点过的时候发生的事和用于人物中显示人物列表的页面.
  {
	  var peoUl=document.getElementById("peoList");
	  if(peoUl.firstChild.nodeType==1)//第一次加载时,默认的第一个人物被选中
	  {
	  	peoUl.firstChild.className="onclick";//在IE中第一个人物被选中
	  }
	  else
	  {
		  peoUl.firstChild.nextSibling.className="onclick"//在FF中第一个人物被选中
	  }
	  for(var i=0; i<peoUl.childNodes.length; i++)
	  {
	  	if(peoUl.childNodes.item(i).nodeType==1)//判断是否为标签节点,如果不是而是文本节点则不做另何事
		{
			if(peoUl.childNodes.item(i).getElementsByTagName("a").item(0).getAttribute("name"))//判断显示的图片是否为某一周人物
			{
				peoUl.childNodes.item(i).onclick=function()
				{
					for(var i=0; i<this.parentNode.childNodes.length; i++)
					{this.parentNode.childNodes.item(i).className="";}
					this.className="onclick";
					mainAjax(this.getElementsByTagName("A").item(0).getAttribute("name"))
					return false;
				}
			}
		}
	  }
  }
  function creatObject() //创建一个XmlHttp对象
  {
	  try 
	  {
  		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	  } 
	catch (e) {
  			try 
			{
    			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  			} 
			catch (e2) 
			{
    			xmlHttp = false;
  			}
		}
	if (!xmlHttp && typeof XMLHttpRequest != 'undefined') 
	{
		xmlHttp = new XMLHttpRequest();
	}
  }
  function mainAjax(theWeek)//向页面发送请求
  {
	  if(theWeek==null){return;}
	  var url="peo-showall-for-ajax.asp?week="+theWeek
	  xmlHttp.open("GET", url, true);
	  xmlHttp.onreadystatechange=getData;
	  xmlHttp.send(null);
  }
  function getData() //把数据插入到页面中
  {
	  if (xmlHttp.readyState==4)
  		{
			var theData=xmlHttp.responseText;
			var allSponse=theData.split("$$$$$")
			var week=allSponse[0]
			var peoname=allSponse[1]
			var allHeart=allSponse[2]
			var infor=allSponse[3]
			var title=allSponse[4]
			var l_img=allSponse[5].split("|")
			var s_img=allSponse[6].split("|")
			document.getElementById("weekNum").innerHTML=week
			document.getElementById("toPeoplePage").setAttribute("href","people.asp?week="+week)
			document.getElementById("peoName").innerHTML=peoname
			document.getElementById("allHeart").innerHTML=allHeart
			document.getElementById("peoTitle").innerHTML=title
			document.getElementById("peoInfor").innerHTML=infor
			for(var i=0; i<4; i++)
			{
			document.getElementById("smallImg").getElementsByTagName("img").item(i).setAttribute("src",s_img[i+1])
			document.getElementById("largeImg").getElementsByTagName("img").item(i).setAttribute("src",l_img[i+1])
			}
			
		}
  }
  window.onload = function() 
  {
	  iFocusChange();
	  onPeoLiClick();
	  creatObject();
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
</ul>
    <%  dim week,peoname,title,l_img,s_img,infor
	set rs=server.CreateObject("adodb.recordset")
	if week="" or week=empty then 
		sql="select top 1 * from people order by week desc"
	else
		sql="select * from people where week="&week
	end if 
	rs.open sql,conn,0,1
	week=rs("week")
	peoname=rs("name")
	heart=rs("heart")
	title=rs("title")
    l_img=split(rs("l_img"),"|")
	s_img=split(rs("s_img"),"|")
	infor="<li><span>"&peoname&"</span></li>"
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
	rs.close
	'以下是为了提取左边的九周人物显示的小图标
	sql="select top 9 week,home_img from people order by week desc"
	rs.open sql,conn,0,1
	%>

<div class="wrapper">
	<div class="allList">
    	<ul id="peoList">
       <%
	   for i=1 to 9
	   	if rs.eof then
        response.Write("<li><a href=""#"" ><img src=""image/nopeole.gif""  /><span>第X周人物</span></a></li>")
		else
        response.Write("<li><a href=""#"" name="""&rs("week")&"""><img src="""&rs("home_img")&""" width=""72px"" height=""46px"" /><span>第<span name=""liWeek"">"&rs("week")&"</span>周人物</span></a></li>")
		rs.movenext
		end if 
		next
		%>
       </ul>
        <p class="upandDown">
        	本周人物中共有<%=week%>人记录在案
        </p>
    </div>
    

    <div class="oneWeek">
        <p class="weeknum">
         <span class="allheart">共收到<span id="allHeart"><%=heart%></span>颗</span>
        	第<span id="weekNum"><%=week%></span>周人物:<span id="peoName"><%=peoname%></span>
        </p>
        <div class="infor">
      		<div id="ifocus">
       		<div id="ifocus_pic">
      			<div id="ifocus_piclist" style="left:0; top:0;"><!----------这个大图片------->
          			<ul id="largeImg">
					  <%
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
        <ul id="smallImg">
          		<%
					response.Write("<li class=""current""><a href=""#""><img src=" &s_img(1)&" alt="""" /></a></li>")
				for i=2 to 4
					response.Write("<li class=""normal""><a href=""#""><img src=" &s_img(i)&" alt="""" /></a></li>")
				next
					
				%>
        </ul>
    </div>
    </div>
      </div><!--ifocus end输出图片的地方-->
        <p class="peotitle" id="peoTitle"><%=title%></p>
    </div>
    <div class="theInfor" >
    	<ul id="peoInfor">
		<%=infor%>
        </ul>
    	<a href="people.asp?week=<%=week%>" id="toPeoplePage" title="查看本周人物" ></a>
    </div>

</div>
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</body>
</html>
