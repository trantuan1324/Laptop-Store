<jsp:useBean id="deletedProduct" scope="request" class="com.rabbyte.LaptopStore.domain.Product"/>
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
    <title>Product</title>
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
                    <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin">Dashboard</a></li>
                    <li class="breadcrumb-item active"><a href="${pageContext.request.contextPath}/admin/products">Product</a></li>
                    <li class="breadcrumb-item active">Delete</li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-12 mx-auto">
                            <div>
                                <h3>Table detail with product's name: ${deletedProduct.name} and ID: ${deletedProduct.id}</h3>
                            </div>
                            <hr />
                            <div class="alert alert-danger" role="alert">
                                Do you want to delete this product?
                            </div>
                            <div class="d-flex">
                                <a href="${pageContext.request.contextPath}/admin/products" class="btn btn-primary mt-3 px-3">Cancel</a>
                                <%--@elvariable id="deletedProduct" type="com.rabbyte.LaptopStore.domain.User"--%>
                                <form:form
                                        method="post"
                                        modelAttribute="deletedProduct"
                                        action="/admin/products/delete"
                                >
                                    <div class="mb-3" style="display: none">
                                        <label class="form-label">ID</label>
                                        <form:input type="number" class="form-control" path="id" />
                                    </div>
                                    <button type="submit" class="btn btn-danger mt-3 px-3 mx-4 me-3">Confirm</button>
                                </form:form>
                            </div>
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