<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style type="text/css">
<!--
body,div,ul,li,p,h1,h2{ margin:0; padding:0; border:0; background:#FAFAFA; font-family:Arial, Helvetica, sans-serif,"宋体"}
body{ text-align:center; font-size:12px}
li{ list-style:none}
.rolinList{ width:402px; height:auto; margin:20px auto 0 auto; text-align:left}
.rolinList li{margin-bottom:1px;border:1px solid #DADADA}
.rolinList li h2{ width:380px; height:40px;  background:#fff; font-size:14px; line-height:40px; padding-left:20px; color:#333; cursor:pointer}
.content{ height:150px;width:400px;  background:#fff;  background:#FAFAFA}
.content p{ margin:12px}
-->
</style>
<script type="text/javascript">
//<![CDATA[
window.onload = function() {
rolinTab("rolin")
}
function rolinTab(obj) {
var list = $(obj).getElementsByTagName("LI");
var state = {show:false,hidden:false,showObj:false};
for (var i=0; i<list.length; i++) {
var tmp = new rolinItem(list[i],state);
if (i == 0) tmp.pShow();
}
}
function rolinItem(obj,state) {
var speed = 0.0666;
var range = 1;
var interval;
var tarH;
var tar = this;
var head = getFirstChild(obj);
var content = getNextChild(head);
var isOpen = false;
this.pHidden = function() {
if (isOpen) hidden();
}
this.pShow = show;
var baseH = content.offsetHeight;
content.style.display = "none";
var isOpen = false;
head.onmouseover = function() {
this.style.background = "#EFEFEF";
}
head.onmouseout = mouseout;
head.onclick = function() {
this.style.background = "#EFEFEF";
if (!state.show && !state.hidden) {
if (!isOpen) {
head.onmouseout = null;
show();
} else {
hidden();
}
}
}
function mouseout() {
this.style.background = "#FFF"
}
function show() {
head.style.borderBottom = "1px solid #DADADA";
state.show = true;
if (state.openObj && state.openObj != tar ) {
state.openObj.pHidden();
}
content.style.height = "0px";
content.style.display = "block";
content.style.overflow = "hidden";
state.openObj = tar;
tarH = baseH;
interval = setInterval(move,10);
}
function showS() {
isOpen = true;
state.show = false;
}
function hidden() {
state.hidden = true;
tarH = 0;
interval = setInterval(move,10);
}
function hiddenS() {
head.style.borderBottom = "none";
head.onmouseout = mouseout;
head.onmouseout();
content.style.display = "none";
isOpen = false;
state.hidden = false;
}
function move() {
var dist = (tarH - content.style.height.pxToNum())*speed;
if (Math.abs(dist) < 1) dist = dist > 0 ? 1: -1;
content.style.height = (content.style.height.pxToNum() + dist) + "px";
if (Math.abs(content.style.height.pxToNum() - tarH) <= range ) {
clearInterval(interval);
content.style.height = tarH + "px";
if (tarH != 0) {
showS()
} else {
hiddenS();
}
}
}
}
var $ = function($) {return document.getElementById($)};
String.prototype.pxToNum = function() {return Number(this.replace("px",""))}
function getFirstChild(obj) {
var result = obj.firstChild;
while (!result.tagName) {
result = result.nextSibling;
}
return result;
}
function getNextChild(obj) {
var result = obj.nextSibling;
while (!result.tagName) {
result = result.nextSibling;
}
return result;
}
//]]>
</script>
<body>
<ul class="rolinList" id="rolin">
<li>
<h2>花郎徒结</h2>
<div class="content"><p>当时明月在,曾照彩云归<br /><br />
倦了红颜，憔悴为千年，几多情深夜语，一点听风悠然。<br />
村忆梦回，飘逸如烟，友别怜影单。<br />
而今沙漠风闲，雪原清冷，东海云淡，石谷谁惜缘。<br />
累了心间，问也还烦，都道风沙淘尽，何日再慰别缘！ </p></div>
</li>
<li>
<h2>帝王槌</h2>
<div class="content"><p>立剑赏月意惆怅,袖饰刀,衣披霜,傲视雾丸,徒手战扶桑.<br />
问津终寻帝王陵,黑影没,尸满岗,惟见逆鲮露寒光.　 <br />
须发苍,气轩昂,三尺银狼,破风动八方.　 <br />
依身紧握噬魂枪,饮虎血,豪万丈.惟有千年我故乡!</p></div>
</li>
<li>
<h2>玉女枪法</h2>
<div class="content"><p>曾经有个梦想：驰骋江湖，快意恩仇。<br />
曾经有份愿望：千里追凶，十步溅血。<br />
曾经有腔豪情：奇功盖世，名冠武林。<br />
曾经有种期盼：烛影摇红，衣袖添香。</p></div>
</li>
<li>
<h2>黑沙刚体</h2>
<div class="content"><p>赵客缦胡缨，吴钩霜雪明。银鞍照白马，飒沓如流星。 <br />
十步杀一人，千里不留行。事了拂衣去，深藏身与名。 <br />
闲过信陵饮，脱剑膝前横。将炙啖朱亥，持觞劝侯嬴。 <br />
三杯吐然诺，五岳倒为轻。眼花耳热后，意气素霓生。 <br />
救赵挥金锤，邯郸先震惊。千秋二壮士，烜赫大梁城。 <br />
纵死侠骨香，不惭世上英。谁能书阁下，白首太玄经。</p>
</div>
</li>
<li>
<h2>不羁浪人枪</h2>
<div class="content"><p>素手相牵，斜辉入眼帘，一轮逍遥自在间，醉了山水闲。<br />
沙漠绿水涟，鱼游浅底，明眸一水天。<br />
爱在村友相谈，开心点点，笑语连连，率性夜无眠。<br />
月在西边，风乱星寒，辗转醇香旧事，蛾儿曼舞灯前。</p></div>
</li>
<li>
<h2>雾水掌</h2>
<div class="content"><p>蹄影善奔,如幻如魔,其皮传世,绝学再现,<br />
又有谁在这残阳道中追逐它的身影... </p>
</div>
</li>
</ul>
</body>
</html>