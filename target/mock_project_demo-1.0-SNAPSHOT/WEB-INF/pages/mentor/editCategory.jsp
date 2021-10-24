<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
        
        <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
        <script type="text/javascript">
            function validation() {
                var categoryName = $('#categoryName').val();
                var error = 0;
                
                if (categoryName === "") {
                    document.getElementById("categoryNameError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("categoryNameError").innerHTML = "";
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

        <form action="<c:url value="/mentor/categoryResult"/>" method="post"
              modelAttribute="category"
              onsubmit="return validation();">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
                <tr>
                    <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                        Category
                    </th>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>

                <input name="id" type="text" value="${category.id}" hidden/>

                <tr>
                    <td style="width: 80px"></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Category</td>
                    <td>
                        <input name="categoryName" id="categoryName" type="text" value="${category.categoryName}" autofocus style="background-color: #e2efda"/>
                        <span style="color: red" id="categoryNameError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                
                <tr>
                    <td></td>
                    <td></td>
                    <td style="text-align: left">
                        <input type="submit" value="SAVE" style="background-color: #4472c4; color: white; border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
            </table>
        </form>
    </body>
</html>
