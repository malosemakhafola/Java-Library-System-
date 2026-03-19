<%-- 
    Document   : books.jsp
    Created on : 06 Nov 2025, 22:58:03
    Author     : malos
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Available Books - Library System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body class="bg-light">
<nav class="navbar navbar-dark bg-primary px-4">
    <span class="navbar-brand mb-0 h1">Available Books</span>
    <div>
        <a href="dashboard.jsp" class="btn btn-light btn-sm me-2">Dashboard</a>
        <a href="LogoutServlet" class="btn btn-outline-light btn-sm">Logout</a>
    </div>
</nav>

<div class="container mt-4">
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${error}</div>
    </c:if>
    
    <c:if test="${empty books}">
        <div class="alert alert-warning text-center">No books found in the library.</div>
    </c:if>
    
    <c:if test="${not empty books}">
        <table class="table table-bordered table-striped shadow-sm">
            <thead class="table-primary">
                <tr>
                    <th>ID</th>
                    <th>Title</th>
                    <th>Author</th>
                    <th>Description</th>
                    <th>Available</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="book" items="${books}">
                    <tr>
                        <td>${book.id}</td>
                        <td>${book.title}</td>
                        <td>${book.author}</td>
                        <td>${book.description}</td>
                        <td>
                            <c:choose>
                                <c:when test="${book.available}">
                                    <span class="badge bg-success">Yes</span>
                                </c:when>
                                <c:otherwise>
                                    <span class="badge bg-danger">No</span>
                                </c:otherwise>
                            </c:choose>
                        </td>
                        <td>
                            <c:choose>
                                <c:when test="${book.available}">
                                    <form action="BorrowServlet" method="post" style="display: inline;">
                                        <input type="hidden" name="book_id" value="${book.id}">
                                        <button type="submit" class="btn btn-success btn-sm">Borrow</button>
                                    </form>
                                </c:when>
                                <c:otherwise>
                                    <button class="btn btn-secondary btn-sm" disabled>Not Available</button>
                                </c:otherwise>
                            </c:choose>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
</div>
<c:if test="${not book.available}">
    <form action="ReturnServlet" method="post" style="display: inline;">
        <input type="hidden" name="book_id" value="${book.id}">
        <button type="submit" class="btn btn-warning btn-sm">Return</button>
    </form>
</c:if>
</body>
</html>


