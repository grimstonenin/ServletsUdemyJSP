
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Product Details</title>
</head>
<body>
<jsp:useBean id="product" class="main.java.Product">
    <jsp:setProperty name="product" property="*"/>
</jsp:useBean>

Product Details <br/>
ID <jsp:getProperty name="product" property="id"></jsp:getProperty><br/>
Name <jsp:getProperty name="product" property="name"></jsp:getProperty><br/>
Description <jsp:getProperty name="product" property="description"></jsp:getProperty><br/>
Price <jsp:getProperty name="product" property="price"></jsp:getProperty><br/>
</body>
</html>
