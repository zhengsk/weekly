<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>原创文学---添加</title>
<style type="text/css" media="all">
body{background-color:#EEEEEE;}
h1{ text-align:center;}
label{display:block; text-align:left;}
#wrapper{background-color:#B8C8F3; border:solid 1px #1120AA; padding:5px 20px; width:680px; margin:auto;}
</style>
<script type="text/javascript" defer="defer">
// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	var arr = showModalDialog("../editor/dialog/i_upload.htm?style=forarticle&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
	  var theImg=document.getElementById("peoImg");//获取图片对象
	  var imgSrc=document.getElementById("imgin").value;//获取图片新地址
	  var upInput=document.getElementById("toUpImg");//获取上传图片的上传按钮
	  var deleteText=document.getElementById("delete");//获取删除图片的链接对象
	  if (imgSrc!="")
	  {
		theImg.src="../"+imgSrc;//把上传的图片显示出来
	    deleteText.style.display="inline";//删除图片的链接显示出来
		upInput.disabled=true;
	  	deleteText.setAttribute("href","deleteimg.asp?pic=" + imgSrc);
	  }
}

function showright(tebox, textimg) //函数作用是如果是直接输入图片的全地址时显示图片, 事件为文本框的onblur事件.
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
	

function comeback() //函数的作用是删除本地图片以后，重新返回图片，“删除图片”文字隐藏，文本框和按钮重新可用
	{
	  document.getElementById("peoImg").setAttribute("src","../image/nopeole.gif");//改回图片
	  document.getElementById("toUpImg").disabled=false;//上传图片的上传按钮可用
	  document.getElementById("delete").style.display="none";//把删除图片的链接对象隐藏
	  document.getElementById("imgin").value="";//删除文本框中的原有图片地址
	}
function showright(tebox, textimg) //函数作用是如果是直接输入图片的全地址时显示图片, 事件为文本框indeximg的onchange事件.
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
		showimg.setAttribute("src","../image/nopeole.gif");
		}
	}
</script>

</head>

<body>
<h1>原创文学添加</h1>
<div id="wrapper">
<form action="art-add-save.asp" method="post" target="_blank" name="myform">

<label for="title">文章题目</label><input name="title" type="text" size="50" maxlength="50"/>
<label for="authorname">作者姓名：</label><input name="authorname" type="text" size="50" maxlength="50"/>
<hr />

<div class="authorInfor">
	<label for="author">作者简介：</label><textarea name="author" cols="40" rows="10" ></textarea>
	<img src="../image/nopeole.gif" width="250" height="150" id="peoImg" />
	<div>
		<input type=text name='imgin' id="imgin" size=50 onchange="showright('peoImg','imgin')"><input type=button id="toUpImg" value="上传图片..." onclick="showUploadDialog('image', 'myform.imgin', '')" />
        <a href="" id="delete" name="indexdelete" target="_blank"  style="display:none;" onclick="comeback()">删除图片</a>

	</div>
</div>


<hr />
<label for="s_contant">内容简介：</label><textarea name="s_contant" cols="60" rows="10" ></textarea>
	<hr />
<label for="contant">全文</label>

	<textarea name="contant" cols="60" rows="10" style="display:none"></textarea>
	<iframe id="eWebEditor1" src="../editor/ewebeditor.htm?id=contant&amp;style=forarticle" frameborder="0" scrolling="no" width="600" height="350"></iframe>
<br />
<input name="ok" type="submit" value="添加" />
</form>
</div>
</body>
</html>
