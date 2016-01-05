<%-- 
    Document   : changepass
    Created on : Dec 17, 2015, 10:53:05 PM
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
            <h1 align = "center">User: ${user.getNomUtilisateur()} - Change password</h1>
        </div>
        
        <!--Notification-->
        <div class="container">
            <div class="col-lg-4 col-lg-offset-3">
                <form action="ChangePass" method="post" role="form">
                    <div class="form-group">
                        <label for="password1"  style="color:#777777"> New Password: </label>
                        <input type="password" class="form-control" id="password1" name="password" required="required" placeholder="Enter your new password" style="width:180%">
                        <br>
                        <label for="password2" style="color:#777777"> Rewrite Password: </label>
                        <input type="password" class="form-control" id="password2" name="repassword" required="required" placeholder="Rewrite your password" style="width:180%">
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
