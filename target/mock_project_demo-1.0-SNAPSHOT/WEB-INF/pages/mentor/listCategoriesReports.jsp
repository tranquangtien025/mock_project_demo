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
        <title>Categories Report</title>
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
                            <a class="nav-link btn-warning" href="<c:url value="/mentor/listCategories"/>" style="color: white">List Categories</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-warning" href="<c:url value="/mentor/listQuestions"/>" style="color: white">List Questions</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link btn-warning active" href="<c:url value="/mentor/listCategoriesReports"/>" style="color: white">Categories Report</a>
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
                    <h2>Categories Report</h2>
                </div>
            </div>

            <div class="row" style="padding-bottom: 10px">
                <div class="col-md-6 col-lg-6">
                    
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
                            <th>Account</th>
                            <th>Categories</th>
                            <th>Total questions</th>
                            <th>Passed question/total</th>
                            <th>Timer (s)</th>
                            <th>Date</th>
                        </tr>
                        <c:if test="${categoriesReports != null && fn:length(categoriesReports)>0}">
                            <c:forEach var="c" items="${categoriesReports}">
                                <tr style="text-align: center">
                                    <td>${c.id}</td>
                                    <td>${c.username}</td>
                                    <td>${c.categories}</td>
                                    <td>${c.totalQuestions}</td>
                                    <td>${c.passedQuestion}/${c.totalQuestions}</td>
                                    <td>${c.timer}</td>
                                    <td>
                                        <fmt:formatDate pattern="dd/MM/yy hh:mm:ss" value="${c.date}"/>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${categoriesReports == null || fn:length(categoriesReports)<=0}">
                            <tr>
                                <td style="color: red; text-align: center" colspan="7">
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
