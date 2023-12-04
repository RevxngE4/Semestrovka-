<%--
  Created by IntelliJ IDEA.
  User: Camilo
  Date: 04/12/2023
  Time: 09:21 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Signup</title>
    <%@include file="includes/head.jsp"%>
</head>
<body>
<%@include file="includes/navbar.jsp"%>

    <div class="container">
        <div class="card w-50 mx-auto my-5">
            <div class="card=header text-center">Signup</div>
            <div class="card-body">
            <form action="/signup" method="post">
                <div class="form-group">
                    <label>Name</label>
                    <input name ="name" class="form-control" type="text" placeholder="Enter Your Name" required>
                </div>
                <div class="form-group">
                    <label>Email Address</label>
                    <input name="email" class="form-control" type="text" placeholder="Enter Your Email" required>
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input name="password" class="form-control" type="password" placeholder="Enter Your Password" required>
                </div>
                <div class="text-center">
                <button type="submit" class="btn btn-primary"> Signup </button>
                </div>
            </form>
            <p>you already have an account?<a href="login.jsp">Login</a> </p>
        </div>
        </div>
    </div>

<%@include file="includes/footer.jsp"%>
</body>
</html>
