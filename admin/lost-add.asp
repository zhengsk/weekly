<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>失物添加</title>
<style>
.wrap{ padding:0;width:520px; height:350px; border:2px solid #f1ffde; background-color:#c4db88; margin:auto; margin-top:50px;position:relative;}
.title{position:absolute;margin:0;width:150px; border:solid 1px #f1ffde;background-color:#a2ba63;font-family:"黑体", "微软雅黑", "宋体";font-size:20px;text-align:center;top:-.8em;left:50px; padding:5px 0; letter-spacing:1em; color:#fbffef;}
ul.contant{ margin-top:40px; list-style:none;}
ul.contant li{margin:4px;}
ul.contant label{width:80px;display:inline-block;text-align:right; margin-right:15px; color:#486300; vertical-align:top;}
ul.contant input{width:250px; padding:2px; border:solid 1px #7f9e2d}
ul.contant textarea{width:244px;border:solid 1px #7f9e2d;overflow:auto;height:60px; padding:5px;}
input.submit{width:120px; padding:3px;background-color:#7d9440; border:solid 1px #f1ffde; display:block; margin:auto; color:#fbffef; font-size:16px;}
</style>
</head>

<body>
<form action="lost-add-save.asp" method="post">
<div class="wrap">
	<p class="title">失物</p>
	<ul class="contant">
      	<li><label for="title">标题:</label><input type="text" name="title" maxlength="30" /></li>
      	<li><label for="goods">物品名称:</label><input type="text" name="goods" maxlength="30" /></li>
      	<li><label for="time">丢失时间:</label><input type="text" name="time" maxlength="30" /></li>
      	<li><label for="place">丢失地点:</label><input type="text" name="place" maxlength="30" /></li>
      	<li><label for="infor">物品描述:</label><textarea name="infor"></textarea></li>
      	<li><label for="host">粗心主人:</label><input type="text" name="host" maxlength="15"/></li>
      	<li><label for="contact">联系方式:</label><input type="text" name="contact" /></li>
      </ul>
    <input type="submit" value="提交" class="submit" />
</div>
</form>
</body>
</html>
