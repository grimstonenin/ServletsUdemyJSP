
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Result</title>
</head>
<body>

<%
        int result = (Integer)request.getAttribute("result");
        out.println("<b> The average is: " + result + " !</b>");
%>

</body>
</html>
