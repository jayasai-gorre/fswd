<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <title>Employees</title>
</head>
<body>
	
	
    <div class="container mt-5">
    	<div class="alert alert-primary text-center" role="alert">
        	<h2>EMPLOYEE MANAGEMENT</h2>
    	</div>
        <h2>Employee List</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                	<th>Emp ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Role</th>
                    <th>Salary</th>
                    <th>Department</th> <!-- Added Department ID -->
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
			<c:if test="${empty employees}">
    		<tr>
       		 <td colspan="4">No employees found.</td>
    		</tr>
			</c:if>
			<c:forEach var="employee" items="${employees}">
    			<tr>
    			<td>${employee.id}</td>
        		<td>${employee.name}</td>
        		<td>${employee.email}</td>
        		<td>${employee.phone}</td>
        		<td>${employee.role}</td>
        		<td>${employee.salary}</td>
        		<td>${employee.departmentName}</td>
        		<td>
            		<a href="${pageContext.request.contextPath}/edit-employee?id=${employee.id}" class="btn btn-warning">Edit</a>
        			<a href="DeleteEmployee?id=${employee.id}" class="btn btn-danger">Delete</a>
       			</td>
        		
    	</tr>
</c:forEach>
</tbody>

        </table>
        <a href="${pageContext.request.contextPath}/departments" class="btn btn-primary">Add Employee</a>
    </div>
</body>
</html>
