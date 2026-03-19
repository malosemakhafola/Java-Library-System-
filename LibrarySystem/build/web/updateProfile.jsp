<%-- 
    Document   : updateProfile
    Created on : 09 Nov 2025, 22:48:39
    Author     : malos
--%>

<form action="UpdateProfileServlet" method="post">
    <input type="text" name="full_name" value="${sessionScope.full_name}" required>
    <input type="email" name="email" value="${sessionScope.email}" required>
    <button type="submit">Update Profile</button>
</form>
