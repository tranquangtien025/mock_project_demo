<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>

        <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
        <script type="text/javascript">
            function validation() {
                var currentPassword = $('#currentPassword').val();
                var newPassword = $('#newPassword').val();
                var confirmPassword = $('#confirmPassword').val();
                var error = 0;

                if (currentPassword === "") {
                    document.getElementById("currentPasswordError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("currentPasswordError").innerHTML = "";
                }
                
                if (newPassword === "") {
                    document.getElementById("newPasswordError").innerHTML = "*";
                    error += 1;
                } else if (newPassword === currentPassword) {
                    document.getElementById("newPasswordError").innerHTML = "Invalid";
                    error += 1;
                } else {
                    document.getElementById("newPasswordError").innerHTML = "";
                }

                if (confirmPassword === "") {
                    document.getElementById("confirmPasswordError").innerHTML = "*";
                    error += 1;
                } else if (confirmPassword !== newPassword) {
                    document.getElementById("confirmPasswordError").innerHTML = "Invalid";
                    error += 1;
                } else {
                    document.getElementById("confirmPasswordError").innerHTML = "";
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

        <form action="<c:url value="/member/changePassword"/>" method="post"
              onsubmit="return validation();">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
                <tr>
                    <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                        Change Password
                    </th>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td style="width: 80px"></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">User Name</td>
                    <td>
                        <input name="username" type="text" value="${username}" readonly style="background-color: #e2efda"/>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Current Password</td>
                    <td>
                        <input name="currentPassword" id="currentPassword" type="password" autofocus style="background-color: #e2efda"/>
                        <span style="color: red" id="currentPasswordError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">New Password</td>
                    <td>
                        <input name="newPassword" id="newPassword" type="password" style="background-color: #e2efda"/>
                        <span style="color: red" id="newPasswordError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Confirm Password</td>
                    <td>
                        <input name="confirmPassword" id="confirmPassword" type="password" style="background-color: #e2efda"/>
                        <span style="color: red" id="confirmPasswordError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <span style="color: #E67D21; font-weight: bold">
                            <c:if test="${message != null && message != ''}">
                                ${message}
                            </c:if>
                        </span>
                    </td>
                    <td style="text-align: left">
                        <input type="submit" value="Update Password" style="background-color: #4472c4; color: white; border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" />
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
