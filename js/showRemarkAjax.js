  function creatObject() //����һ��XmlHttp����
  {
	  try 
	  {
  		xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
	  } 
	catch (e) {
  			try 
			{
    			xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
  			} 
			catch (e2) 
			{
    			xmlHttp = false;
  			}
		}
	if (!xmlHttp && typeof XMLHttpRequest != 'undefined') 
	{
		xmlHttp = new XMLHttpRequest();
	}

  }
  
  function showAll()  //�ҵ���������,������ʾ������������,Ϊ�������ú���
  {
	  if(document.getElementsByName("forAjax").length != 0)
	  {
		var theButton=document.getElementsByName("forAjax");
		for(var i=0; i<2;i++)
		{
		theButton.item(i).style.color="#617A1A";
		theButton.item(i).onmouseover=function(){this.className="hoverIE6"};
		theButton.item(i).onmouseout=function(){this.className="outIE6"}//��һ����Ϊ����IE6��û�����ӵ�A����꾭��ʱ���ܸı���ʽ���ֲ�
		theButton.item(i).onclick=function (){mainAjax()};
		}
	  }
	  else
	  {
		  return
	  }
  		
  }
  
  function mainAjax()		//�����ϵĺ��� , Ϊ��Ҫ��Ajax����.
  {
	 if(showall=="false")
	  {
		  showall="true"
		}
		else
		{
			showall="false"
		}
	  var theID=document.getElementById("theID").value
	  var thePage=document.getElementById("thePage").value
	  var url=thePage + "-remark-for-ajax.asp?id="+ theID +"&showall="+ showall
	  xmlHttp.open("GET", url, true);
	  xmlHttp.onreadystatechange=getData;
	  xmlHttp.send(null);
	  setTimeout(showAll,1000); //����������Ƕ��ں����ĳ�ʹ��. ���û����,���ڶ���,�������Ժ�ĵ��û�з�Ӧ.
  }
  
  function getData() //�����ݲ��뵽ҳ����
  {
	  if (xmlHttp.readyState==4)
  		{
			var theData=xmlHttp.responseText;
			document.getElementById("remark").innerHTML=theData;
		}
  }
