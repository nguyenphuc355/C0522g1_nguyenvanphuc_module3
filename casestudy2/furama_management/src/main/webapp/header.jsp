<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/5/2022
  Time: 8:58 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<div class="container-fluid bg-gray-500 d-flex myCSS" style="height: 100px">
  <img class="h-100" src="https://hipress.vn/wp-content/uploads/2021/02/logo1-FURAMA-Resort-DaNang-1.png" alt="">
  <img class="ms-5 ps-5" src="https://furamavietnam.com/wp-content/uploads/2019/02/Ariyana-Tourism-Complex-02-2.png"
       alt="">

  <div class="container-fluid text-end my-4 me-4">
    <span class="badge text-bg-danger mt-3">Nguyễn Văn Phúc</span>
  </div>
</div>
<nav class="navbar navbar-expand-lg">
  <div class="container-fluid mx-5">
    <a class="navbar-brand" href="/">Home</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Employee</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/Employee">Employee list</a></li>
            <li><a class="dropdown-item" href="/Employee?action=create">Add new Employee</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Customer</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/Customer">Customer list</a></li>
            <li><a class="dropdown-item" href="/Customer?action=create">Add new Customer</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Service</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="/FacilityServlet">Facility list</a></li>
            <li><a class="dropdown-item" href="/FacilityServlet?action=create">Add new Facility</a></li>
          </ul>
        </li>

        <li class="nav-item dropdown ms-3">
          <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
             aria-expanded="false">Contract</a>
          <ul class="dropdown-menu">
            <li><a class="dropdown-item" href="#">Contract list</a></li>
            <li><a class="dropdown-item" href="#">Add new Contract</a></li>
          </ul>
        </li>
      </ul>

      <form class="d-flex my-2" role="search">
        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
        <button class="btn btn-outline-success" type="submit">
          <i class="fa-solid fa-magnifying-glass"></i></button>
      </form>
    </div>
  </div>
</nav>
</body>
</html>
