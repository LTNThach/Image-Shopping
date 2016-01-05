<%-- 
    Document   : viewuser
    Created on : Dec 20, 2015, 10:09:57 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>User: ${user.getNomUtilisateur()}</title>
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    <body>
        <c:if test="${loginedUser != null}">
            <jsp:include page="_menu-logined.jsp"></jsp:include>
            <jsp:include page="_modal-logined.jsp"></jsp:include>
        </c:if>
        <c:if test="${loginedUser == null}">
            <jsp:include page="_menu-unlogined.jsp"></jsp:include>
            <jsp:include page="_modal-unlogined.jsp"></jsp:include>
        </c:if>

        <div class="container">
            <div class="row">
                <h1 style="color:#777777"> ${user.getNomUtilisateur()} </h1>
                <div class="col-lg-4 col-lg-offset-1">
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
            </div>
        </div>
                    
        <br>
        
        <h1 align="center" style="color:#777777">Album</h1>
        
        <c:if test="${ListAlbum.size() <= 0}">
            <h3 align="center">No album yet.</h3>
        </c:if>
        <c:if test="${ListAlbum.size() > 0}">
            <c:forEach var="i" begin="0" end="${ListAlbum.size() - 1}">       
                <c:if test="${((i + 3) mod 3) == 0}">
                    <div class="container">    
                        <div class="row">
                </c:if>

                <div class="col-sm-4">
                    <div class="panel panel-success">
                        <a href="ViewAlbum?IDA=${ListAlbum.get(i).getIDA()}&NomAlbum=${ListAlbum.get(i).getNomAlbum()}&IDU=${ListAlbum.get(i).getIDU()}"><div class="panel-heading">${i + 1}. ${ListAlbum.get(i).getNomAlbum()}</div></a>
                    </div>
                </div>

                <c:if test="${(i == (ListUtilisateur.size() - 1) && ((i + 1) mod 3) != 0) || ((i + 1) mod 3) == 0}">
                        </div>
                    </div><br>
                </c:if>
            </c:forEach>
        </c:if>
    </body>
</html>