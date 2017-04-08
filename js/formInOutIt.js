//-----------------------------评分函数
		var imgOn="image/star_big.gif"; //打开的分数图片--------
		var imgOff="image/star_big_off.gif";//关闭的图片分数---
		var theAll
function vote(rapper,allScore,beginScore)
{
	var allImg=""
	document.getElementById("score").value=beginScore;
	for(var i=1; i<=beginScore; i++)
	{
		allImg+= "<img src=\"" + imgOn + "\" id=\"voteImg"+ i + "\" \/>";
	}
	for(var i=beginScore+1; i<=allScore; i++)
	{
		allImg+= "<img src=\"" + imgOff + "\" id=\"voteImg"+ i + "\" \/>";
	}
	document.getElementById(rapper).innerHTML=allImg;
	theAll=allScore
	for(var i=1 ;i<=allScore; i++)
	{
		document.getElementById("voteImg"+i).onmouseover=overImg;
	}
}
function overImg()//评分函数的一部分
	{
		for(var i=1; i<=theAll; i++)
		{
		document.getElementById("voteImg"+i).src=imgOff;
		}
		
		var theId=this.id;
			theId=theId.substr(theId.length-1);
		for(var i=1; i<=theId; i++)
		{
			document.getElementById("voteImg"+i).src=imgOn;
		}
		document.getElementById("score").value=theId;
	}
	

//-------------------------------------------------改变输入文本框样式
function changeInput()
{
		for(var i=0;i<arguments.length; i++)
		{
				document.getElementById(arguments[i]).onfocus=function (){this.style.background="#FFFFFF";this.style.borderWidth="1px 3px 3px 1px";}
				document.getElementById(arguments[i]).onblur=function (){this.style.background="#F4F7EC";this.style.borderWidth="1px";}
		}
	}

function face(faceNum)/*//----------------------------表情添加样式 //*/
{
	for(var i=1; i<=faceNum; i++)
	{
		var thisImg=document.getElementById("img"+i)
		thisImg.onclick=function()
		{
				for(var i=1; i<=faceNum; i++)
				{
					document.getElementById("img"+i).className="onblur"
				}
				this.className="imgonclick";
				document.getElementById("face").value=this.name
		}
	}
}

//---------------------检查表单是否可以提交
var xx=false;
var yy=false;
function checkForm()
{
	checkScore("score");
	checkMessage("message");
}

//----------给文章评分的时候,判断分数是不是在0到100之间

function checkScore(score)
{
	var scoreInput=document.getElementById(score);
	scoreInput.onchange=scoreInput.onkeyup=function()
	{
		var reg=new RegExp (/^0$|^[1-9](\d{1})?$|^100$/);
		if(reg.test(this.value))
		{
			document.getElementById("point").innerHTML="<span style=\"color:#039\">OK~</span>";
			xx=true;
			isFull();
		}
		else
		{
			document.getElementById("point").innerHTML="Wrong!(0-100)";
			xx=false;
			isFull();
		}
	}
}

function checkMessage(theMessage)
{
	var message=document.getElementById(theMessage)
	message.onkeyup=function()
	{
		if(message.value!=null&&message.value!="")
		{
			yy=true;
			isFull();
		}
		else
		{
			yy=false;
			isFull();
		}
	}
}
function isFull()//判断表单是否者填了
{
	var Ok=document.getElementById("ok")
	if(xx==true&&yy==true)
	{
		Ok.disabled=false;
		Ok.style.color="#033";
	}
	else
	{
		Ok.disabled=true;
		Ok.style.color="#ddd";
	}
}