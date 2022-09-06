<%--
  Created by IntelliJ IDEA.
  User: ADMIN
  Date: 9/4/2022
  Time: 9:42 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css">
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <link rel="stylesheet" href="datatables/css/dataTables.bootstrap4.min.css"/>
    <style>
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
<h1>Facility List</h1>
<a href="/FacilityServlet?action=create">Add new facility</a>
<table class="table table-striped table-bordered text-center" id="facilityTable">
    <thead>
    <tr class="bg-primary">
        <th>STT</th>
        <th>Name</th>
        <th>Area</th>
        <th>Cost</th>
        <th>Max people</th>
        <th>Standard Room</th>
        <th>Convenience</th>
        <th>Pool Area</th>
        <th>Number Of Floors</th>
        <th>Facility Free</th>
        <th>Rent Type</th>
        <th>facility Type</th>
        <th>Edit</th>
        <th>Delete</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach varStatus="status" items="${facilityList}" var="facility">
        <tr>
            <td>${status.count}</td>
            <td>${facility.name}</td>
            <td>${facility.area}</td>
            <td>${facility.cost}</td>
            <td>${facility.maxPeople}</td>
            <td>${facility.standardRoom}</td>
            <td>${facility.convenience}</td>
            <td>${facility.poolArea}</td>
            <td>${facility.numberOfFloors}</td>
            <td>${facility.facilityFree}</td>
            <c:forEach var="rentType" items="${rentTypeList}">
                <c:if test="${rentType.id==facility.rentTypeId}">
                    <td>${rentType.name}</td>
                </c:if>
            </c:forEach>
            <c:forEach var="facilityType" items="${facilityTypeList}">
                <c:if test="${facilityType.id==facility.facilityTypeId}">
                    <td>${facilityType.name}</td>
                </c:if>
            </c:forEach>
            <td style="text-align: center"><a href="/FacilityServlet?action=update&id=${facility.id}">
                <i class="fa-solid fa-file-signature"></i>
            </a>
            </td>
            <td>
                <button onclick="modalDelete('${facility.id}','${facility.name}')" type="button"
                        data-bs-toggle="modal"
                        data-bs-target="#exampleModal">
                    <i class="fa-solid fa-delete-left"></i>
                </button>
            </td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <form action="/FacilityServlet">
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
<script>
    function modalDelete(id, name) {
        document.getElementById("idDelete").value = id;
        document.getElementById("nameDelete").innerHTML = name;
    }
</script>
<a href="/index.jsp">Back to home</a>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#facilityTable').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 5
        });
    });
</script>
<%@include file="/footer.jsp" %>
</body>

</html>
