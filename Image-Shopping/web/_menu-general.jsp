<%-- 
    Document   : _menu
    Created on : Jan 1, 2016, 7:17:32 PM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<a href="Home">
    <div class="jumbotron">
        <div class="masthead container text-center">
            <h1>TVH Store</h1>      
            <p>Get Art today</p>
        </div>
    </div>
</a>

<!-- NavBar-->
<nav class="navbar navbar-default navbar-static-top " data-spy="affix" data-offset-top="197">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>                        
            </button>
        </div>
        <div class="collapse navbar-collapse" id="myNavbar">
            <ul class="nav navbar-nav">
                <li><a href="Home">Home</a></li>
            </ul>
        </div>
    </div>
</nav>
<!--__________________________________________-->

<c:if test="${errorString != null}">
    <div class="modal fade" id="errorModal">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <h4 class="modal-title">Notification</h4>
                </div>
                <div class="modal-body">
                    ${errorString}
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
</c:if>