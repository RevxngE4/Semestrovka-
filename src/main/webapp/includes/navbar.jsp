<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <div class="container">
    <a class="navbar-brand" href="index.jsp">Apple Shop 🍎</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav ml-auto">
        <li class="nav-item active">
          <a class="nav-link" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="cart.jsp">Cart</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="orders.jsp">Orders</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="signup.jsp">Signup</a>
        </li>
          <li class="nav-item">
            <a class="nav-link" href="adminadd.jsp">Agregar productos</a>
          </li>
        <li class="nav-item">
          <a class="nav-link" href="log-out">Logout</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="login.jsp">Login</a>
        </li>

      </ul>
    </div>
  </div>
</nav>