<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="Rabbyte - Dự án Laptop Store" />
    <meta name="author" content="Rabbyte" />
    <title>Create a new user</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script>
        $(document).ready(() => {
            const avatarFile = $("#avatarFile");
            avatarFile.change(function (e) {
                const imgURL = URL.createObjectURL(e.target.files[0]);
                $("#avatarPreview").attr("src", imgURL);
                $("#avatarPreview").css({"display": "block" });
            });
        });
    </script>

</head>

<body class="sb-nav-fixed">
<jsp:include page="../layout/header.jsp"/>
<div id="layoutSidenav">
    <jsp:include page="../layout/sidebar.jsp"/>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Dashboard</h1>
                <ol class="breadcrumb mb-4">
                    <li class="breadcrumb-item active"><a href="/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="/admin/users">Users</a></li>
                    <li class="breadcrumb-item active">Create</li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1 class="label">Create a new user</h1>
                            <hr>
                            <form:form method="post" enctype="multipart/form-data" action="/admin/users/create" modelAttribute="newUser" class="row g-3">
                                <div class="col-12 col-md-6">
                                    <label for="inputEmail4" class="form-label">Email</label>
                                    <form:input type="email" class="form-control" path="email"/>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputPassword4" class="form-label">Password</label>
                                    <form:input type="password" class="form-control" path="password"/>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputPhoneNumber" class="form-label">Phone number</label>
                                    <form:input type="text" class="form-control" path="phone"/>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputFullName" class="form-label">Full name</label>
                                    <form:input type="text" class="form-control" path="fullName"/>
                                </div>
                                <div class="col-12">
                                    <label for="inputAddress" class="form-label">Address</label>
                                    <form:input type="text" class="form-control" path="address"/>
                                </div>
                                <div class="col-12 col-md-4">
                                    <label for="inputState" class="form-label">Role</label>
                                    <form:select id="inputState" class="form-select" path="role.name">
                                        <option selected>Choose...</option>
                                        <form:option value="ADMIN">ADMIN</form:option>
                                        <form:option value="USER">USER</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 col-md-8">
                                    <label for="avatarFile" class="form-label">Choose profile picture</label>
                                    <input class="form-control" type="file" id="avatarFile" name="avatarImage" accept=".png, .jpg, .jpeg">
                                </div>
                                <div class="col-12">
                                    <img style="max-height: 250px; display: none;" alt="chosen avatar" id="avatarPreview"/>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary">Create a new user</button>
                                </div>
                            </form:form>
                        </div>
                    </div>
                </div>
            </div>
        </main>
        <jsp:include page="../layout/footer.jsp"/>
    </div>
</div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        crossorigin="anonymous"></script>
<script src="/js/scripts.js"></script>
</body>

</html>