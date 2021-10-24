<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" 
          prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions"
          prefix="fn" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Categories</title>
        <link href="<c:url value="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>
    </head>
    <body>
        <div class="container">

            <div class="row">
                <div class="col-md-12 col-lg-12"
                     style="text-align: center">
                    <ul class="nav justify-content-center" style="font-weight: bold; background-color: #ffc107">
                        <li class="nav-item">
                            <a class="nav-link btn-warning" href="<c:url value="/mentor/listUser"/>" style="color: white">List User</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-warning active" href="<c:url value="/mentor/listCategories"/>" style="color: white">List Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-warning" href="<c:url value="/mentor/listQuestions"/>" style="color: white">List Questions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-warning" href="<c:url value="/mentor/listCategoriesReports"/>" style="color: white">Categories Report</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-danger" href="<c:url value="/logout"/>" style="color: white">Log Out</a>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-12"
                     style="text-align: center">
                    <h2>List Categories</h2>
                </div>
            </div>

            <div class="row" style="padding-bottom: 10px">
                <div class="col-md-6 col-lg-6">
                    <button onclick="location.href = '<c:url value="/mentor/addCategory"/>'"
                            class="btn btn-info">
                        New
                    </button>
                </div>

                <div class="col-md-6 col-lg-6">

                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-12"/>
                <!-- table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <tr style="text-align: center; background-color: #ed7d31; color: white">
                            <th>##</th>
                            <th>Categories</th>
                            <th colspan="2">Action</th>
                        </tr>
                        <c:if test="${categories != null && fn:length(categories)>0}">
                            <c:forEach var="category" items="${categories}">
                                <tr>
                                    <td>${category.id}</td>
                                    <td>${category.categoryName}</td>
                                    <td>
                                        <button onclick="location.href = '<c:url value="/mentor/editCategory/${category.id}"/>'"
                                                class="btn btn-warning">
                                            E
                                        </button>
                                    </td>
                                    <td>
                                        <button onclick="location.href = '<c:url value="/mentor/confirmDeleteCategory/${category.id}"/>'"
                                                class="btn btn-danger">
                                            D
                                        </button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${categories == null || fn:length(categories)<=0}">
                            <tr>
                                <td style="color: red; text-align: center" colspan="4">
                                    Not Found !!!
                                </td>
                            </tr>
                        </c:if>
                    </table>
                </div>
                <!-- end table -->
            </div>
        </div>
    </div>
</body>
</html>
