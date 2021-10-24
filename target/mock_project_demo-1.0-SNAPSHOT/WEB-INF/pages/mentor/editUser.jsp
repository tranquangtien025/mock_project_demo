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
                    return false;
                }
            }
        </script>
    </head>
    <body>

        <form action="<c:url value="/mentor/userResult"/>" method="post"
              modelAttribute="user"
              onsubmit="return validation();">
            <table style="margin: auto; border-collapse: collapse; border: 1px black solid; width: 500px;">
                <tr>
                    <th colspan="4" style="text-align: center; border: 1px black solid; background-color: #ed7d31; color: white">
                        User
                    </th>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>

                <c:if test="${action == 'edit'}">
                    <tr>
                        <td style="width: 80px"></td>
                        <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">ID</td>
                        <td>
                            <input name="id" type="text" value="${user.id}" readonly style="background-color: #e2efda"/>
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="4"><br></td>
                    </tr>
                </c:if>

                <c:if test="${action == 'add'}">
                    <input name="id" type="text" value="${user.id}" hidden style="background-color: #e2efda"/>
                </c:if>

                <tr>
                    <td style="width: 80px"></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Name</td>
                    <td>
                        <input name="username" id="username" type="text" value="${user.username}" autofocus style="background-color: #e2efda"/>
                        <span style="color: red" id="usernameError"></span>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Role</td>
                    <td>
                        <% boolean exist = false; %>
                        <select name="listUserRoleId" style="background-color: #e2efda; width: 177px" multiple>
                            <c:forEach var="userRole" items="${userRoles}">
                                <c:forEach var="selectedRole" items="${userService.getListRoleIdOfUser(user.id)}">                                                                    
                                    <c:if test="${selectedRole == userRole.id}">
                                        <% exist = true; %>
                                    </c:if>
                                </c:forEach>       
                                <% if (exist == true) {%>
                                <option value="${userRole.id}" selected>${userRole.role}</option>
                                <% } %>
                                <% if (exist == false) {%>
                                <option value="${userRole.id}">${userRole.role}</option>
                                <%}%>
                                <% exist = false;%>
                            </c:forEach>
                        </select>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td colspan="4"><br></td>
                </tr>
                
                <c:if test="${action == 'add'}">
                <tr>
                    <td></td>
                    <td style="border: 1px black solid; background-color: #ed7d31; color: white; font-weight: bold">Password</td>
                    <td>
                        <input name="password" id="password" type="text" value="${user.password}" style="background-color: #e2efda"/>
                        <span style="color: red" id="passwordError"></span>
                    </td>
                    <td></td>
                </tr>
                </c:if>
                <c:if test="${action == 'edit'}">
                    <input name="password" id="password" type="text" value="${user.password}" hidden style="background-color: #e2efda"/>
                </c:if>
                
                <tr>
                    <td colspan="4"><br></td>
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
