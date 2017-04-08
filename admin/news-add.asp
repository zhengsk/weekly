<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="adminconn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>商家推荐---添加</title>
<style type="text/css" media="all">
body{background-color:#EEEEEE;}
h1{ text-align:center;}
label{display:block; text-align:left; width:150px;}
input{padding:5px; font-size:16px;}
#wrapper{background-color:#B8C8F3; border:solid 1px #1120AA; padding:5px 20px; width:680px; margin:auto;}
</style>

</head>

<body>
<h1>校内新闻----添加</h1>
<div id="wrapper">
<form action="news-add-save.asp" method="post" target="_blank" name="myform">

<label for="title">新闻名称:<input name="title" type="text" size="50" maxlength="50"/>
<hr />
</label>
<label for="author">作者:<input name="author" type="text" size="20" maxlength="10"/></label>
<hr />
<label for="contant">全文</label>
<textarea name="contant" cols="60" rows="10" style="display:none"></textarea>
<iframe id="eWebEditor1" src="../editor/ewebeditor.htm?id=contant&amp;style=fornews" frameborder="0" scrolling="no" width="600" height="350"></iframe>
<hr />
<input name="ok" type="submit" value="添加" style="margin:auto; width:80px;" />
</form>
</div>
</body>
</html>
