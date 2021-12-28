<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.HashMap" %><%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：EL_expression
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2021/12/28
  Time(创建时间)： 14:49
  Description(描述)：
   EL 表达式语法如下：
${EL表达式}
EL 表达式语法以${开头，以}结束，中间为合法的表达式。
示例
${param.name} 表示获取参数 name 的值，它等同于 <%=request.getParameter('name') %>。从形式和语法上可以看出，
EL 表达式简化了 JSP 原有的表达式。在实际开发中，EL 表达式也是经常使用的方式。
EL 表达式定义了许多运算符，如算术运算符、比较运算符、逻辑运算符等，使用这些运算符，可以使 JSP 页面更加简洁。
EL算术运算符
EL算术运算符	说明	范例	结果
+	加	${5+2}	7
-	减	${5-2}	3
*	乘	${5*2}	10
/ 或 div	除	${5/2}	2
% 或 mod	求余	${5%2}	1

EL比较运算符
EL比较运算符	说明	范例	结果
== 或 eq	等于	${6==6} 或 ${6 eq 6}
${"A"="a"} 或 ${"A" eq "a"}	true
false
!= 或 ne	不等于	${6!=6} 或 ${6 ne 6}
${“A"!=“a”} 或 ${“A” ne “a”}	false
true
< 或 lt	小于	${3<8} 或 ${3 lt 8}
${"A"<"a"} 或 ${"A" lt "a"}	true
true
> 或 gt	大于	${3>8} 或 ${3 gt 8}
${"A">"a"} 或 ${"A" gt "a"}	false
false
<= 或 le	小于等于	${3<=8} 或 ${3 le 8}
${"A"<="a"} 或 ${"A" le "a"}	true
true
>= 或 ge	大于等于	${3>=8} 或 ${3 ge 8}
${"A">="a"} 或 ${"A" ge "a"}	false
false

EL逻辑运算符
EL逻辑运算符	说明	范例	结果
&& 或 and	与	${2>1&&3<4 } 或 ${2>1and3<4 }	true
|| 或 or	或	${2<1||3>4} 或 ${2<1or3>4}	false
! 或 not	非	${!(2>4)} 或 ${not (2>4)}	true

EL其它运算符
1）. 和 [ ]
.和[ ]是 EL 中最常用的运算符，用来访问 JavaBean 中的属性和隐式对象的数据。一般情况下，.用来访问 JavaBean 属性或 Map 类型的值，
[ ]用来访问数组或者列表的元素。
2）empty
empty 用来判断 EL 表达式中的对象或者变量是否为空。若为空或者 null，返回 true，否则返回 false。
3）条件运算符
EL 表达式中，条件运算符的语法和 Java 的完全一致，如下：
${条件表达式?表达式1:表达式2}
其中，条件表达式用于指定一个判定条件，该表达式的结果为boolean类型。如果该表达式的运算结果为true，则返回表达式1的值；反之，返回表达式 2 的值。

EL运算符优先级
序号	优先级
1	[] .
2	()
3	-（负）、not、! 、empty
4	* 、 / 、 div 、% 、mod
5	+、-（减）
6	<、>、<=、>=、lt、gt、le、ge
7	==、!-、eq、ne
8	&&、and
9	||、or
10	${A?B:C}

内置对象	说明
pageScope	获取 page 范围的变量
requestScope	获取 request 范围的变量
sessionScope	获取 session 范围的变量
applicationScope	获取 application 范围的变量
param	相当于 request.getParameter(String name)，获取单个参数的值
paramValues	相当于 request.getParameterValues(String name)，获取参数集合中的变量值
header	相当于 request.getHeader(String name)，获取 HTTP 请求头信息
headerValues	相当于 request.getHeaders(String name)，获取 HTTP 请求头数组信息
initParam	相当于 application.getInitParameter(String name)，获取 web.xml 文件中的参数值
cookie	相当于 request.getCookies()，获取 cookie 中的值
pageContext	表示当前 JSP 页面的 pageContext 对象
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
\${1+2}:${1+2}<br/>
\${9-8}:${9-8}<br>
\${5*9}:${5*9}<br/>
\${564/8}:${564/8}<br>
\${568%6}:${568%6}<br>
\${6==6}:${6==6}<br/>
\${6!=6}:${6!=6}<br/>
\${3<8}:${3<8}<br/>
\${3>8}:${3>8}<br/>
\${3<=8}:${3<=8}<br/>
\${"A"<="a"}：${"A"<="a"}<br/>
\${3>=8}:${3>=8}<br>
\${2>1&&3<4}:${2>1&&3<4}<br/>
\${2<1||3>4}:${2<1||3>4}<br/>
\${!(2>4)}:${!(2>4)}<br/>
<br>
<%
    List<String> list = new ArrayList<>();
    list.add("123");
    list.add("456");
    session.setAttribute("list", list);
    HashMap<String, String> map = new HashMap<>();
    map.put("h", "hello");
    map.put("w", "world");
    session.setAttribute("map", map);
%>
list中的内容：${list[0]}，${list[1]}
<br> map 中的内容：${map.h}，${map.w}
<br/>

<%
    request.setAttribute("info", "request属性范围");
    session.setAttribute("info", "session属性范围");
    application.setAttribute("info", "application属性范围");
%>
<hr/>
不指定范围：${info}
<br> request 属性内容：${requestScope.info}
<br>session 属性内容：${sessionScope.info}
<br>application 属性内容：${applicationScope.info}

<br/>
<br/>
<%
    response.addCookie(new Cookie("name", "hello"));
%>
<a href="hello2.jsp">跳转到hello2.jsp页面</a>
</body>
</html>
