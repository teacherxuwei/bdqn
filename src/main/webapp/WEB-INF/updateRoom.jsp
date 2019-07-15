<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>宿舍信息</title>
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

        var i = 1;
        $(function () {
            $("#box").on('click', '.addp', function () {
                //$('#pp').after($("#pp").clone());
                var addP = $(this).parent().clone();
                $(this).parent().after(addP);
                $('#pp a').each(function (i, e) {
                    $(e).text(i + 1);
                })
            });
            $("#box").on("click", '.delp', function () {
                $(this).parent().remove();
                $('#pp a').each(function (i, e) {
                    $(e).text(i + 1);
                })
            })
        });
    </script>
</head>
<body>
<div align="center">
    <tr>
        <td>宿舍信息：${room.id}</td>
        &nbsp;

        <td>最大人数：${room.size}</td>
    </tr>

    <div>
        <td>人员：</td>
        <c:forEach items="${list}" var="user" varStatus="index">
        <tr>
            <td ><input hidden type="text" name="id" value="${user.id}"></td>
            <td>
                <input type="text" name="userName" value="${user.name}">
                <input type="submit" value="-" class="removeName"></td>&nbsp;
                <%--<c:if test="${index.last==false}">--%>
                <%--,--%>
                <%--</c:if></tr>--%>
            </c:forEach>
            <input type="submit" value="+" class="addName"></tr>
        <%--<input type="submit" value="+" class="addName">--%>
    </div>
    <div id="box">
        <p id="pp"><a>1</a>
            <input type="text" name="gx">
            <button class='delp'>-</button>
        </p>
    </div>

    <td>面积：${room.square}</td>
    <td>平方米</td>
    <%--<input type="text" name="face" value="${room.square}">--%>
    <tr>
        <td>朝向：${room.face}</td>

    </tr>
    <%--<a href="roomManagement/editor?empId=${room.id}">修改</a></div>--%>
</body>
</html>