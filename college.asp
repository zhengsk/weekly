<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>专业交流</title>
<link href="CSS/home.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/article.css" rel="stylesheet" type="text/css" media="all" />
<link href="CSS/title.css" rel="stylesheet" type="text/css" media="all" />
<script type="text/javascript">
function changeTab(num)//对当前Ｔab项这行样式设置！
{
	clearBefor();
	document.getElementById("head").getElementsByTagName("li")[num-1].className="on";
	document.getElementById("for"+num).style.display="block";
}
 
function clearBefor()//清除原来的所有样式！
 {
	 var headlis=document.getElementById("head").getElementsByTagName("li");
	 for(var i=0;i<headlis.length; i++)
	 {
		 headlis[i].className="";
		 document.getElementById("for"+(i+1)).style.display="none";
	 }
 }
</script>
<style type="text/css" media="all">

.colname{ float:left; margin-top:35px;}/*这个是右边各学院名称无序列表外面的div标签*/
.colname .college li {display:block;font-family:"华文隶书"; font-size:20px; width:230px; }
.colname .college li a{display:block;height:1%; color:#6a8819;margin-left:15px; padding:10px 15px;border:solid 1px #ffffff;}
.colname .college li a:hover{/*border-color:#b6cf84;*/ color:#496401; background: url(image/collegehover.gif) #f9f9f9;}
.colname .college li a.herecollege{border:solid 3px #E0EAC8; border-left-color:#F4F7EC; background:#F4F7EC; margin-left:-5px;}
.main .left h5{font-size:24px;width:420px;height:80px;margin:40px auto 0 auto;background:url(image/college-bg.jpg) center no-repeat;display:block;padding:48px 40px 35px 45px;text-align:center; font:bolder 28px/1.2 "华文行楷", "华文隶书", "方正姚体"; color:#5b2505; letter-spacing:0.4em; position:relative;}
.main .left h5 span{position:absolute;top:20px;left:60px;font-size:14px;font-weight:normal; letter-spacing:0.2em;}

.left h5 span a{ font-family:"宋体";}
.left h5 span a:hover{border-bottom:solid 2px;}


#college-spe{padding:0px; margin:0;margin-left:-20px;}
.college-spe{	float:left; 
				width:1em; height:14em; 
				font-size:20px; 
				padding:70px 40px 0px 40px ; 
				background: url(image/speciality02-bg.jpg) no-repeat top; 
				font-family: "华文隶书", "方正姚体"; }
a .college-spe {color:#3c660d; display:block;height:14em; cursor:pointer;}
a:hover p{color:#70cd06;margin-top:-5px; margin-bottom:5px;}

.main{width:900px;}/* 专业交流版块的特殊情况,为了让页面集中显示出来!*/
.main .left .infor{color:#333333; line-height:1.5em;}
.main .left .infor p{ margin-top:25px; text-indent:2em;}
.main .left .infor p:first-line{color:#FF0000; text-indent:2em;}

/*－－－－－－－－－以下ＣＳＳ为　Ｔab　的*/
#tab{margin: auto; position:relative; top:-2px; left:-4px;width:550px; height:180px; border:solid 3px #b4c68c; background-color:#e7eed6; overflow:hidden;font-size:14px;}
#tab ul#head{height:30px; background-color:#b4c68c; padding-left:20px;}
#tab ul#head li{float:left; margin:0 2px;padding:5px 10px;border:solid 2px #b4c68c; color:#fbfff2; font-weight:bolder;}
#tab ul#head li.on{background-color:#e7eed6; border:solid 2px #e7eed6; color:#527414;}

#tab .tabinfor{padding:20px 0 10px 20px; line-height:23px;}
#tab .tabinfor li{font-size:15px; display:block;}
#tab .tabinfor li a{font-size:14px;}
</style>
</head>          

<body>
<div class="bgtop"><div class="bgbottom">
<h1 id="top"><img src="image/logo.gif" /></h1>
  <ul class="navi">
    <li><a href="home.asp">首页</a></li>
    <li><a href="people.asp">本周人物</a></li>
    <li><a href="article.asp">原创文学</a></li>
    <li><a class="here">专业交流</a></li>
    <li><a href="#">  CET  </a></li>
    <li><a href="elective.asp">选修课</a></li>
    <li><a href="#">公共课</a></li>
    <li><a href="forum.asp">论坛</a></li>
	<p id="smallNavi">首页--本周人物</p>
  </ul>
<!----------------------------------------------导航栏到此结束------------------------------------------------------------------->
<%	
	id=cint(request.QueryString("ID"))
	num=cint(request.QueryString("num"))
	college=request.QueryString("collegename")
	if college="" and id<>0 then college="<a href=""college.asp"">福建农林大学</a>"
		if id<>0then 
			response.Write("<style type=""text/css"">.colname .college li a.here"&id&"{border:solid 3px #E0EAC8; border-left-color:#F4F7EC; background:#F4F7EC; margin-left:-5px;}</style>")
			sql="select * from college where ID="&id&"and number="&num
			if num=0 then 
				sql="select * from college where ID="&id
			else
				sql="select * from college where ID="&id&"and number="&num
				response.Write("<style type=""text/css"">.main .left h5{background:url(image/speciality-bg.jpg) center no-repeat;}</style>")
			end if 
		else			
			sql="select * from college where ID="&id
		end if
	set rs=server.CreateObject("adodb.recordset")
	rs.open sql,conn,0,1
	rs.movefirst
	collegename=rs("speciality")
%>
<div class="main">
	<div class="left">
		<h5><span><a href="college.asp?id=<%=id%>"><%=college%></a></span><%=collegename%></h5>
			<div id="tab">
				<ul id="head">
					<li onmousemove="changeTab(1)" class="on">最新主题</li>
					<li onmousemove="changeTab(2)" class="">最新回复</li>
					<li onmousemove="changeTab(3)" class="">网站推荐</li>
				</ul>
				<div id="for1" class="tabinfor">
					<ul>
						<li><a href="http://sports.sina.com">00新帅 退中国女排2议幸宣布位蔡斌上任</a></li>
						<li><a href="http://sports.sina.com">球米兰争陈忠和意甲伊布运平</a></li>
						<li><a href="http://sports.sina.com">哈维进球西甲-英超-杰浦加3助攻</a></li>
						<li><a href="http://sports.sina.com">拉德帽子戏法 利物5-0胜维拉</a></li>
						<li><a href="http://sports.sina.com">球米兰争陈忠和意甲伊布运平</a></li>
					</ul>
				</div>
				<div id="for2" class="tabinfor">
					<ul>
						<li><a href="http://sports.sina.com">11中国女排宣布新帅 陈忠和退位蔡斌上任</a></li>
						<li><a href="http://sports.sina.com">意甲伊布2球米兰争议幸运平</a></li>
						<li><a href="http://sports.sina.com">西甲-哈维进球加3助攻</a></li>
						<li><a href="http://sports.sina.com">英超-杰拉德帽子戏法 利物浦5-0胜维拉</a></li>
						<li><a href="http://sports.sina.com">哈维进球西甲-英超-杰浦加3助攻</a></li>
					</ul>
				</div>
				<div id="for3" class="tabinfor">
					<ul>
						<li><a href="http://sports.sina.com">22中国退-哈维进球位蔡斌上任</a></li>
						<li><a href="http://sports.sina.com">女布新帅 陈忠和意甲伊布2球米兰争议幸运平</a></li>
						<li><a href="http://sports.sina.com">-杰拉德西排宣甲加3助攻</a></li>
						<li><a href="http://sports.sina.com">哈维进球西甲-英超-杰浦加3助攻</a></li>
						<li><a href="http://sports.sina.com">英超帽子戏法 利物浦5-0胜维拉</a></li>
					</ul>
				</div>
			</div>
        <div id="college-spe"><!---显示学院以下的专业或专业以下的专业论坛内容-->
        	<% if id<>0 and num=0 then
					rs.movenext
					do while not rs.eof
					response.Write("<a href=""college.asp?ID="&id&"&num="&rs("number")&"&collegename="&collegename&"""><p class=""college-spe"">"&rs("speciality")&"</p></a>")
					rs.movenext
					loop
				else

				end if 
			rs.movefirst
			%>
        </div>
       	<div class="infor"><%=rs("speinfor")%></div><!----------------------------------学院或专业简介---------------------->
        
        
	</div>
    
	<div class="colname">
		<ul class="college">
                    <% rs.close 
			sql="select speciality from college where ID>0 and number=0 order by id asc"
		rs.open sql,conn,0,1
		
			for i=1 to 30
				response.Write("<li><a class=""here"&i&""" href=""college.asp?ID="&i&""">"&rs("speciality")&"</a></li>")
				rs.movenext
				if rs.eof then exit for
			next
		
		%>

		</ul>
    </div>

	<div class="clear"></div><!-------------------------------------------------------------------清除浮动---------->
</div>

<!----------------------------------------------页脚------------------------------------------------------------------->
<h1 id="foot"> <span>Copyright @ 2008—2012 福农林大学人物周刊网</span> <em>www.fafurwzk.com </em> </h1>
</div></div>
</body>
</html>
