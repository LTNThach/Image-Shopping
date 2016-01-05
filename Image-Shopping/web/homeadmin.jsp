<%-- 
    Document   : homeadmi
    Created on : Jan 5, 2016, 10:25:18 AM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Home Admin</title>
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    <body>
        <jsp:include page="_menu-home-admin.jsp"></jsp:include>
        
        <div class="page-header">
            <h1 align="center" >List Image Reported</h1>
        </div>
        
        <c:if test="${ListReport.size() <= 0}">
            <h3 align="center">No report yet.</h3>
        </c:if>
        
        <c:if test="${ListReport.size() > 0}">
            <c:forEach var="i" begin="0" end="${ListReport.size() - 1}">       
                <c:if test="${((i + 3) mod 3) == 0}">
                    <div class="container">    
                        <div class="row">
                </c:if>

                            <div class="col-sm-4">
                                <div class="panel panel-success">
                                    <div class="panel-heading">${i + 1}. Report - ${ListReport.get(i).getNomPhoto()}</div>

                                    <div class="panel-body">
                                        <img src="Image?IDP=${ListReport.get(i).getIDP()}" class="img-responsive" style="height:205px; width:328px" alt="Image"><br>
                                        <ul>                             
                                            <li>Type report: ${ListReport.get(i).getTypeErreurStr()}</li>
                                        </ul>
                                    </div>

                                    <div class="panel-footer">
                                        <a class="btn btn-default glyphicon glyphicon-ok" href="ManageReport?IDR=${ListReport.get(i).getIDR()}&cas=1"></a>
                                        <a class="btn btn-default glyphicon glyphicon-remove pull-right" href="ManageReport?IDR=${ListReport.get(i).getIDR()}&cas=0"></a>
                                    </div>
                                </div>
                            </div>

                <c:if test="${(i == (Report.size() - 1) && ((i + 1) mod 3) != 0) || ((i + 1) mod 3) == 0}">
                        </div>
                    </div><br>
                </c:if>
            </c:forEach>
        </c:if>
                
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>
