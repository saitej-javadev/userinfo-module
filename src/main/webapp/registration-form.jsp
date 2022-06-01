
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css">
<script>
    $('.alert').show();
    setTimeout(function(){ $('.alert').hide(); }, 6000);
</script>
<c:if test="${isRegistrationSuccess}">
    <div class="alert alert-warning" style="margin-bottom: 0px;">
        <strong>Registration successful! </strong> Please check your email for credentials!
    </div>
</c:if>

<div class="jumbotron jumbotron-fluid" style="margin-bottom: 0px;">
<div class="container">
    <br>



    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <header class="card-header">
                    <a href="dologin" class="float-right btn btn-outline-primary mt-1">Log in</a>
                    <h4 class="card-title mt-2">Sign up</h4>
                </header>
                <article class="card-body">
                    <form action="register" method="post">
                        <div class="form-row">
                            <div class="col form-group">
                                <label>First name </label>
                                <input type="text" class="form-control" placeholder="name" name="name">
                            </div> <!-- form-group end.// -->
                        </div> <!-- form-row end.// -->
                        <div class="form-group">
                            <label>Email address</label>
                            <input type="email" class="form-control" placeholder="email" name="email">
                            <small class="form-text text-muted">We'll never share your email with anyone else.</small>
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <label>Password</label>
                            <input class="form-control" type="password"  placeholder="password" name="password">
                        </div> <!-- form-group end.// -->
                        <div class="form-group">
                            <button type="submit" class="btn btn-primary btn-block"> Register  </button>
                        </div> <!-- form-group// -->
                        <small class="text-muted">By clicking the 'Sign Up' button, you confirm that you accept our <br> Terms of use and Privacy Policy.</small>
                    </form>
                </article> <!-- card-body end .// -->
                <div class="border-top card-body text-center">Have an account? <a href="dologin">Log In</a></div>
            </div> <!-- card.// -->
        </div> <!-- col.//-->

    </div> <!-- row.//-->
    </div>
    <footer class="page-footer font-small" style="background-color: #f5f5f5;">
        <div class="footer-copyright text-center py-4" style="align-items: center;">
            © 2022 <a
                href="https://in.linkedin.com/in/saiteja-galipelli-071245b7">
            Saiteja Galipelli LinkedIn </a>
        </div>
    </footer>
</div>
<!--container end.//-->

