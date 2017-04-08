<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>管理员页面</title>
<style type="text/css">
	body{ background:url(../image/collegehover.gif);}
	dl{ background:url(../image/collegehover.gif);padding:20px 10px; width:500px; margin:auto; border:solid 5px; border-top:#666 2px;border-left:#666 2px;}
	dl dt{border-left:#666 3px solid; padding:5px 10px; font-size:1.2em; margin:20px 0 0px 0; font-weight:900;}
	dl dd{display:inline;color:#F00;}
	a{color:#000; text-decoration:none; border-bottom:2px #000 solid; padding:3px 5px;}
	a:hover{color:#FFF; background-color:#999;}
</style>
</head>

<body>
<dl>
	<dt>本周人物</dt>
		<dd><a href="peo-add.asp">人物添加</a></dd>
		<dd><a href="../admin-people.asp">人物修改、留言修改删除</a></dd>
	<dt>原创文学</dt>     
		<dd><a href="art-add.asp">文学添加</a></dd>
		<dd><a href="../admin-article.asp">文学修改、留言修改删除</a></dd>
	<dt>商店推荐</dt>     
		<dd><a href="store-add.asp">商店添加</a></dd>
		<dd><a href="../admin-store.asp">商店修改、留言修改删除</a></dd>
	<dt>校内新闻</dt>     
		<dd><a href="addnews.asp" >新闻添加</a></dd>
		<dd><a href="../admin-news.asp">新闻修改、留言修改删除</a></dd>
	<dt>失物认领</dt>     
		<dd><a href="lost-add.asp">失物添加</a></dd>
		<dd><a href="../admin-lost.asp">失物修改删除</a></dd>
	<dt>专业交流</dt>     
		<dd>学校、学院、专业-添加，<a href="college-modify.asp">修改</a>，删除</dd>
	<dt>选修课</dt>     
		<dd>选修课-添加，修改，删除</dd>
	<dt>后台样式管理</dt>     
		<dd><a href="../editor/admin/login.asp">进入</a></dd>
</dl>
</body>
</html>
