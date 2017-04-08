<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<style type="text/css" media="all">
body{text-align:center; background-color:#EEEEEE;}
label{display:block; text-align:left;}
input{display:block;}
#wrapper{background-color:#B8C8F3; border:solid 1px #1120AA; padding:5px 20px; width:600px;}
</style>
</head>

<body>
<h1>文章添加</h1>
<div id="wrapper">
<form action="" method="get">

<label for="title">文章题目：</label><input name="title" type="text" maxlength="50"/>
<label for="author">作者姓名：</label><input name="author" type="text" maxlength="50"/>
<hr />
<label for="s-contant">内容简介：</label>

	<textarea name="s-contant" cols="60" rows="10" style="display:none"></textarea>
	<iframe ID="eWebEditor1" src="ewebeditor/ewebeditor.asp?id=s-contant&style=s_coolblue" frameborder="0" scrolling="no" width="500" HEIGHT="350"></iframe>
    
    
<hr />
<label for="s-contant">简介：</label>

	<textarea name="contant" cols="60" rows="10" style="display:none"></textarea>
		<iframe ID="eWebEditor1" src="ewebeditor/ewebeditor.asp?id=s-contant&style=s_coolblue" frameborder="0" scrolling="no" width="500" HEIGHT="350"></iframe>

<hr />
<label for="author">作者简介：</label>
<textarea name="s-contant" cols="60" rows="10" style="display:none"></textarea>
		<iframe ID="eWebEditor1" src="ewebeditor/ewebeditor.asp?id=s-contant&style=s_coolblue" frameborder="0" scrolling="no" width="500" HEIGHT="350"></iframe>
<input name="ok" type="button" value="添加" />
</form>
</div>
</body>
</html>
