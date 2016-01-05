<%-- 
    Document   : _menu-admin
    Created on : Jan 5, 2016, 10:09:23 AM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
                <li><a href="HomeAdmin">Home</a></li>
            </ul>
            <!--Search Bar-->
            <div class="col-sm-3 col-md-3">
                <form class="navbar-form" role="search" action="SearchUser" method="get">
                    <div class="input-group">
                        <div class="form-inline">
                            <input type="text" class="form-control" required="required" placeholder="Search..." name="strUser" id="srch-term">
                            <button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </div>
                </form>
            </div>
            <!--____________________________-->

            <ul class="nav navbar-nav navbar-right">
                <li><a href="#"><span class="glyphicon glyphicon-user"></span>&nbsp;Administrator</a></li>
                <li><a href="LogOut"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Logout</a></li>
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
