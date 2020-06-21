<%@ page import="Util.Page" %>
<%@ page import="pojo.Student" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
    <script src="jquery.min.js"></script>
    <link href="bootstrap.min.css" rel="stylesheet">
    <script src="bootstrap.min.js"></script>
    <link href="style.css" rel="stylesheet">

    <title>学生管理页面 - 编辑页面</title>
</head>

<body>

<div class="editDIV">

    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">编辑学生</h3>
        </div>
        <div class="panel-body">
            <%
                Student student=(Student)request.getAttribute("student");
            %>
            <form method="get" action="<%=request.getContextPath()%>/updateStudent" role="form">
                <table class="editTable">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="studentID" id="studentID" value="<%=student.getStudentID()%>"
                                   placeholder="请在这里输入学号"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name" value="<%=student.getName()%>" placeholder="请在这里输入名字">
                        </td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age" id="age" value="<%=student.getAge()%>" placeholder="请在这里输入年龄"></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <%
                            request.setCharacterEncoding("utf-8");
                            response.setContentType("html/text;charset=utf-8");
                            if(student.getSex().equals("男")){
                                %>
                        <td><input type="radio" class="radio radio-inline" name="radio" value="男" checked> 男
                            <input type="radio" class="radio radio-inline" name="radio" value="女"> 女
                        </td>
                        <%
                            }else {%>
                        <td><input type="radio" class="radio radio-inline" name="radio" value="男"> 男
                            <input type="radio" class="radio radio-inline" name="radio" value="女" checked> 女
                        </td>
                        <%
                            }
                        %>


                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td><input type="date" name="birthday" id="birthday" value="<%=student.getBirthday()%>"
                                   placeholder="请在这里输入出生日期"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
                            <input type="hidden" name="id" value="<%=student.getId()%>">
                            <button type="submit" class="btn btn-success">提 交</button>
                        </td>

                    </tr>

                </table>
            </form>
        </div>
    </div>

</div>

</body>
</html>