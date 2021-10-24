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
        <title>List Questions</title>
        <link href="<c:url value="/webjars/bootstrap/4.5.3/css/bootstrap.min.css"/>"
              type="text/css" rel="stylesheet"/>

        <style>
            .correct-answer {
                background-color: green;
                color: white;
            }
        </style>
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
                            <a class="nav-link btn-warning active" href="<c:url value="/mentor/listQuestions"/>" style="color: white">List Questions</a>
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
                    <h2>List Questions</h2>
                    <br>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-12">
                    <table>
                        <tr>
                            <td style="background-color: #ed7d31; color: white; border: 1px black solid; 
                                padding-left: 20px; padding-right: 20px; font-weight: bold">
                                Categories
                            </td>
                            <td style="border: 1px black solid">
                                <select name="category.id" class="form-control" id="selectCategory" 
                                        style="width: 200px; text-align: center">
                                    <c:forEach var="category" items="${categories}">
                                        <c:if test="${categoryId == category.id}">
                                            <option value="${category.id}" selected>${category.categoryName}</option>
                                        </c:if>
                                        <c:if test="${categoryId != category.id}">
                                            <option value="${category.id}">${category.categoryName}</option>
                                        </c:if>
                                    </c:forEach>
                                </select>
                            </td>
                            <td style="padding-left: 40px">
                                <button onclick="location.href = '<c:url value="/mentor/addQuestion"/>'"
                                        class="btn btn-info" style="width: 100px; font-weight: bold">
                                    New
                                </button>
                            </td>
<!--                        <form action="<c:url value="/mentor/upload"/>" method="POST"
                              enctype="multipart/form-data">
                            <td style="padding-left: 40px">
                                <input name="file" id="fileToUpload" type="file" accept="txt/csv">
                            </td>
                            <td>
                                <button type="submit" id="btnUploadFile" 
                                        class="btn btn-info" style="width: 100px; font-weight: bold">
                                    Upload
                                </button>                                
                            </td>
                        </form>-->
                        </tr>
                    </table>
                    <br>
                </div>
            </div>

            <div class="row">
                <div class="col-md-12 col-lg-12"/>
                <!-- table -->
                <div class="table-responsive">
                    <table class="table table-bordered table-hover">
                        <tr style="text-align: center; background-color: #ed7d31; color: white">
                            <th style="width: 63px">##</th>
                            <th colspan="2">Question</th>
                            <th colspan="2" style="width: 10%">Action</th>
                        </tr>
                        <c:if test="${questions != null && fn:length(questions)>0}">
                            <c:forEach var="question" items="${questions}">
                                <!--<tr dataId="${question.id}">-->
                                <tr>    
                                    <td>${question.id}</td>
                                    <td>${question.questionContent}</td>
                                    <td style="width: 10%; text-align: center">
                                        <a href="#" dataId="${question.id}" id="show">
                                            Show
                                        </a>
                                    </td>
                                    <td>
                                        <button onclick="location.href = '<c:url value="/mentor/editQuestion/${question.id}"/>'"
                                                class="btn btn-warning">
                                            E
                                        </button>
                                    </td>
                                    <td>
                                        <button onclick="location.href = '<c:url value="/mentor/confirmDeleteQuestion/${question.id}"/>'"
                                                class="btn btn-danger">
                                            D
                                        </button>
                                    </td>
                                </tr>
                                <tr id="extra_${question.id}" class="hideall">
                                    <td>
                                    </td>
                                    <td colspan="4">
                                        <div id="a" class="${question.answer == 'A' ? "correct-answer":""}">A. ${question.a}</div>
                                        <div id="b" class="${question.answer == 'B' ? "correct-answer":""}">B. ${question.b}</div>
                                        <div id="c" class="${question.answer == 'C' ? "correct-answer":""}">C. ${question.c}</div>
                                        <div id="d" class="${question.answer == 'D' ? "correct-answer":""}">D. ${question.d}</div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </c:if>
                        <c:if test="${questions == null || fn:length(questions)<=0}">
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

    <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
    <script>
                                            $(function () {
                                                $(".hideall").hide();
                                                $("table").on("click", "#show", function (event) {
                                                    event.preventDefault();
                                                    let id = $(this).attr("dataid");
                                                    //console.log($(this).text().trim())
                                                    $("#extra_" + id).slideToggle();
                                                    if ($(this).text().trim() === 'Show') {
                                                        $(this).html("Hide")
                                                    } else {
                                                        $(this).html("Show")
                                                    }
                                                });
                                            });
    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script type="text/javascript">
                                            $(document).ready(function () {
                                                $('#selectCategory').on('change', function (event) {
                                                    event.preventDefault();
                                                    let categoryId = $('#selectCategory').val();
                                                    window.location = '${pageContext.request.contextPath}/mentor/loadQuestionsByCategory/' + categoryId;
                                                });
                                            });
    </script>
</body>
</html>
