<%-- 
    Document   : hotuser
    Created on : Dec 20, 2015, 10:11:29 PM
    Author     : Thach
--%>


<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <title>Hot User</title>     
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    
    <body>
        <c:if test="${loginedUser != null}">
            <jsp:include page="_menu-hotuser-logined.jsp"></jsp:include>
            <jsp:include page="_modal-logined.jsp"></jsp:include>
        </c:if>
        <c:if test="${loginedUser == null}">
            <jsp:include page="_menu-hotuser-unlogined.jsp"></jsp:include>
            <jsp:include page="_modal-unlogined.jsp"></jsp:include>
        </c:if>
            
        <div class="page-header">
            <h1 align="center" style="color:#777777">Hot User</h1>
        </div>
                    
        <c:forEach var="i" begin="0" end="${ListUtilisateur.size() - 1}">       
            <c:if test="${((i + 3) mod 3) == 0}">
                <div class="container">    
                    <div class="row">
            </c:if>
                            
            <div class="col-sm-4">
                <div class="panel panel-success">
                    <a href="ViewUser?IDU=${ListUtilisateur.get(i).getIDU()}"><div class="panel-heading">${i + 1}. ${ListUtilisateur.get(i).getNomUtilisateur()}</div></a>
                    <div class="panel-body"><p>Sold Images: ${ListUtilisateur.get(i).getNombreVendu()}</div>
                </div>
            </div>
                
            <c:if test="${(i == (ListUtilisateur.size() - 1) && ((i + 1) mod 3) != 0) || ((i + 1) mod 3) == 0}">
                    </div>
                </div><br>
            </c:if>
        </c:forEach>
 
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>