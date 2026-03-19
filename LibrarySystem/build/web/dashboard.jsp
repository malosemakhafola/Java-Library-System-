<%-- 
    Document   : dashboard.jsp
    Created on : 06 Nov 2025, 14:18:36
    Author     : malos
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>Dashboard - Library System</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="styles/main.css">
</head>
<body>
    <nav class="navbar navbar-dark bg-primary px-4">
        <span class="navbar-brand mb-0 h1">Library Dashboard</span>
        <a href="logout.jsp" class="btn btn-light btn-sm">Logout</a>
    </nav>
    <div class="container mt-5 text-center">
        <h2>Welcome, <%= session.getAttribute("full_name") %>!</h2>
        <p class="text-muted">You are successfully logged in.</p>
    </div>
        <div class="text-center mt-4">
    <a href="books.jsp" class="btn btn-primary">View Available Books</a>
</div>

</body>
</html>





