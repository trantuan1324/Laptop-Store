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
    <title>Create a new product</title>
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
                    <li class="breadcrumb-item active"><a href="/admin/products">Products</a></li>
                    <li class="breadcrumb-item active">Create</li>
                </ol>
                <div class="container mt-5">
                    <div class="row">
                        <div class="col-md-6 col-12 mx-auto">
                            <h1 class="label">Create a new product</h1>
                            <hr>
                            <%--@elvariable id="newProduct" type="com.rabbyte.LaptopStore.domain.Product"--%>
                            <form:form method="post" enctype="multipart/form-data" action="/admin/products/update" modelAttribute="newProduct" class="row g-3">
                                <div class="col-12 col-md-6">
                                    <c:set var="nameError">
                                        <form:errors path="name" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="inputName" class="form-label">Name</label>
                                    <form:input type="text" class="form-control ${not empty nameError ? 'is-invalid' : ''}" path="name"/>
                                    ${nameError}
                                </div>
                                <div class="col-12 col-md-6">
                                    <c:set var="priceError">
                                        <form:errors path="price" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="inputPrice" class="form-label ${not empty priceError ? 'is-invalid' : ''}">Price</label>
                                    <form:input type="text" class="form-control" path="price"/>
                                    ${priceError}
                                </div>
                                <div class="col-12">
                                    <label for="inputDetailDescription" class="form-label">Detail description</label>
                                    <form:textarea class="form-control" path="detailDesc"/>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputShortDescription" class="form-label">Short description</label>
                                    <form:input type="text" class="form-control" path="shortDesc"/>
                                </div>
                                <div class="col-12 col-md-6">
                                    <c:set var="quantityError">
                                        <form:errors path="quantity" cssClass="invalid-feedback"/>
                                    </c:set>
                                    <label for="inputQuantity" class="form-label ${not empty nameError ? 'is-invalid' : ''}">Quantity</label>
                                    <form:input type="text" class="form-control" path="quantity"/>
                                    ${quantityError}
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputFactory" class="form-label">Factory</label>
                                    <form:select id="inputState" class="form-select" path="factory">
                                        <option selected>Choose...</option>
                                        <form:option value="APPLE">Apple</form:option>
                                        <form:option value="ASUS">Asus</form:option>
                                        <form:option value="LENOVO">Lenovo</form:option>
                                        <form:option value="DELL">Dell</form:option>
                                        <form:option value="LG">LG</form:option>
                                        <form:option value="ACER">Acer</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12 col-md-6">
                                    <label for="inputTarget" class="form-label">Target</label>
                                    <form:select id="inputState" class="form-select" path="target">
                                        <option selected>Choose...</option>
                                        <form:option value="GAMING">Gaming</form:option>
                                        <form:option value="SINHVIEN-VANPHONG">Sinh viên - Văn phòng</form:option>
                                        <form:option value="THIET-KE-DO-HOA">Thiết kế đồ họa</form:option>
                                        <form:option value="MONG-NHE">Mỏng nhẹ</form:option>
                                        <form:option value="DOANH-NHAN">Doanh nhân</form:option>
                                    </form:select>
                                </div>
                                <div class="col-12">
                                    <label for="avatarFile" class="form-label">Choose product picture</label>
                                    <input class="form-control" type="file" id="avatarFile" name="productImage" accept=".png, .jpg, .jpeg">
                                </div>
                                <div class="col-12">
                                    <img style="max-height: 250px; display: none;" alt="chosen avatar" id="avatarPreview"/>
                                </div>
                                <div class="col-12">
                                    <button type="submit" class="btn btn-primary me-3">Create</button>
                                    <a href="${pageContext.request.contextPath}/admin/products" type="button" class="btn btn-warning">Cancel</a>
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