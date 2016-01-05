<%-- 
    Document   : home
    Created on : Dec 29, 2015, 6:22:16 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>    
        <title>Home</title>     
        <jsp:include page="_header.jsp"></jsp:include>
    </head>
    
    <body>
        <c:if test="${loginedUser != null}">
            <jsp:include page="_menu-home-logined.jsp"></jsp:include>
            <jsp:include page="_modal-logined.jsp"></jsp:include>
        </c:if>
        <c:if test="${loginedUser == null}">
            <jsp:include page="_menu-home-unlogined.jsp"></jsp:include>
            <jsp:include page="_modal-unlogined.jsp"></jsp:include>
        </c:if>
        
        <div class="page-header">
            <h1 align="center" >Home</h1>
        </div>
            
        <!-- Image-->
        <h1 align="center" style="color:#777777"><a href="HotImage">Hot Image</a></h1>
        
        <c:forEach var="i" begin="0" end="${ListPhoto.size() - 1}">
            <c:if test="${((i + 3) mod 3) == 0}">
                <div class="container">    
                    <div class="row">
            </c:if>
                            
            <c:if test="${loginedUser != null}">
                <div class="col-sm-4">
                    <div class="panel panel-success">
                        <a href="ViewImage?IDP=${ListPhoto.get(i).getIDP()}"><div class="panel-heading">${i + 1}. ${ListPhoto.get(i).getNomPhoto()}</div></a>

                        <div class="panel-body">
                            <a href="ViewImage?IDP=${ListPhoto.get(i).getIDP()}"><img src="Image?IDP=${ListPhoto.get(i).getIDP()}" class="img-responsive" style="height:205px; width:328px" alt="Image"></a><br>
                            <ul>                                   
                                <li>Like: ${ListPhoto.get(i).getNombreAimer()}</li>
                                <li>Sold: ${ListPhoto.get(i).getNombreAchat()}</li>
                                <li>Cost: ${ListPhoto.get(i).getPrix()}</li>
                            </ul>
                        </div>
                            
                        <c:if test="${loginedUser.getIDU() != ListPhoto.get(i).getIDU()}">
                            <c:if test="${ListPhoto.get(i).getSupprime() == 0}">
                                <div class="panel-footer">
                                    <c:if test="${ListLike != null}">
                                        <c:if test="${ListLike.contains(ListPhoto.get(i)) == true}">
                                            <a class="btn btn-default glyphicon glyphicon-heart"></a>
                                        </c:if>

                                        <c:if test="${ListLike.contains(ListPhoto.get(i)) == false}">
                                            <a href="Like?IDP=${ListPhoto.get(i).getIDP()}" class="btn btn-default glyphicon glyphicon-heart-empty"></a>
                                        </c:if>
                                    </c:if>

                                    <c:if test="${ListLike == null}">
                                        <a href="Like?IDP=${ListPhoto.get(i).getIDP()}" class="btn btn-default glyphicon glyphicon-heart-empty"></a>
                                    </c:if>

                                    <a class="btn btn-default glyphicon glyphicon-remove-circle" href="#ReportModal${ListPhoto.get(i).getIDP()}" data-toggle="modal"></a>

                                    <c:if test="${ListBuy != null}">
                                        <c:if test="${ListBuy.contains(ListPhoto.get(i)) == true}">
                                            <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                        </c:if>

                                        <c:if test="${ListBuy.contains(ListPhoto.get(i)) == false}">
                                            <c:if test="${ListInCart != null}">
                                                <c:if test="${ListInCart.contains(ListPhoto.get(i)) == false}">
                                                    <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                                </c:if>
                                                <c:if test="${ListInCart.contains(ListPhoto.get(i)) == true}">
                                                    <a class="btn btn-default glyphicon glyphicon-shopping-cart pull-right" href="#CartModal" data-toggle="modal"></a>
                                                </c:if>
                                            </c:if>                                          
                                            <c:if test="${ListInCart == null}">   
                                                <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                            </c:if>
                                        </c:if>       
                                    </c:if>

                                    <c:if test="${ListBuy == null}">
                                        <c:if test="${ListInCart != null}">
                                            <c:if test="${ListInCart.contains(ListPhoto.get(i)) == false}">
                                                <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                            </c:if>
                                            <c:if test="${ListInCart.contains(ListPhoto.get(i)) == true}">
                                                <a class="btn btn-default glyphicon glyphicon-shopping-cart pull-right" href="#CartModal" data-toggle="modal"></a>
                                            </c:if>
                                        </c:if>       
                                        <c:if test="${ListInCart == null}">   
                                            <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                        </c:if>
                                    </c:if>                            
                                </div>
                            </c:if>
                        </c:if>
                        <c:if test="${loginedUser.getIDU() == ListPhoto.get(i).getIDU()}">
                            <c:if test="${ListPhoto.get(i).getSupprime() == 0}">
                                <div class="panel-footer">
                                    <a class="btn btn-default glyphicon glyphicon-cog" href="#EditModal${ListPhoto.get(i).getIDP()}"data-toggle="modal"></a>
                                    <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                    <a class="btn btn-default glyphicon glyphicon-trash pull-right" href="DeletePhoto?IDP=${ListPhoto.get(i).getIDP()}"></a>                                    
                                </div>
                            </c:if>
                            <c:if test="${ListPhoto.get(i).getSupprime() != 0}">
                                <div class="panel-footer" style="height:55px">
                                    <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${ListPhoto.get(i).getIDP()}"></a>
                                </div>
                            </c:if>
                        </c:if>
                    </div>
                </div>
            </c:if>
            <c:if test="${loginedUser == null}">
                <div class="col-sm-4">
                    <div class="panel panel-success">
                        <a href="ViewImage?IDP=${ListPhoto.get(i).getIDP()}"><div class="panel-heading">${i + 1}. ${ListPhoto.get(i).getNomPhoto()}</div></a>

                        <div class="panel-body">
                            <a href="ViewImage?IDP=${ListPhoto.get(i).getIDP()}"><img src="Image?IDP=${ListPhoto.get(i).getIDP()}" class="img-responsive" style="height:205px; width:328px" alt="Image"></a><br>
                            <ul>                                   
                                <li>Like: ${ListPhoto.get(i).getNombreAimer()}</li>
                                <li>Sold: ${ListPhoto.get(i).getNombreAchat()}</li>
                                <li>Cost: ${ListPhoto.get(i).getPrix()}</li>
                            </ul>
                        </div>
                        
                        <div class="panel-footer">
                            <a class="btn btn-default glyphicon glyphicon-heart-empty" href="#LoginModal" data-toggle="modal"></a>
                            <a class="btn btn-default glyphicon glyphicon-remove-circle" href="#LoginModal" data-toggle="modal"></a>
                            <a class="btn btn-default glyphicon glyphicon-shopping-cart pull-right" href="#LoginModal" data-toggle="modal"></a>
                        </div>
                    </div>
                </div>
            </c:if>
                            
            <c:if test="${(i == (ListPhoto.size() - 1) && ((i + 1) mod 3) != 0) || ((i + 1) mod 3) == 0}">
                    </div>
                </div><br>
            </c:if>
        </c:forEach>
                    
        <h1 align="center" style="color:#777777"><a href="HotUser">Hot User</a></h1>
                    
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