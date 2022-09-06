<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<title>Quản lý khách hàng</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
<link rel="stylesheet" href="/datatables/css/dataTables.bootstrap4.min.css"/>
<%--<link rel="stylesheet" href="../../../bootstrap-5.0.2-dist/css/bootstrap.css">--%>
<html>
<head>

    <title>Title</title>
    <style>
        a {
            text-decoration: none;
        }

        a:hover {
            color: red;
        }

        td:hover {
            background-color: #5cee05;
        }

        .myCSS {

            background-color: bisque;

        }

        a {
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        nav {
            background-color: #94e65e;
        }
    </style>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="text-center">
    <h1>Danh sách khách hàng</h1>
</div>
<a href="/"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a>
<c:if test="${mess!=null}">
    <c:if test="${check}">
        <div class="justify-content-center d-flex">
            <div class="alert alert-success alert-dismissible fade show w-50">
                <strong>${mess}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </div>
    </c:if>

    <c:if test="${!check}">
        <div class="justify-content-center d-flex">
            <div class="alert alert-danger alert-dismissible fade show w-50">
                <strong>${mess}</strong>
                <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
            </div>
        </div>
    </c:if>
</c:if>
<nav class="navbar navbar-expand-lg pb-0 mb-0">
    <div class="container-fluid">

        <form class="d-flex my-2" role="search" action="/Customer">
            <input class="form-control me-2" type="text" placeholder="Input search Name" aria-label="Search"
                   name="nameSearch">

            <input class="form-control me-2" type="text" placeholder="Input search address" aria-label="Search"
                   name="addressSearch">


            <input class="form-control me-2" type="text" placeholder="Input search phone" aria-label="Search"
                   name="phoneSearch">

            <button class="btn btn-outline-success" type="submit" name="action" value="search">
                <i class="fa-solid fa-magnifying-glass"></i></button>
        </form>
    </div>
</nav>

<table class="table table-striped table-bordered text-center" id="customerTable">
    <thead>
    <tr class="bg-primary">
        <th><i class="fa-thin fa-alien"></i> Number</th>
        <th>Name</th>
        <th>Birthday</th>
        <th>Gender</th>
        <th>Id card</th>
        <th>Phone number</th>
        <th>Email</th>
        <th>Address</th>
        <th>Customer type</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach varStatus="status" var="customer" items="${customerList}">
        <tr>
            <td>${status.count}</td>
            <td><a href="/Customer?action=view&id=${customer.id}">${customer.name}</a></td>
            <td>${customer.birthday}</td>
            <c:if test="${customer.gender==1}">
                <td>male</td>
            </c:if>
            <c:if test="${customer.gender==0}">
                <td>female</td>
            </c:if>
            <td>${customer.idCard}</td>
            <td>${customer.phone}</td>
            <td>${customer.email}</td>
            <td>${customer.address}</td>
            <c:forEach var="customerType" items="${customerTypeList}">
                <c:if test="${customerType.id==customer.customerTypeId}">
                    <td>${customerType.name}</td>
                </c:if>
            </c:forEach>
            <td style="text-align: center"><a href="/Customer?action=update&id=${customer.id}"><i
                    class="fa-solid fa-file-signature"></i></a>
            </td>
            <td>
                <button onclick="modalDelete('${customer.id}','${customer.getName()}')" type="button"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    <i class="fa-solid fa-delete-left"></i>
                </button>
            </td>

        </tr>
    </c:forEach>
    </tbody>
</table>
<a href="/Customer?action=create">
    <button class="btn btn-warning btn-sm my-2">
        <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Add new Customer
    </button>
</a>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/Customer">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <input hidden name="id" id="idDelete">
                    <input hidden name="action" value="delete">
                    <span>Ban co muon xoa : </span>
                    <span style="color:red" id="nameDelete"></span>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">delete</button>
                </div>
            </div>
        </form>
    </div>
</div>
</div>
<script>
    function modalDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<script src="/jquery/jquery-3.5.1.min.js"></script>
<script src="/datatables/js/jquery.dataTables.min.js"></script>
<script src="/datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#customerTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<%@include file="/footer.jsp" %>
</body>
</html>
