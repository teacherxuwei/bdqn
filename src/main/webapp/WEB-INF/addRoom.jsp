<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="input" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宿舍编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="../../resources/js/jquery-1.12.4.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".removeName").click(function () {
                if (confirm("你确定要删除吗？")) {
                    // alert("开始删除")
                    var $tr = $(this).parent().parent();
                    var id = $tr.find("td:eq(0)").html();
                    //alert("userCode:"+userCode)
                    $.ajax({
                        type: "GET",
                        async: true,
                        url: "/deleteUser",
                        data: {"id": id},
                        dataType: "json",
                        success: function (data) {
                            if (data.result == "success") {
                                alert("删除成功！")
                                $tr.remove();
                            } else {
                                alert("删除失败！")
                            }
                        }
                    })
                }
            })
        })
    </script>
</head>
<body>
<form action="/add" method="post">
    <div align="center">
        <tr>
            <td>宿舍信息：<input type="text" name="number" value="${room.number}"></td>
            &nbsp;

            <td>最大人数：<input type="text" name="size" value="${room.size}"></td>
        </tr>

        <div>
            <td>人员：</td>
            <c:forEach items="${list}" var="user" varStatus="index">
            <tr>

                <td hidden><input type="text" name="id" value="${user.id}"></td>
                <td>
                    <input type="text" name="userName" value="${user.name}">
                    <input type="submit" value="-" class="removeName"></td>&nbsp;

                    <%--<c:if test="${index.last==false}">--%>
                    <%--,--%>
                    <%--</c:if></tr>--%>
                </c:forEach>
                <input type="submit" value="+" class="removeName">
        </div>
        <td>面积：<input type="text" name="name" value="${room.square}"></td>
        </tr>
        <tr>
            <td>朝向：<input type="text" name="name" id="name" value="${room.face}"></td>
        </tr>
    </div>
    <input type="submit" value="提交" >
</form>
</body>
</html>