<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Learning Quiz Engine</title>
    </head>
    <body>

<!--        <form action="<c:url value="/member/learningQuizEngine"/>" method="post">-->
        <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
            <tr>
                <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                    Learning Quiz Engine
                </th>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>

            <form action="<c:url value="/member/learningQuizEngine"/>" method="post"
                  id="createQuizForm">
                <tr>
                    <td style="width: 20px"></td>
                    <td style="background-color: #ed7d31; color: white; border: 1px black solid; font-weight: bold;
                        padding-left: 20px; width: 300px">
                        Select number of questions
                    </td>                    
                    <td style="border: 1px black solid">
                        <select name="number" id="answer" class="form-control" 
                                style="text-align: center; font-weight: bold; width: 180px">
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="30">30</option>
                            <option value="40">40</option>
                            <option value="50">50</option>
                            <option value="60">60</option>
                            <option value="70">70</option>
                            <option value="80">80</option>
                            <option value="90">90</option>
                            <option value="100">100</option>
                        </select>
                    </td>
                    <td style="width: 20px"></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>

                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold;
                        padding-left: 20px">
                        Select categories
                    </td>
                    <td style="border: 1px black solid">
                        <select name="category" class="form-control" style="width: 180px; text-align: center">
                            <option value="Random" selected>Random</option>
                            <c:forEach var="category" items="${categories}">
                                <option value="${category.categoryName}">${category.categoryName}</option>
                            </c:forEach>
                        </select>                        
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
            </form>

            <tr>
                <td></td>
                <td style="text-align: left">
                    <input form="createQuizForm" type="submit" value="START" style="background-color: #4472c4; color: white; 
                           border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" />
                </td>
                <td style="text-align: right" >
                    <a href="<c:url value="/logout"/>">
                        <button style="background-color: #4472c4; color: white; border-radius: 5px; 
                                padding: 10px; width: 180px; font-weight: bold">
                            Log Out
                        </button>
                    </a>
                </td>
                <td></td>
            </tr>
            <tr>
                <td><br></td>
            </tr>
        </table>
        <!--        </form>-->
    </body>
</html>
