<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>Register - SB Admin</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
</head>
<body class="bg-primary">
<div id="layoutAuthentication">
    <div id="layoutAuthentication_content">
        <main>
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-7">
                        <div class="card shadow-lg border-0 rounded-lg mt-5">
                            <div class="card-header"><h3 class="text-center font-weight-light my-4" >Create Account</h3></div>
                            <div class="card-body">
                                <%--@elvariable id="registerUser" type="com.rabbyte.LaptopStore.domain.dto.RegisterDTO"--%>
                                <form:form method="post" action="/register" modelAttribute="registerUser">
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <c:set var="firstNameError">
                                                    <form:errors path="firstName" cssClass="invalid-feedback"/>
                                                </c:set>
                                                <form:input class="form-control ${not empty firstNameError ? 'is-invalid' : ''}" id="inputFirstName" type="text" placeholder="Enter your first name" path="firstName"/>
                                                <label for="inputFirstName">First name</label>
                                                ${firstNameError}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating">
                                                <c:set var="lastNameError">
                                                    <form:errors path="lastName" cssClass="invalid-feedback"/>
                                                </c:set>
                                                <form:input class="form-control ${not empty lastNameError ? 'is-invalid' : ''}" id="inputLastName" type="text" placeholder="Enter your last name" path="lastName"/>
                                                <label for="inputLastName">Last name</label>
                                                ${lastNameError}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-floating mb-3">
                                        <c:set var="emailError">
                                            <form:errors path="email" cssClass="invalid-feedback"/>
                                        </c:set>
                                        <form:input class="form-control ${not empty emailError ? 'is-invalid' : ''}" id="inputEmail" type="email" placeholder="name@example.com" path="email"/>
                                        <label for="inputEmail">Email address</label>
                                        ${emailError}
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <c:set var="passwordError">
                                                    <form:errors path="password" cssClass="invalid-feedback"/>
                                                </c:set>
                                                <form:input class="form-control ${not empty passwordError ? 'is-invalid' : ''}" id="inputPassword" type="password" placeholder="Create a password" path="password"/>
                                                <label for="inputPassword">Password</label>
                                                ${passwordError}
                                            </div>
                                        </div>
                                        <div class="col-md-6">
                                            <div class="form-floating mb-3 mb-md-0">
                                                <c:set var="confirmPasswordError">
                                                    <form:errors path="confirmPassword" cssClass="invalid-feedback"/>
                                                </c:set>
                                                <form:input class="form-control ${not empty confirmPasswordError ? 'is-invalid' : ''}" id="inputPasswordConfirm" type="password" placeholder="Confirm password" path="confirmPassword"/>
                                                <label for="inputPasswordConfirm">Confirm Password</label>
                                                ${confirmPasswordError}
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mt-4 mb-0">
                                        <div class="d-grid">
                                            <form:button class="btn btn-primary btn-blockpo" type="submit">Create Account</form:button>
                                        </div>
                                    </div>
                                </form:form>
                            </div>
                            <div class="card-footer text-center py-3">
                                <div class="small"><a href="${pageContext.request.contextPath}/login">Have an account? Go to login</a></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
    </div>
    <jsp:include page="../layout/footer.jsp"/>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>
</html>
