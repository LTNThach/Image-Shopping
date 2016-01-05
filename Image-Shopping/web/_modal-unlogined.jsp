<%-- 
    Document   : _modal-unlogined
    Created on : Jan 3, 2016, 10:48:41 AM
    Author     : Thach
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Login Modal-->
<div id="LoginModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Login Form</h4>
            </div>
            
            <form class="form-horizontal" role="form" action="LogIn" method="post">
                <div class="modal-body">
                    <!--Login Form-->
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="username">Username:</label>
                            <div class="col-sm-10">
                                <input type="text" class="form-control" id="username" name='username' required="required" placeholder="Enter your username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-2" for="pwd">Password:</label>
                            <div class="col-sm-10"> 
                                <input type="password" class="form-control" id="pwd" name='password' required="required" placeholder="Enter password">
                            </div>
                        </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" targer="#">Log In</button>
                    <a href="#RegisterModal" data-toggle="modal" class="btn btn-info" data-dismiss="modal">Register</a>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--________________________________________-->

<!-- Modal Register -->
<div id="RegisterModal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Register Form</h4>
            </div>
            
            <form action="Register" method="post">
                <div class="modal-body">
                    <!--Register Form-->
                    <div class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="text">Username:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="text" name='username' required="required" placeholder="Enter your username">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="email">Email:</label>
                            <div class="col-sm-9">
                                <input type="email" class="form-control" id="email" name='email' required="required" placeholder="Enter your email">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="text">First name:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="text" name='firstname' required="required" placeholder="Enter your first name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="text">Last name:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="text" name='lastname' required="required" placeholder="Enter your last name">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="text">Addresses:</label>
                            <div class="col-sm-9">
                                <input type="text" class="form-control" id="text" name='addresses' required="required" placeholder="Enter your addresses">
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label col-sm-3" for="text">Phone number:</label>
                            <div class="col-sm-9">
                                <input type="number" class="form-control" id="text" name='phone' required="required" placeholder="Enter your phone number">
                            </div>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="submit" class="btn btn-info" targer="#">Register</button>
                    <button type="button" class="btn btn-info" data-dismiss="modal">Close</button>
                </div>
            </form>
        </div>
    </div>
</div>
<!--________________________________________-->
