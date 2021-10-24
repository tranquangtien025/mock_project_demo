<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Delete User</title>
    </head>
    <body>


        <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
            <tr>
                <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                    Confirm
                </th>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>
            <tr>
                <td style="width: 40px"></td>
                <td colspan="2" style="border: 1px black solid; font-weight: bold; text-align: center">Delete</td>
                <td style="width: 40px"></td>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>

            <tr>
                <td></td>
                <td colspan="2" style="text-align: right">
                    <button onclick="location.href = '<c:url value="/mentor/listUser"/>'"
                            class="btn btn-info" style="width: 100px; font-weight: bold">
                        Cancel
                    </button>
                    &nbsp;&nbsp;
                    <button onclick="location.href = '<c:url value="/mentor/deleteUser/${userId}"/>'"
                            class="btn btn-info" style="width: 100px; font-weight: bold">
                        OK
                    </button>
                </td>
                <td></td>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>
        </table>

    </body>
</html>
