<%@ page import="java.util.List" %>
<%@ page import="page.Page" %>
<%@ page import="entity.Student" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>

    <%-- 引入JQ和Bootstrap --%>
        <link href="bootstrap.min.css" rel="stylesheet">
    <script src="jquery.min.js"></script>

    <script src="bootstrap.min.js"></script>
    <link href="style.css" rel="stylesheet">

    <title>学生管理页面 - 首页</title>

    <script>
        $(function () {
            $("ul.pagination li.disabled a").click(function () {
                return false;
            });
        });
    </script>
</head>

<body>
<%
    Page pages=(Page)request.getAttribute("page");
    List<Student> student=(List<Student>) request.getAttribute("students");
%>
<div class="listDIV">
    <table class="table table-striped table-bordered table-hover table-condensed">
        <caption>学生列表 - 共<%=pages.getTotal()%>人</caption>
        <thead>
        <tr class="success">
            <th>学号</th>
            <th>姓名</th>
            <th>年龄</th>
            <th>性别</th>
            <th>出生日期</th>

            <th>编辑</th>
            <th>删除</th>
        </tr>
        </thead>

        <tbody>
        <%
            int index=-1;
        %>
        <c:forEach items="<%=student%>" var="s" varStatus="status">
            <%
                index+=1;
            %>
            <tr>
                <td><%=student.get(index).getStudent_id()%></td>
                <td><%=student.get(index).getName()%></td>
                <td><%=student.get(index).getAge()%></td>
                <td><%=student.get(index).getSex()%></td>
                <td><%=student.get(index).getBirthday()%></td>

                <td><a href="<%=request.getContextPath()%>/editStudent?id=<%=student.get(index).getId()%>"><span class="glyphicon glyphicon-edit"></span> </a></td>
                <td><a href="<%=request.getContextPath()%>/deleteStudent?id=<%=student.get(index).getId()%>"><span class="glyphicon glyphicon-trash"></span> </a></td>
            </tr>
        </c:forEach>

        </tbody>
    </table>
</div>
<%
    boolean flag=pages.isHasPreviouse();
%>
<nav class="pageDIV">
    <ul class="pagination">
        <li <c:if test="<%=!flag%>">class="disabled"</c:if>>
            <a href="?page.start=0">
                <span>«</span>
            </a>
        </li>

        <li <c:if test="<%=!flag%>">class="disabled"</c:if>>
            <a href="?page.start=<%=pages.getStart()-pages.getCount()%>">
                <span>‹</span>
            </a>
        </li>
        <%
            int count=pages.getCount();int start=pages.getStart();
            for(int i=0;i<pages.getTotal();i++){
                if((i+1)*count-start<=30 && (i+1)*count-start>=-10){
                    if((i+1)*count==start){
        %>
        <a href="?page.start=<%=(i+1)*count%>"
           <%
               if((i+1)*count==start){
                   %>class="current"
                <% }
                %> ><%=i+1%></a>
        <%} } }%>

        <%
            boolean flag1=pages.isHasNext();
        %>

        <li <c:if test="<%=!flag1%>">class="disabled"</c:if>>
            <a href="?page.start=<%=pages.getStart()+pages.getCount()%>">
                <span>›</span>
            </a>
        </li>
        <li <c:if test="<%=!flag1%>">class="disabled"</c:if>>
            <a href="?page.start=<%=pages.getLast()%>">
                <span>»</span>
            </a>
        </li>
    </ul>
</nav>
<div class="addDIV">
    <div class="panel panel-success">
        <div class="panel-heading">
            <h3 class="panel-title">增加学生</h3>
        </div>
        <div class="panel-body">

            <form method="post" action="<%=request.getContextPath()%>/addStudent" role="form">
                <table class="addTable">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="studentID" id="studentID" placeholder="请在这里输入学号"></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name" id="name" placeholder="请在这里输入名字"></td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age" id="age" placeholder="请在这里输入年龄"></td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><input type="radio" class="radio radio-inline" name="radio" value="男"> 男
                            <input type="radio" class="radio radio-inline" name="radio" value="女"> 女
                        </td>
                    </tr>
                    <tr>
                        <td>出生日期：</td>
                        <td><input type="date" name="birthday" id="birthday" placeholder="请在这里输入出生日期"></td>
                    </tr>
                    <tr class="submitTR">
                        <td colspan="2" align="center">
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
