
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Addition of two numbers</title>
</head>
<body>
<%
    int num1 = Integer.parseInt(request.getParameter("number1"));
    int num2 = Integer.parseInt(request.getParameter("number2"));
%>

<p>Sum of <%=num1%> and <%=num2%> is <%= num1 + num2 %></p>

</body>
</html>
