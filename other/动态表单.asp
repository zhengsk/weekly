<%@LANGUAGE="JAVASCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<TITLE>动态表单</TITLE>
<SCRIPT LANGUAGE="JavaScript">
cities = new Object();
cities['作物科学学院']=new Array('农学', '农村区域发展');
cities['植物保护学院']=new Array('植物保护', '制药工程', '生物安全');
cities['园艺学院']=new Array('园艺', '茶学', '设施农业科学与工程');
cities['林学院']=new Array('林学', '资源环境与城乡规划管理', '森林资源保护与游憩', '水土保持与荒漠化防治', '生态学', '统计学');
cities['生命科学学院']=new Array('生物科学 生物学基地班', '生物科学类', '生物信息学', '生物工程');
cities['动物科学学院']=new Array('动物科学', '动物医学', '水产养殖学');
cities['蜂学学院']=new Array('蜂学');
cities['资源与环境学院']=new Array('农业资源与环境', '环境工程', '土地资源管理');
cities['食品科学学院']=new Array('食品科学与工程', '食品质量与安全');
cities['材料工程学院']=new Array('木材科学与工程', '材料科学与工程', '化学工程与工艺', '轻化工程');
cities['计算机与信息学院']=new Array('计算机科学与技术', '软件工程', '电子信息工程','信息与计算科学', '数学与应用数学');
cities['机电工程学院']=new Array('机械类', '电气信息类', '工业工程');
cities['交通学院']=new Array('森林工程  路桥方向', '土木工程', '交通工程', '交通运输', '城市规划', '工程管理', '物流管理');
cities['经济与管理学院、旅游学院（合署）']=new Array('金融学', '国际经济与贸易', '会计学', '工商管理', '行政管理', '农林经济管理', '旅游管理');
cities['人文社会科学学院']=new Array('人力资源管理', '法学', '英语', '公共管理类', '公共管理类  民族班', '预科班');
cities['艺术学院、园林学院（合署）']=new Array('园林', '园林  风景园林方向', '艺术设计', '广告学');
cities['海外学院']=new Array('园艺  中加合作班', '农业资源与环境  中加合作班');
cities['成人教育学院、远程教育学院（合署）']=new Array('还未添加');
cities['金山学院']=new Array('还未添加');
cities['东方学院']=new Array('还未添加');
cities['软件高职人才培养基地']=new Array('软件技术', '软件技术  计算机游戏', '软件技术  计算机办公应用', '计算机网络技术', '图形图像制作  数字媒体制作');
function set_city(province, city)
{
    var pv, cv;
    var i, ii;
    pv=province.value;
    cv=city.value;
    city.length=1;
if(pv=='0') return;
if(typeof(cities[pv])=='undefined') return;
    for(i=0; i<cities[pv].length; i++)
    {
       ii = i+1;
       city.options[ii] = new Option();
       city.options[ii].text = cities[pv][i];
       city.options[ii].value = cities[pv][i];
    }
}
</SCRIPT>
</HEAD>
<BODY>
   <form name="form1" action="" method="get">
             <select   name="province" onChange="set_city(this, this.form.city);">
				<option value="作物科学学院">作物科学学院</option>
                <option value="植物保护学院">植物保护学院</option>
                <option value="园艺学院">园艺学院</option>
                <option value="林学院">林学院</option>
                <option value="生命科学学院">生命科学学院</option>
                <option value="动物科学学院">动物科学学院</option>
                <option value="蜂学学院">蜂学学院</option>
                <option value="资源与环境学院">资源与环境学院</option>
                <option value="食品科学学院">食品科学学院</option>
                <option value="材料工程学院">材料工程学院</option>
                <option value="计算机与信息学院">计算机与信息学院</option>
                <option value="机电工程学院">机电工程学院</option>
                <option value="交通学院">交通学院</option>
                <option value="经济与管理学院、旅游学院（合署）">经济与管理学院、旅游学院（合署）</option>
                <option value="人文社会科学学院">人文社会科学学院</option>
                <option value="艺术学院、园林学院（合署）">艺术学院、园林学院（合署）</option>
                <option value="海外学院">海外学院</option>
                <option value="成人教育学院、远程教育学院（合署）">成人教育学院、远程教育学院（合署）</option>
                <option value="金山学院">金山学院</option>
                <option value="东方学院">东方学院</option>
                <option value="软件高职人才培养基地">软件高职人才培养基地</option>            
            </select>
             <select   name="city" id="citys" >
                 <option value="0">--专业--</option>
             </select>
   </form>
</BODY>
</HTML> 