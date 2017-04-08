<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../conn.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<script type="text/javascript">
<!--

var focus_width=255
var focus_height=200
var text_height=18
var swf_height = focus_height+text_height

var pics='http://img1.qq.com/sports/20060102/2958063.jpg|
var links='http://sports.qq.com/a/20060101/000514.htm|http://sports.qq.com/a/20060101/000053.htm|http://sports.qq.com/a/20051229/000159.htm|http://sports.qq.com/a/20051227/000023.htm'
var texts='曲圣卿打进一球两次助攻 阿德莱德大胜|曼城客场被逼平 继海首发多次制造杀机|继海打满全场表现尚可 曼城不敌切尔西|曼城落败 孙继海险助攻'

document.write('<object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" codebase="http://fpdownload.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0" width="'+ focus_width +'" height="'+ swf_height +'">');
document.write('<param name="allowScriptAccess" value="sameDomain"><param name="movie" value="http://sports.qq.com/flash/playswf.swf"><param name=wmode value=transparent><param name="quality" value="high">');
document.write('<param name="menu" value="false"><param name=wmode value="opaque">');
document.write('<param name="FlashVars" value="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'">');
document.write('<embed src="http://sports.qq.com/flash/playswf.swf" wmode="opaque" FlashVars="pics='+pics+'&links='+links+'&texts='+texts+'&borderwidth='+focus_width+'&borderheight='+focus_height+'&textheight='+text_height+'" menu="false" bgcolor="#DADADA" quality="high" width="'+ focus_width +'" height="'+ swf_height +'" allowScriptAccess="sameDomain" type="application/x-shockwave-flash" pluginspage="http://www.macromedia.com/go/getflashplayer" />');  document.write('</object>');

//-->
</script>

</body>
</html>
