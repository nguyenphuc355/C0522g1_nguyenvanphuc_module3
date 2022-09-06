<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 8/28/2022
  Time: 9:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="/datatables/css/dataTables.bootstrap4.min.css"/>

    <title>Home</title>
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
        body{
            background-image: url("https://img.rawpixel.com/s3fs-private/rawpixel_images/website_content/v978-background-02-kpzgw7o8.jpg?w=800&dpr=1&fit=default&crop=default&q=65&vib=3&con=3&usm=15&bg=F4F4F3&ixlib=js-2.2.1&s=e62663bb68a9df004c04635304ebb5f8");
        }

    </style>
</head>
<body>
<%@include file="/header.jsp" %>
<div class="p-3">
    <h2 class="text-center fw-bold">EMPLOYEE LIST</h2>
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
                    <strong> ${mess}</strong>
                    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
                </div>
            </div>
        </c:if>
    </c:if>
    <a href="/Employee?action=create">
        <button class="btn btn-warning btn-sm my-2">
            <span class="fa-solid fa-person-circle-plus text-light h5 my-auto me-1"></span> Add new Employee
        </button>
    </a>
    <nav class="navbar navbar-expand-lg pb-0 mb-0">
        <div class="container-fluid">

            <form class="d-flex my-2" role="search" action="/Employee">
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

    <table class="table table-striped table-bordered text-center " id="employeeTable">
        <thead>
        <tr class="bg-primary text-center">
            <th><i class="fa-solid fa-dog"></i>Number</th>
            <th>Name</th>
            <%--            <th>Date of Birth</th>--%>
            <%--            <th>Id card</th>--%>
            <%--            <th>Salary</th>--%>
            <th>Phone number</th>
            <th>Email</th>
            <th>Address</th>
            <th>Position</th>
            <th>Education degree name</th>
            <th>Division</th>
            <th>Update</th>
            <th>Delete</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach varStatus="status" var="employee" items="${employeeList}">
            <tr>
                <td class="text-center">${status.count}</td>
                <td class="text-center"><a href="/Employee?action=view&id=${employee.id}">${employee.name}</a></td>
                    <%--<td class="text-center" hidden>${employee.birthday}</td>
                    <td class="text-center" hidden>${employee.idCard}</td>
                    <td class="text-center" hidden>${employee.salary}</td>--%>
                <td class="text-center">${employee.phone}</td>
                <td class="text-center">${employee.email}</td>
                <td class="text-center">${employee.address}</td>
                <td class="text-center">
                    <c:forEach items="${positionList}" var="position">
                        <c:if test="${position.id == employee.positionId}">
                            ${position.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td class="text-center">
                    <c:forEach var="educationDegree" items="${educationDegreeList}">
                        <c:if test="${educationDegree.id==employee.educationDegreeId}">
                            ${educationDegree.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td class="text-center">
                    <c:forEach var="division" items="${divisionList}">
                        <c:if test="${division.id==employee.divisionId}">
                            ${division.name}
                        </c:if>
                    </c:forEach>
                </td>
                <td style="text-align: center">
                    <a href="/Employee?action=update&id=${employee.id}">
                        <i class="fa-solid fa-file-signature"></i>
                    </a>
                </td>

                <td>
                    <button onclick="modalDelete('${employee.id}','${employee.getName()}')" type="button"
                            data-bs-toggle="modal"
                            data-bs-target="#exampleModal">
                        <i class="fa-solid fa-delete-left"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="/index.jsp"><i class="fa-solid fa-house-chimney h5 mx-1"></i> Back to HOME</a>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/Employee">
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
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>


    $(document).ready(function () {
        $('#employeeTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });

    function modalDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>


<%@include file="/footer.jsp" %>
</body>
</html>
