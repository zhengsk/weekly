<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>人物添加----本周人物周刊</title>
<style type="text/css" media="screen">
body{text-align:center;}
div span{color:#FF0000;}
table{margin:50px;}
table td{ padding:10px;}
div a{ color:#0000FF;}
h2{color:#F00;}

</style>
<script type="text/javascript" defer="defer">
window.onload=function(){
	var collegeAndSpeciality=new String (document.getElementById("forCollege").value)//得到学院和专业
	collegeAndSpeciality=collegeAndSpeciality.split("$$")//将学院和专业分解到一个数组中
	college=collegeAndSpeciality[0]//得到学院的名称
	speciality=collegeAndSpeciality[1]//得到专业的名称
	
	allOption=document.getElementsByTagName("option")//获取所有option项目列表
	for(var i=0; i<allOption.length; i++)//这个for循环把学院业显示出来
	{
		if(allOption.item(i).value==college)
		{
			allOption.item(i).setAttribute("selected","selected")
		}
	}
	document.getElementById("province").onchange();//发生一个change事件,这样专业列表显示出来
		var theSpeciality=document.getElementById("citys")
	for(var i=0; i<theSpeciality.childNodes.length; i++)//这个for循环把专业选中
	{
		if(theSpeciality.childNodes.item(i).value==speciality)
		{
			theSpeciality.childNodes.item(i).setAttribute("selected","selected")
		}
	}
}
	
cities = new Object();
cities['作物科学学院']=new Array('农学', '农村区域发展');
cities['植物保护学院']=new Array('植物保护', '制药工程', '生物安全');
cities['园艺学院']=new Array('园艺', '茶学', '设施农业科学与工程');
cities['林学院']=new Array('林学', '资源环境与城乡规划管理', '森林资源保护与游憩', '水土保持与荒漠化防治', '生态学', '统计学');
cities['生命科学学院']=new Array('生物科学 生物学基地班', '生物科学类', '生物信息学', '生物工程');
cities['动物科学学院']=new Array('动物科学', '动物医学', '水产养殖学');
cities['蜂学学院']=new Array('蜂学');
cities['资源与环境学院']=new Array('农业资源与环境', '环境工程', '土地资源管理');
cities['食品科学学院']=new Array('食品科学与工程', '食品质量与安全');
cities['材料工程学院']=new Array('木材科学与工程', '材料科学与工程', '化学工程与工艺', '轻化工程');
cities['计算机与信息学院']=new Array('计算机科学与技术', '软件工程', '电子信息工程','信息与计算科学', '数学与应用数学');
cities['机电工程学院']=new Array('机械类', '电气信息类', '工业工程');
cities['交通学院']=new Array('森林工程  路桥方向', '土木工程', '交通工程', '交通运输', '城市规划', '工程管理', '物流管理');
cities['经济与管理学院、旅游学院（合署）']=new Array('金融学', '国际经济与贸易', '会计学', '工商管理', '行政管理', '农林经济管理', '旅游管理');
cities['人文社会科学学院']=new Array('人力资源管理', '法学', '英语', '公共管理类', '公共管理类  民族班', '预科班');
cities['艺术学院、园林学院（合署）']=new Array('园林', '园林  风景园林方向', '艺术设计', '广告学');
cities['海外学院']=new Array('园艺  中加合作班', '农业资源与环境  中加合作班');
cities['成人教育学院、远程教育学院（合署）']=new Array('还未添加');
cities['金山学院']=new Array('还未添加');
cities['东方学院']=new Array('还未添加');
cities['软件高职人才培养基地']=new Array('软件技术', '软件技术  计算机游戏', '软件技术  计算机办公应用', '计算机网络技术', '图形图像制作  数字媒体制作');
function set_city(province, city)
{
    var pv, cv;
    var i, ii;
    pv=province.value;
    cv=city.value;
    city.length=1;
if(pv=='0') return;
if(typeof(cities[pv])=='undefined') return;
    for(i=0; i<cities[pv].length; i++)
    {
       ii = i+1;
       city.options[ii] = new Option();
       city.options[ii].text = cities[pv][i];
       city.options[ii].value = cities[pv][i];
    }

}


  	function todosth(hide)
		{	
			switch (hide.id)
				{
					case "experience" :
					var webeditor2=document.getElementById("eWebeditor2");
					hide.style.display="none";
					webeditor2.style.display="block";
					break;

					case "s_contant" :
					var webeditor1=document.getElementById("eWebeditor1");
					hide.style.display="none";
					webeditor1.style.display="block";
					break;

					case "contant" :
					var webeditor3=document.getElementById("eWebeditor3");
					hide.style.display="none";
					webeditor3.style.display="block";
					break;
}
		}

</script>

</head>
<%	
	week=request.QueryString("week")
	sql="select * from people where week="& week 
	set rs=conn.execute(sql)
	thisID=rs("ID")
	addtime=rs("addtime")'人物添加的时间
	name=rs("name")'人物的名字
	home_img=rs("home_img")'显示在首页的图片
	s_img=split(rs("s_img"),"|")'把图片分成一个数组，得到一个数组对象，小图片
	l_img=split(rs("l_img"),"|")'同上，得到大图片
	birth=rs("birth")'出生日期
	birthYear=split(birth,"年")
	theYear=birthYear(0)'得到出生年
	birthMonth=split(birthYear(1),"月")
	theMonth=birthMonth(0) '得到出生月
	birthDay=split(birthMonth(1),"日")
	theDay=birthDay(0) '得到出生日
	height=rs("height")'身高
	hometown=rs("hometown")'家乡
	college=rs("college")'学院
	speciality=rs("speciality")'专业
	expertise=rs("expertise")'特长
	interest=rs("interest")'兴趣
	motto=rs("motto")'格言
	experience=rs("experience")'个人经历
	title=rs("title")'文章标题
	s_contant=rs("s_contant")'内容简介
	contant=rs("contant")'文章内容
	rs.close
	set rs=nothing
%>
<body>   <form name="peoadd" action="peo-modify-save.asp" method="post" target="_blank">

<h1>本周人物———修改</h1><input name="thisID" id="thisID" type="hidden" value="<%=thisID%>" />
<table width="800" border="1">
	<tr>
    	<th colspan="2"><h2>修改的人物是第&nbsp;<a href="../people.asp?week=<%=week%>" target="_blank"><%=week%></a>&nbsp;周,人物： <a href="../people.asp?week=<%=week%>" target="_blank"><%=name%></a></h2></th>
    </tr>
  <tr bgcolor="#CCCCCC">
      <td>
    	添加时间  <input name="addtime" type="text" id="addtime" size="15"  value="<%=addtime%>" />

    </td>
    <td width="150"> <label><span>*</span>第:
        <input name="week" type="text" id="week" size="3" maxlength="2" value="<%=week%>" />周人物
    </label></td>
  </tr>
  <tr bgcolor="#D5D8B4">
    <td width="150"><div align="right"><span>*</span>姓名:</div></td>
    <td><label>
      <div align="left">
        <input name="name" type="text" id="name" maxlength="10" value="<%=name%>" />
      	<span>#必须在10个字内</span>      </div>
    </label></td>
  </tr>
  <tr bgcolor="#D5D8B4">
    <td width="150"><div align="right"><span>*</span>首页人物图片:<br /><span style="font-size:12px">可以直接输入网页全网址</span></div></td>
    <td><label>
    
    <!--------------------------------首页人物图片---------------------------------->
      <div align="left">
        <input name="indeximg" type="text" id="indeximg" size="40" onblur="showright('showimg', 'indeximg');" value="<%=home_img%>" />
		<input type="button"  value="首页图片" onclick="showUploadDialog('image', 'peoadd.indeximg', '','showimg', 'indeximg', 'uptheimg', 'indexdelete' )" name="uptheimg" id="uptheimg"/>
        <a href="" id="delete01" name="indexdelete" target="_blank" onclick="comeback('showimg', 'indeximg', 'uptheimg', 'indexdelete');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="首页本周人物相片！" id="showimg" style="display:none;" width="250px" height="200px"/>
   	 </div>
     <hr />
     	<span style="color:#00F">首面图片的尺寸90 * 47： 长为90  高为47</span>
     <hr />
    <!--------------------------------第一张人物小图片---------------------------------->
     <div align="left">
      	第一张小图片：
        <input name="sinput01" type="text" id="sinput01" size="40" value="<%=s_img(1)%>" onblur="showright('simg01', 'sinput01');" />
		<input type="button"  value="第一张小图片" name="sbuttonup01" id="sbuttonup01" onclick="showUploadDialog('image', 'peoadd.sinput01', '','simg01', 'sinput01', 'sbuttonup01', 'sdelete01' )" />
        <a href="" id="sdelete01" name="sdelete01" target="_blank" onclick="comeback('simg01', 'sinput01', 'sbuttonup01', 'sdelete01');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第一张小图片！" id="simg01" style="display:none;" width="250px" height="200px"/>
   	 </div>
    <!--------------------------------第二张人物小图片---------------------------------->
     <div align="left">
      	第二张小图片：
        <input name="sinput02" type="text" id="sinput02" size="40" value="<%=s_img(2)%>" onblur="showright('simg02', 'sinput02');" />
		<input type="button"  value="第二张小图片" name="sbuttonup02" id="sbuttonup02" onclick="showUploadDialog('image', 'peoadd.sinput02', '','simg02', 'sinput02', 'sbuttonup02', 'sdelete02' )" />
        <a href="" id="sdelete02" name="sdelete02" target="_blank" onclick="comeback('simg02', 'sinput02', 'sbuttonup02', 'sdelete02');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第二张小图片！" id="simg02" style="display:none;" width="250px" height="200px"/>
   	 </div>
    <!--------------------------------第三张人物小图片---------------------------------->
     <div align="left">
      	第三张小图片：
        <input name="sinput03" type="text" id="sinput03" value="<%=s_img(3)%>" size="40" onblur="showright('simg03', 'sinput03');" />
		<input type="button"  value="第三张小图片" name="sbuttonup03" id="sbuttonup03" onclick="showUploadDialog('image', 'peoadd.sinput03', '','simg03', 'sinput03', 'sbuttonup03', 'sdelete03' )" />
        <a href="" id="sdelete03" name="sdelete03" target="_blank" onclick="comeback('simg03', 'sinput03', 'sbuttonup03', 'sdelete03');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第三张小图片！" id="simg03" style="display:none;" width="250px" height="200px"/>
   	 </div>
    <!--------------------------------第四张人物小图片---------------------------------->
     <div align="left">
      	第四张小图片：
        <input name="sinput04" type="text" id="sinput04" size="40" value="<%=s_img(4)%>" onblur="showright('simg04', 'sinput04');" />
		<input type="button"  value="第四张小图片" name="sbuttonup04" id="sbuttonup04" onclick="showUploadDialog('image', 'peoadd.sinput04', '','simg04', 'sinput04', 'sbuttonup04', 'sdelete04' )" />
        <a href="" id="sdelete04" name="sdelete04" target="_blank" onclick="comeback('simg04', 'sinput04', 'sbuttonup04', 'sdelete04');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第四张小图片！" id="simg04" style="display:none;" width="250px" height="200px"/>
   	 </div>
     <hr />
     	<span style="color:#00F">小图的尺寸80 * 50： 长为80  高为50</span>
     <hr />
    <!--------------------------------第一张人物大图片---------------------------------->
     <div align="left">
      	第一张大图片：
        <input name="input01" type="text" id="input01" size="40" value="<%=l_img(1)%>" onblur="showright('img01', 'input01');" />
		<input type="button"  value="第一张大图片" name="buttonup01" id="buttonup01" onclick="showUploadDialog('image', 'peoadd.input01', '','img01', 'input01', 'buttonup01', 'bdelete01' )" />
        <a href="" id="bdelete01" name="bdelete01" target="_blank" onclick="comeback('img01', 'input01', 'buttonup01', 'bdelete01');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第一张大图片！" id="img01" style="display:none;" width="250px" height="200px"/>
   	 </div>

    <!--------------------------------第二张人物大图片---------------------------------->
     <div align="left">
      	第二张大图片：
        <input name="input02" type="text" id="input02" size="40" value="<%=l_img(2)%>" onblur="showright('img02', 'input02');" />
		<input type="button"  value="第二张大图片" name="buttonup02" id="buttonup02" onclick="showUploadDialog('image', 'peoadd.input02', '','img02', 'input02', 'buttonup02', 'bdelete02' )" />
        <a href="" id="bdelete02" name="bdelete02" target="_blank" onclick="comeback('img02', 'input02', 'buttonup02', 'bdelete02');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第二张大图片！" id="img02" style="display:none;" width="250px" height="200px"/>
   	 </div>

    <!--------------------------------第三张人物大图片---------------------------------->
     <div align="left">
      	第三张大图片：
          <input name="input03" type="text" id="input03" size="40" value="<%=l_img(3)%>" onblur="showright('img03', 'input03');" />
          <input type="button"  value="第三张大图片" name="buttonup03" id="buttonup03" onclick="showUploadDialog('image', 'peoadd.input03', '','img03', 'input03', 'buttonup03', 'bdelete03' )" />
        <a href="" id="bdelete003" name="bdelete03" target="_blank" onclick="comeback('img03', 'input03', 'buttonup03', 'bdelete03');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第三张大图片！" id="img03" style="display:none;" width="250px" height="200px"/>
   	 </div>

    <!--------------------------------第四张人物大图片---------------------------------->
     <div align="left">
      	第四张大图片：
        <input name="input04" type="text" id="input04" size="40" value="<%=l_img(4)%>" onblur="showright('img04', 'input04');" />
		<input type="button"  value="第四张大图片" name="buttonup04" id="buttonup04" onclick="showUploadDialog('image', 'peoadd.input04', '','img04', 'input04', 'buttonup04', 'bdelete04' )" />
        <a href="" id="bdelete04" name="bdelete04" target="_blank" onclick="comeback('img04', 'input04', 'buttonup04', 'bdelete04');" style="display:none;">删除图片</a>
        <br />
        <img src="" alt="第四张大图片！" id="img04" style="display:none;" width="250px" height="200px"/>
   	 </div>
     <hr />
     	<span style="color:#00F">大图的尺寸460 * 275： 长为460  高为275</span>
        <hr />

    </label></td>
  </tr>

<script type="text/javascript" defer="defer">
// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail, tebox, textimg, upbotton, deleteimg){
	//以下style=coolblue,值可以依据实际需要修改为您的样式名,通过此样式的后台设置来达到控制允许上传文件类型及文件大小
	var arr = showModalDialog("../editor/dialog/i_upload.htm?style=forpeople&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
	  var showimg=document.getElementById(tebox);
	  var indeximg=document.getElementById(textimg);
	  var uptheimg=document.getElementById(upbotton);
	  var delete01=document.links(deleteimg);
	  if (indeximg.value!="")
	  {
	    delete01.style.display="inline";
		showimg.src="../"+indeximg.value;
		showimg.style.display="inline";
		uptheimg.disabled=true;
		var 	delete01=document.links(deleteimg);
	  	delete01.href="deleteimg.asp?pic=" + indeximg.value;
	  }
}

function showright(tebox, textimg) //函数作用是如果是直接输入图片的全地址时显示图片, 事件为文本框indeximg的onblur事件.
	{
	  showimg=document.getElementById(tebox);
	  indeximg=document.getElementById(textimg);
	  if (indeximg.value!="")
	  {
		showimg.src="../"+indeximg.value;
		showimg.style.display="inline";
	  }
	  else
	  {
		showimg.style.display="none";
		}
	}
	

function comeback(tebox, textimg, upbotton, deleteimg) //函数的作用是删除本地图片以后，重新隐藏图片，“删除图片”文字隐藏，文本框和按钮重新可用
	{
		document.getElementById(deleteimg).style.display="none";
		document.getElementById(tebox).src="";
		document.getElementById(tebox).style.display="none";
		document.getElementById(upbotton).disabled=false;
		document.getElementById(textimg).disabled=false;
		document.getElementById(textimg).value="";
	}
</script>

  
  <tr bgcolor="#D5D8B4">
    <td width="150"><div align="right">出生:</div></td>
    <td><label>
      <div align="left">
        <label>
        <select name="year" id="year">
        	<option value="0">-----</option>
        	<%
				for i = 1980 to 2000
					if i=cint(theYear) then
					response.Write("<option value="""&i&""" selected=""selected"">"&i&"</option>")
					else
					response.Write("<option value="""&i&""">"&i&"</option>")
					end if
				next
			%>
        </select>
        </label>
        年
        <select name="month" id="month">
        	<option value="0">-----</option>
        	<%
				for i = 1 to 12
					if i=cint(theMonth) then
					response.Write("<option value="""&i&""" selected=""selected"">"&i&"</option>")
					else
					response.Write("<option value="""&i&""">"&i&"</option>")
					end if
				next
			%>
        </select>
        月
         <select name="day" id="day">
        	<option value="0">-----</option>
        	<%
				for i = 1 to 31
					if i=cint(theDay) then
					response.Write("<option value="""&i&""" selected=""selected"">"&i&"</option>")
					else
					response.Write("<option value="""&i&""">"&i&"</option>")
					end if
				next
			%>
        </select>
        日
			<span>#以新历为准</span></div>
    </label></td>
  </tr>
  <tr bgcolor="#D5D8B4">
    <td width="150"><div align="right">身高:</div></td>
    <td><label>
      <div align="left">
        <input name="height" type="text" id="height" size="3" maxlength="3" value="<%=height%>"/>
        cm<span>#100到200这间的数</span></div>
      </label></td>
  </tr>
  <tr bgcolor="#D5D8B4">
    <td width="150"><div align="right"><span>*</span>家乡:</div></td>
    <td><label>
      <div align="left">
        <input name="hometown" type="text" id="hometown" size="50" maxlength="50" value="<%=hometown%>" />
      <span>#必须在50个字内</span></div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right"><span>*</span>学院:</div></td>
    <td><label><input type="hidden" value="<%=college&"$$"&speciality%>" id="forCollege"/>
      <div align="left">
            <select name="province" id="province" onchange="set_city(this, this.form.city);">
				<option value="">------------请选择学院------------</option>
				<option value="作物科学学院">作物科学学院</option>
                <option value="植物保护学院">植物保护学院</option>
                <option value="园艺学院">园艺学院</option>
                <option value="林学院">林学院</option>
                <option value="生命科学学院">生命科学学院</option>
                <option value="动物科学学院">动物科学学院</option>
                <option value="蜂学学院">蜂学学院</option>
                <option value="资源与环境学院">资源与环境学院</option>
                <option value="食品科学学院">食品科学学院</option>
                <option value="材料工程学院">材料工程学院</option>
                <option value="计算机与信息学院">计算机与信息学院</option>
                <option value="机电工程学院">机电工程学院</option>
                <option value="交通学院">交通学院</option>
                <option value="经济与管理学院、旅游学院（合署）">经济与管理学院、旅游学院（合署）</option>
                <option value="人文社会科学学院">人文社会科学学院</option>
                <option value="艺术学院、园林学院（合署）">艺术学院、园林学院（合署）</option>
                <option value="海外学院">海外学院</option>
                <option value="成人教育学院、远程教育学院（合署）">成人教育学院、远程教育学院（合署）</option>
                <option value="金山学院">金山学院</option>
                <option value="东方学院">东方学院</option>
                <option value="软件高职人才培养基地">软件高职人才培养基地</option>            
            </select>
      </div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right"><span>*</span>专业:</div></td>
    <td><label>
      <div align="left">
             <select   name="city" id="citys" >
                 <option value="" >--请选择专业--</option>
             </select>
      </div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right">特长:</div></td>
    <td><label>
      <div align="left">
        <input name="expertise" type="text" id="expertise" maxlength="255"  value="<%=expertise%>" />
      	<span>#必须在255个字内</span>      </div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right">兴趣:</div></td>
    <td><label>
      <div align="left">
        <input name="interest" type="text" id="interest" maxlength="255"  value="<%=interest%>"/>
      	<span>#必须在255个字内</span>      </div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right">格言(或想说的话):</div></td>
    <td><label>
      <div align="left"><textarea name="motto" cols="50" rows="5"><%=motto%></textarea><span>#必须在255个字内</span>      </div>
    </label></td>
  </tr>
  <tr bgcolor="#C6E6DB">
    <td width="150"><div align="right">经历:</div></td>
    <td><label>
      <div align="left">
        <textarea name="experience" id="experience" cols="70" rows="5" onfocus="todosth(this);"><%=experience%></textarea>
        <iframe id="eWebEditor2" src="../editor/ewebeditor.htm?id=experience&amp;style=forpeople" frameborder="0" scrolling="no" width="600" height="250" style="display:none" ></iframe>
      </div>
      </label></td>
  </tr>
  
  
  <tr bgcolor="#E7F5AD">
    <td width="150"><div align="right"><span>*</span>文章题目:</div></td>
    <td><label>
      <div align="left">
        <input name="title" type="text" id="title" size="30" maxlength="30" value="<%=title%>"/>
        <span>#必须在30个字内</span>      </div>
    </label></td>
  </tr>
  <tr bgcolor="#E7F5AD">
    <td width="150"><div align="right"><span>*</span>内容简介:</div></td>
    <td><label>
      <textarea name="s_contant" id="s_contant" cols="70" rows="5" onfocus="todosth(this);" ><%=s_contant%></textarea>
      <div align="left">
        <iframe id="eWebEditor1" src="../editor/ewebeditor.htm?id=s_contant&amp;style=forpeople" frameborder="0" scrolling="no" width="600" height="250" style="display:none"></iframe>
      </div>
    </label></td>
  </tr>
  <tr bgcolor="#E7F5AD">
    <td width="150"><div align="right"><span>*</span>内容:</div></td>
    <td><label>
      <div align="left">
        <textarea name="contant" id="contant" cols="70" rows="5" onfocus="todosth(this);"><%=contant%></textarea>
        <iframe id="eWebEditor3" src="../editor/ewebeditor.htm?id=contant&amp;style=forpeople" frameborder="0" scrolling="no" width="600" height="350" style="display:none"></iframe>
      </div>
    </label></td>
  </tr>
  <tr bgcolor="#E7F5AD">
    <td colspan="2">
    	<div align="center">
    	  <input name="ok" type="submit" value="Submit"  /> 	
  	  </div></td>
    </tr>
</table>
   </form>
</body>
</html>
