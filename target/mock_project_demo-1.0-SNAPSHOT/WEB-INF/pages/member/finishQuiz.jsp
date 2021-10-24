<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Finish Quiz</title>
    </head>
    <body>

        <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
            <tr>
                <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                    Finish Quiz
                </th>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>

            <tr>
                <td style="width: 20px"></td>
                <td style="background-color: #ed7d31; color: white; border: 1px black solid; font-weight: bold;
                    padding-left: 20px; width: 300px">
                    Categories
                </td>
                <td style="border: 1px black solid; text-align: center">
                    ${category}
                </td>
                <td style="width: 20px"></td>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>

            <tr>
                <td style="width: 20px"></td>
                <td style="background-color: #ed7d31; color: white; border: 1px black solid; font-weight: bold;
                    padding-left: 20px; width: 300px">
                    Passed question/total
                </td>
                <td style="border: 1px black solid; text-align: center">
                    ${passed}
                </td>
                <td style="width: 20px"></td>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>
            
            <tr>
                <td style="width: 20px"></td>
                <td style="background-color: #ed7d31; color: white; border: 1px black solid; font-weight: bold;
                    padding-left: 20px; width: 300px">
                    Timer (s)
                </td>
                <td style="border: 1px black solid; text-align: center">
                    300
                </td>
                <td style="width: 20px"></td>
            </tr>
            <tr>
                <td colspan="4"><br></td>
            </tr>

        </table>
    </body>
</html>
