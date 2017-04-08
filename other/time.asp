
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
</head>

<body>
<script language="vbscript">
settimeout"clock",1000
sub clock()
 nowtime.innerhtml="现在的时间为:"&hour(now)&"时"&minute(now)&"分"&second(now)&"秒"
 settimeout"clock",1000
 end sub
 </script>
 <center ID="nowtime"></center>
</body>
</html>
