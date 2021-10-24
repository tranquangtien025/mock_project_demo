<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User</title>

        <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
        <script type="text/javascript">
            function validation() {
                var questionContent = $('#questionContent').val();
                var a = $('#a').val();
                var b = $('#b').val();
                var c = $('#c').val();
                var d = $('#d').val();
                var duration = $('#duration').val();
                var error = 0;

                if (questionContent === "") {
                    document.getElementById("questionContentError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("questionContentError").innerHTML = "";
                }

                if (a === "") {
                    document.getElementById("aError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("aError").innerHTML = "";
                }

                if (b === "") {
                    document.getElementById("bError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("bError").innerHTML = "";
                }

                if (c === "") {
                    document.getElementById("cError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("cError").innerHTML = "";
                }

                if (d === "") {
                    document.getElementById("dError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("dError").innerHTML = "";
                }

                if (duration === "") {
                    document.getElementById("durationError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("durationError").innerHTML = "";
                }

                if (error === 0) {
                    return true;
                } else {
                    return false;
                }
            }
        </script>
    </head>
    <body>

        <form action="<c:url value="/mentor/questionResult"/>" method="post"
              modelAttribute="question"
              onsubmit="return validation();">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
                <tr>
                    <th colspan="5" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                        Question
                    </th>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <input name="id" type="text" value="${question.id}" hidden style="background-color: #e2efda"/>

                <tr>
                    <td style="width: 20px"></td>
                    <td style="background-color: #ed7d31; color: white; border: 1px black solid; 
                        padding-left: 20px; padding-right: 20px; font-weight: bold">
                        Categories
                    </td>
                    <td style="border: 1px black solid; width: 200px; text-align: center">
                        <select name="category.id" class="form-control" style="width: 200px; text-align: center">
                            <c:forEach var="category" items="${categories}">
                                <c:if test="${question.category.id == category.id}">
                                    <option value="${category.id}" selected>${category.categoryName}</option>
                                </c:if>
                                <c:if test="${question.category.id != category.id}">
                                    <option value="${category.id}">${category.categoryName}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td colspan="2" style="width: 159px">                        
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold; width: 120px">Question</td>
                    <td colspan="2">
                        <input id="questionContent" name="questionContent" value="${question.questionContent}" 
                                  style="background-color: #e2efda; width: 339px"><!--height: 60px-->
                        </input>
                    </td>
                    <td style="width: 20px">
                        <span style="color: red" id="questionContentError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">A</td>
                    <td colspan="2">
                        <input name="a" id="a" type="text" value="${question.a}" style="background-color: #e2efda; width: 339px"/>

                    </td>
                    <td>
                        <span style="color: red" id="aError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">B</td>
                    <td colspan="2">
                        <input name="b" id="b" type="text" value="${question.b}" style="background-color: #e2efda; width: 339px"/>

                    </td>
                    <td>
                        <span style="color: red" id="bError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">C</td>
                    <td colspan="2">
                        <input name="c" id="c" type="text" value="${question.c}" style="background-color: #e2efda; width: 339px"/>

                    </td>
                    <td>
                        <span style="color: red" id="cError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">D</td>
                    <td colspan="2">
                        <input name="d" id="d" type="text" value="${question.d}" style="background-color: #e2efda; width: 339px"/>

                    </td>
                    <td>
                        <span style="color: red" id="dError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Answer</td>
                    <td colspan="2">
                        <select name="answer" id="answer" class="form-control" style="background-color: #e2efda; width: 108px">
                            <c:forEach var="answer" items="A,B,C,D">
                                <c:if test="${question.answer == answer}">
                                    <option value="${answer}" selected>${answer}</option>
                                </c:if>
                                <c:if test="${question.answer != answer}">
                                    <option value="${answer}">${answer}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </td>
                    <td>
                        <span style="color: red" id="answerError"></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Duration(s)</td>
                    <td colspan="2">
                        <input name="duration" id="duration" type="number" min="30" value="${question.duration}" 
                               style="background-color: #e2efda; width: 100px"/>
                        <span style="color: red" id="durationError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <span style="color: #E67D21; font-weight: bold" id="messageError">
                            <c:if test="${message != null && message != ''}">
                                ${message}
                            </c:if>
                        </span>
                    </td>
                    <td colspan="2" style="text-align: right">
                        <input type="submit" value="Submit" style="background-color: #4472c4; color: white; border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="5"><br></td>
                </tr>
            </table>
        </form>
    </body>
</html>
