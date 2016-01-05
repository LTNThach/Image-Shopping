<%-- 
    Document   : congratulation
    Created on : Jan 4, 2016, 1:07:29 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Congratulation</title>
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="_menu-general.jsp"></jsp:include>
        
        <div class="page-header">
            <h1 align="center" >Congratulation</h1>
        </div>
        
        <h1 align="center" style="color:#777777">${message}</h1>
        
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>