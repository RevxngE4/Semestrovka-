<%@ page import="model.User" %><%--
  Created by IntelliJ IDEA.
  User: Camilo
  Date: 04/12/2023
  Time: 10:45 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%

%>
<!DOCTYPE>
<html>
<head>
    <title>New Product</title>
    <%@include file="includes/head.jsp"%>

</head>
<body>
<%
    User user = (User) request.getSession().getAttribute("auth");
    String userRole = (String) request.getSession().getAttribute("userRole");

%>
<h1 style="text-align: center">Administrator's page</h1>
<%
    if (userRole.equals("admin")) {%>

<div class="container">
<div class="card w-50 mx-auto my-5">
<div class="card=header text-center">Add Product</div>
<div class="card-body">
<form action="/agregarproductosServlet" method="post" enctype="multipart/form-data">
    <div class="form-group">
<label>Name</label>
<input name ="name" class="form-control" type="text" required>
    </div>
    <div class="form-group">
<label>Category</label>
<input name ="category" class="form-control" type="text" required>
    </div>
    <div class="form-group">
<label>Price</label>
<input name ="price" class="form-control" type="number" required>
    </div>
    <div class="form-group">
<label>Image</label>
<input name ="image" class="form-control" type="file"  accept="image/*" required>
    </div>
    <div class="text-center">
<button type="submit" class="btn btn-primary" value="Agregar productos"> Agregar productos</button>
    </div>
</form>
    <p> To Shopping! <a href="index.jsp">Home</a> </p>
</div>
</div>
</div>
</>
<%} else {%>
<p style="text-align: center" >Im sorry, You are not admin</p>
    <p style="text-align: center"> To Shopping! <a href="index.jsp">Home</a> </p>
<%}%>
<%@include file="includes/footer.jsp"%>
</body>
</html>
