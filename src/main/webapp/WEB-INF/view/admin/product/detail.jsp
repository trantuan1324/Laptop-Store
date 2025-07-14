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
    <title>User's information</title>
    <link href="/css/styles.css" rel="stylesheet" />
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
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
                    <li class="breadcrumb-item active"><a href="/admin/products">Products</a></li>
                    <li class="breadcrumb-item active">Detail</li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div>
                                <h3>Table Details</h3>
                            </div>
                            <hr />
                            <img src="http://localhost:8080/images/product/${selectedProduct.image}" style="max-height: 250px; object-fit: contain"  alt="Product image">
                            <div class="card" style="width: 60%">
                                <div class="card-header"><b>Product information</b></div>
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item">ID: ${selectedProduct.id}</li>
                                    <li class="list-group-item">Name: ${selectedProduct.name}</li>
                                    <li class="list-group-item">Price: ${selectedProduct.price}</li>
                                    <li class="list-group-item">Detail Desc: ${selectedProduct.detailDesc}</li>
                                    <li class="list-group-item">Short Desc: ${selectedProduct.shortDesc}</li>
                                    <li class="list-group-item">Quantity: ${selectedProduct.quantity}</li>
                                    <li class="list-group-item">Factory: ${selectedProduct.factory}</li>
                                    <li class="list-group-item">Target: ${selectedProduct.target}</li>
                                </ul>
                            </div>
                            <a href="/admin/products" class="btn btn-primary mt-3 px-3">Back</a>
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