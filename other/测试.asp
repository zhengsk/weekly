<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<script language="javascript">
// 参数说明
// s_Type : 文件类型，可用值为"image","flash","media","file"
// s_Link : 文件上传后，用于接收上传文件路径文件名的表单名
// s_Thumbnail : 文件上传后，用于接收上传图片时所产生的缩略图文件的路径文件名的表单名，当未生成缩略图时，返回空值，原图用s_Link参数接收，此参数专用于缩略图
function showUploadDialog(s_Type, s_Link, s_Thumbnail){
	//以下style=coolblue,值可以依据实际需要修改为您的样式名,通过此样式的后台设置来达到控制允许上传文件类型及文件大小
	var arr = showModalDialog("editor/dialog/i_upload.htm?style=forpeopleimg&type="+s_Type+"&link="+s_Link+"&thumbnail="+s_Thumbnail, window, "dialogWidth:0px;dialogHeight:0px;help:no;scroll:no;status:no");
}

function changeimg()
	{
	  var sss=document.getElementById("smallimg");
	  var www=document.getElementById("theimg");
	  sss.src=www.value

	}
</script>

</head>

<body>
<form id="form1" name="form1" method="post" action="">

	<input type="text" name="theimg" id="theimg" value="" onchange="changeimg();" />
	<input type="button" onClick="showUploadDialog('image', 'form1.theimg', 'smallimg')" />
    <img src="http://www.baidu.com/img/baidu_logo.gif" name="smallimg" id="smallimg" />

</form>
</body>
</html>
