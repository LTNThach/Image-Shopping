<%-- 
    Document   : validate
    Created on : Dec 18, 2015, 10:28:36 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Validate</title>
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="_menu-general.jsp"></jsp:include>
        
        <div class="page-header">
            <h1 align = "center">Validate</h1>
        </div>
        
        <!--Notification-->
        <div class="container">
            <div class="col-lg-4 col-lg-offset-3">
                <form role="form" action="Validate" method="post">
                    <div class="form-group">
                        <label for="password1" style="color:#777777"> Password in your email:</label>
                        <input type="password" class="form-control" id="password1" name="password" required="required" placeholder="Enter password in your email" style="width:180%">
                    </div>
                    <button type="submit" class="btn btn-info">Enter</button>
                </form>
            </div>
        </div>
        <br>
        <br>
        <!--________________________-->
        
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>