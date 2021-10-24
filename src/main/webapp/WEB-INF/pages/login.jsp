<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
        
        <script src="<c:url value="/resources-management/jquery/jquery.min.js"/>"></script>
        <script type="text/javascript">
            function validation() {
                var username = $('#username').val();
                var password = $('#password').val();
                var error = 0;

                if (username === "") {
                    document.getElementById("usernameError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("usernameError").innerHTML = "";
                }
                
                if (password === "") {
                    document.getElementById("passwordError").innerHTML = "*";
                    error += 1;
                } else {
                    document.getElementById("passwordError").innerHTML = "";
                }

                if (error === 0) {
                    return true;
                } else {
                    document.getElementById("message").innerHTML = "";
                    return false;
                }
            }
        </script>
    </head>
    <body>
        <!-- /login?error=true -->

        <form action="<c:url value="j_spring_security_check"/>" method="post"
              onsubmit="return validation();">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
                <tr>
                    <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                        User Login
                    </th>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td style="width: 80px"></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">User Name</td>
                    <td>
                        <input name="username" id="username" type="text" autofocus style="background-color: #e2efda"/>
                        <span style="color: red" id="usernameError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Password</td>
                    <td>
                        <input name="password" id="password" type="password" style="background-color: #e2efda"/>
                        <span style="color: red" id="passwordError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="text-align: center">
                        <span style="color: #E67D21; font-weight: bold" id="message">
                            <c:if test="${message != null && message != ''}">
                                ${message}
                            </c:if>
                        </span>                        
                    </td>
                    <td style="text-align: left">
                        <input type="submit" value="LOGIN" style="background-color: #4472c4; color: white; border-radius: 5px; padding: 10px; width: 180px; font-weight: bold" />
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
            </table>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </body>
</html>
