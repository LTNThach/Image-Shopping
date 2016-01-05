<%-- 
    Document   : viewproduct
    Created on : Dec 20, 2015, 9:38:41 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Photo: ${photo.getNomPhoto()}</title>     
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

        <div class="page-header">
            <h1 align = "center">${photo.getNomPhoto()}</h1>
        </div>
        
        <c:if test="${loginedUser != null}">
            <div class="container"> 
                <div class="panel panel-success">
                    <div class="panel-body">
                        <img src="Image?IDP=${photo.getIDP()}" class="img-responsive" style="height:692px; width:1108px" alt="Image"><br>
                        <ul>                                   
                            <li>Taken by: <a href="ViewUser?IDU=${photo.getIDU()}">${photo.getNomUtilisateur()}</a></li>
                            <li>From album: <a href="ViewAlbum?IDA=${photo.getIDA()}&NomAlbum=${photo.getNomAlbum()}&IDU=${photo.getIDU()}">${photo.getNomAlbum()}</a></li>
                            <li>Type: ${photo.getPhotoType()}</li>
                            <li>Content: ${photo.getContenu()}</li>
                            <li>Point: ${photo.getPoint()}</li>
                            <li>View: ${photo.getNombreVu()}</li>
                            <li>Like: ${photo.getNombreAimer()}</li>
                            <li>Sold: ${photo.getNombreAchat()}</li>
                            <li>Cost: ${photo.getPrix()}</li>
                        </ul>
                    </div>

                    <c:if test="${loginedUser.getIDU() != photo.getIDU()}">
                        <c:if test="${photo.getSupprime() == 0}">
                            <div class="panel-footer">
                                <c:if test="${ListLike != null}">
                                    <c:if test="${ListLike.contains(photo) == true}">
                                        <a class="btn btn-default glyphicon glyphicon-heart"></a>
                                    </c:if>

                                    <c:if test="${ListLike.contains(photo) == false}">
                                        <a href="Like?IDP=${photo.getIDP()}" class="btn btn-default glyphicon glyphicon-heart-empty"></a>
                                    </c:if>
                                </c:if>

                                <c:if test="${ListLike == null}">
                                    <a href="Like?IDP=${photo.getIDP()}" class="btn btn-default glyphicon glyphicon-heart-empty"></a>
                                </c:if>

                                <a class="btn btn-default glyphicon glyphicon-remove-circle" href="#ReportModal${photo.getIDP()}" data-toggle="modal"></a>

                                <c:if test="${ListBuy != null}">
                                    <c:if test="${ListBuy.contains(photo) == true}">
                                        <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${photo.getIDP()}"></a>
                                    </c:if>

                                    <c:if test="${ListBuy.contains(photo) == false}">
                                        <c:if test="${ListInCart != null}">
                                            <c:if test="${ListInCart.contains(photo) == false}">
                                                <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${photo.getIDP()}"></a>
                                            </c:if>
                                            <c:if test="${ListInCart.contains(photo) == true}">
                                                <a class="btn btn-default glyphicon glyphicon-shopping-cart pull-right" href="#CartModal" data-toggle="modal"></a>
                                            </c:if>
                                        </c:if>                                          
                                        <c:if test="${ListInCart == null}">   
                                            <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${photo.getIDP()}"></a>
                                        </c:if>
                                    </c:if>       
                                </c:if>

                                <c:if test="${ListBuy == null}">
                                    <c:if test="${ListInCart != null}">
                                        <c:if test="${ListInCart.contains(photo) == false}">
                                            <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${photo.getIDP()}"></a>
                                        </c:if>
                                        <c:if test="${ListInCart.contains(photo) == true}">
                                            <a class="btn btn-default glyphicon glyphicon-shopping-cart pull-right" href="#CartModal" data-toggle="modal"></a>
                                        </c:if>
                                    </c:if>       
                                    <c:if test="${ListInCart == null}">   
                                        <a class="btn btn-default glyphicon glyphicon-plus pull-right" href="AddToCart?IDP=${photo.getIDP()}"></a>
                                    </c:if>
                                </c:if>                            
                            </div>
                        </c:if>
                    </c:if>
                    <c:if test="${loginedUser.getIDU() == photo.getIDU()}">
                        <c:if test="${photo.getSupprime() == 0}">
                            <div class="panel-footer">
                                <a class="btn btn-default glyphicon glyphicon-cog" href="#EditModal${photo.getIDP()}"data-toggle="modal"></a>
                                <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${photo.getIDP()}"></a>
                                <a class="btn btn-default glyphicon glyphicon-trash pull-right" href="DeletePhoto?IDP=${photo.getIDP()}"></a>
                            </div>
                        </c:if>
                        <c:if test="${photo.getSupprime() != 0}">
                            <div class="panel-footer" style="height:55px">
                                <a class="btn btn-default glyphicon glyphicon-download-alt pull-right" href="Download?IDP=${photo.getIDP()}"></a>
                            </div>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </c:if>
        <c:if test="${loginedUser == null}">
            <div class="container">
                <div class="panel panel-success">
                    <div class="panel-body">
                        <img src="Image?IDP=${photo.getIDP()}" class="img-responsive" style="height:692px; width:1108px" alt="Image"><br>
                        <ul>                                   
                            <li>Taken by: <a href="ViewUser?IDU=${photo.getIDU()}">${photo.getNomUtilisateur()}</a></li>
                            <li>From album: <a href="ViewAlbum?IDA=${photo.getIDA()}&NomAlbum=${photo.getNomAlbum()}&IDU=${photo.getIDU()}">${photo.getNomAlbum()}</a></li>
                            <li>Type: ${photo.getPhotoType()}</li>
                            <li>Content: ${photo.getContenu()}</li>
                            <li>Point: ${photo.getPoint()}</li>
                            <li>View: ${photo.getNombreVu()}</li>
                            <li>Like: ${photo.getNombreAimer()}</li>
                            <li>Sold: ${photo.getNombreAchat()}</li>
                            <li>Cost: ${photo.getPrix()}</li>
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
        
        <jsp:include page="_footer.jsp"></jsp:include>
    </body>
</html>