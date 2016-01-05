<%-- 
    Document   : _modal-logined
    Created on : Jan 3, 2016, 10:48:27 AM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- CartModal -->
<div id="CartModal" class="modal fade" role="dialog">
    <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color:#777777">Your Shopping Cart</h4>
            </div>
            
            <div class="modal-body">
                <!--Cart Form-->
                <form class="form-horizontal" role="form">
                    <c:forEach items="${ListInCart}" var="photo">
                        <p> ${photo.getNomPhoto()} - ${photo.getPrix()} <a class="close" href="DeleteProductCart?IDP=${photo.getIDP()}"> x </a></p>
                    </c:forEach>
                </form>
            </div>
            
            <div class="modal-footer">
                <p> Sum = ${Sum}</p>
                <br>
                <a href="#CreditCardModal" data-toggle="modal" class="btn btn-info" data-dismiss="modal">Buy</a>
                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--_________________________-->

<!--CreditCardModal-->
<div id="CreditCardModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
      <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color:#777777">Your Shopping Cart</h4>
            </div>
            
            <div class="modal-body">
                <!--Credit Card Form-->
                <form class="form-horizontal" role="form">
                    <div class="form-group">
                        <label class="control-label col-sm-4" for="text" style="margin-left: -38px">Your Credit Card:</label>
                        <div class="col-sm-10">
                            <input type="text" class="form-control" id="text"  placeholder="Enter your credit card number">
                        </div>
                    </div>
                </form>
            </div>

            <div class="modal-footer">
                <a href="Payment" class="btn btn-info">OK</a>
                <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>
<!--_________________________-->

<!-- UploadModal -->
<div id="UploadModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color:#777777">Upload</h4>
            </div>
            
            <form action="Upload" method="post" encType="multipart/form-data">
                <div class="modal-body">
                    <!--Upload Form-->
                    <div class="container">  
                        <div class="row">
                            <div class="col-lg-2">
                                <div class="radio">
                                    <c:if test="${ListAlbumUserLogined.size() <= 0}">
                                        <label style="color:#777777"><input type="radio" disabled name="albumradio" style="color:#777777">Select the album:</label>
                                    </c:if>
                                    <c:if test="${ListAlbumUserLogined.size() > 0}">
                                        <label style="color:#777777"><input type="radio" onclick="DisableFunctionNew()" name="albumradio" style="color:#777777">Select the album:</label>
                                    </c:if>
                                </div>
                                <div class="input-group">
                                    <c:if test="${ListAlbumUserLogined.size() <= 0}">
                                        <select class="form-control" disabled>
                                            <option>No Album</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${ListAlbumUserLogined.size() > 0}">
                                        <select class="form-control" name="IDA" id="oldalbum">
                                            <c:forEach items="${ListAlbumUserLogined}" var="album">
                                                <option value="${album.getIDA()}">${album.getNomAlbum()}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>

                            <div class="col-lg-5">
                                <div class="radio">
                                    <label style="color:#777777"><input type="radio" checked="checked" onclick="DisableFunctionOld()" name="albumradio" style="color:#777777">Create a new album:</label>
                                    <br>
                                    <br>
                                    <strong class="control-label" for="text" style="color:#777777">Album Name: </strong><input type="text" id="newalbum" name="tenalbum" required="required" placeholder="Enter album name">
                                </div>
                            </div>
                        </div>
                    </div>

                    <br>

                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Name:</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="name" name="name" required="required" placeholder="Enter image name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Category:</label>
                            <div class="col-lg-10">
                                <select class="form-control" name="theloai">
                                    <option value="Portrait">Portrait</option>
                                    <option value="Paysage">Lanscape</option>
                                    <option value="Faune">Animal</option>
                                    <option value="Flora">Flower</option>
                                    <option value="Construction">Building</option>
                                    <option value="Homme">Human</option>
                                    <option value="Fantaisie">Fantasy</option>
                                    <option value="Vehicule">Vehicule</option>
                                    <option value="Autre">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Content:</label>
                            <div class="col-lg-10"> 
                                <input type="text" class="form-control" id="cnt" name="noidung" required="required" placeholder="Enter image content">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Price:</label>
                            <div class="col-lg-10"> 
                                <input type="number" min="1000" class="form-control" id="cnt" name="gia" required="required" placeholder="Enter image price">
                            </div>
                        </div>

                        <br>

                        <div class="form-group" align="center">
                            <input type="file" name="photo" required="required" class="btn btn-default">
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-info">Upload</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                </div>
            </form>
         </div>
    </div>
</div>
<!--__________________________________-->

<c:forEach items="${ListPhoto}" var="photo">
    <!-- ReportModal -->
    <div id="ReportModal${photo.getIDP()}" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="color:#777777">Report - ${photo.getNomPhoto()}</h4>
                </div>

                <form class="form-horizontal" role="form" action="Report" method="post">
                    <div class="modal-body">
                        <!--Report Form-->
                        <div class="radio">
                            <label><input type="radio" name="typeReport" value="Violence" style="color:#777777">Violence</label>
                        </div>
                        <div class="radio">
                            <label><input type="radio" name="typeReport" value="Pornographic" style="color:#777777">Pornographic</label>
                        </div>
                    </div>
                        
                    <div class="form-group">
                        <input type="hidden" name="IDP" value="${photo.getIDP()}">
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-info" type="submit">Report</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--________________________________________-->
</c:forEach>
    
<c:forEach items="${ListPhotoOfUser}" var="photo">
    <!-- Edit Modal -->
    <div id="EditModal${photo.getIDP()}" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="color:#777777">Edit - ${photo.getNomPhoto()}</h4>
                </div>
                
                <form class="form-horizontal" role="form" action="UpdateImageInfo" method="post">
                    <div class="modal-body">
                        <!--Edit Form-->
                        <div class="form-horizontal" role="form">
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="text" style="color:#777777">Change album to:</label>
                                <div class="col-lg-10">
                                    <c:if test="${ListAlbumUserLogined.size() <= 0}">
                                        <select class="form-control" disabled>
                                            <option>No Album</option>
                                        </select>
                                    </c:if>
                                    <c:if test="${ListAlbumUserLogined.size() > 0}">
                                        <select class="form-control" name="IDA">
                                            <option value="0">No change</option>
                                            <c:forEach items="${ListAlbumUserLogined}" var="album">
                                                <option value="${album.getIDA()}">${album.getNomAlbum()}</option>
                                            </c:forEach>
                                        </select>
                                    </c:if>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="text" style="color:#777777">Name:</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Enter image name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="text" style="color:#777777">Category:</label>
                                <div class="col-lg-10">
                                    <select class="form-control" name="theloai">
                                        <option value="NoChange">No change</option>
                                        <option value="Portrait">Portrait</option>
                                        <option value="Paysage">Lanscape</option>
                                        <option value="Faune">Animal</option>
                                        <option value="Flora">Flower</option>
                                        <option value="Construction">Building</option>
                                        <option value="Homme">Human</option>
                                        <option value="Fantaisie">Fantasy</option>
                                        <option value="Vehicule">Vehicule</option>
                                        <option value="Autre">Other</option>
                                    </select>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="text" style="color:#777777">Content:</label>
                                <div class="col-lg-10"> 
                                    <input type="text" class="form-control" id="cnt" name="noidung" placeholder="Enter image content">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-lg-2" for="text" style="color:#777777">Price:</label>
                                <div class="col-lg-10"> 
                                    <input type="number" min="1000" class="form-control" id="cnt" name="gia" placeholder="Enter image price">
                                </div>
                            </div>
                            <br>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <input type="hidden" name="IDP" value="${photo.getIDP()}">
                    </div>

                    <div class="modal-footer">
                        <button class="btn btn-info" type="submit">Edit</button>
                        <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!--_________________________-->
</c:forEach>
    
<!-- Edit Modal -->
<div id="EditModal${photo.getIDP()}" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" style="color:#777777">Edit - ${photo.getNomPhoto()}</h4>
            </div>

            <form class="form-horizontal" role="form" action="UpdateImageInfo" method="post">
                <div class="modal-body">
                    <!--Edit Form-->
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Change album to:</label>
                            <div class="col-lg-10">
                                <c:if test="${ListAlbumUserLogined.size() <= 0}">
                                    <select class="form-control" disabled>
                                        <option>No Album</option>
                                    </select>
                                </c:if>
                                <c:if test="${ListAlbumUserLogined.size() > 0}">
                                    <select class="form-control" name="IDA">
                                        <option value="0">No change</option>
                                        <c:forEach items="${ListAlbumUserLogined}" var="album">
                                            <option value="${album.getIDA()}">${album.getNomAlbum()}</option>
                                        </c:forEach>
                                    </select>
                                </c:if>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Name:</label>
                            <div class="col-lg-10">
                                <input type="text" class="form-control" id="name" name="name" placeholder="Enter image name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Category:</label>
                            <div class="col-lg-10">
                                <select class="form-control" name="theloai">
                                    <option value="NoChange">No change</option>
                                    <option value="Portrait">Portrait</option>
                                    <option value="Paysage">Lanscape</option>
                                    <option value="Faune">Animal</option>
                                    <option value="Flora">Flower</option>
                                    <option value="Construction">Building</option>
                                    <option value="Homme">Human</option>
                                    <option value="Fantaisie">Fantasy</option>
                                    <option value="Vehicule">Vehicule</option>
                                    <option value="Autre">Other</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Content:</label>
                            <div class="col-lg-10"> 
                                <input type="text" class="form-control" id="cnt" name="noidung" placeholder="Enter image content">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-lg-2" for="text" style="color:#777777">Price:</label>
                            <div class="col-lg-10"> 
                                <input type="number" min="1000" class="form-control" id="cnt" name="gia" placeholder="Enter image price">
                            </div>
                        </div>
                        <br>
                    </div>
                </div>

                <div class="form-group">
                    <input type="hidden" name="IDP" value="${photo.getIDP()}">
                </div>

                <div class="modal-footer">
                    <button class="btn btn-info" type="submit">Edit</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--_________________________-->