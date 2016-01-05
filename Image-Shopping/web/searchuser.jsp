<%-- 
    Document   : searchuser
    Created on : Jan 5, 2016, 10:45:09 AM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Search User</title>
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="_menu-admin.jsp"></jsp:include>
        
        <div class="page-header">
            <h1 align="center" >User</h1>
        </div>
        
        <c:if test="${user == null}">
            <h3 align="center">No user found.</h3>
        </c:if>
        <c:if test="${user != null}">
            <div class="container">
                <div class="col-lg-4 col-lg-offset-4">
                    <div class="panel panel-success">
                        <div class="panel-heading">${user.getNomUtilisateur()}</div>
                        
                        <div class="panel-body">
                            <ul>
                                <li style="color:#777777"> First Name: ${user.getPreNom()} </li>
                                <li style="color:#777777"> Last Name: ${user.getNom()} </li>
                                <li style="color:#777777"> Telephone: ${user.getNumeroTelephone()} </li>
                                <li style="color:#777777"> Address: ${user.getAdresse()} </li>
                                <li style="color:#777777"> Email: <a href="mailto:${user.getEmail()}"> ${user.getEmail()} </a></li>
                                <li style="color:#777777"> Sold Image: ${user.getNombreVendu()} </li>
                                <li style="color:#777777"> Report: ${user.getNombreRapport()} </li>
                            </ul>
                        </div>
                            
                        <div class="panel-footer" style="height:55px">
                            <c:if test="${user.getEtatActiver() == 0}">
                                <a class="btn btn-default glyphicon glyphicon-ok" href="ChangeStatusUser?IDU=${user.getIDU()}&status=1"></a>
                            </c:if>
                            <c:if test="${user.getEtatActiver() != 0}">
                                <a class="btn btn-default glyphicon glyphicon-remove pull-right" href="ChangeStatusUser?IDU=${user.getIDU()}&status=0"></a>
                            </c:if>
                        </div>
                    </div>
                </div>
          </div>
        </c:if>
            
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>