<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>宿舍管理</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script type="text/javascript" src="static/js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        $(function () {                     alert( "删除")
            $(".removeRoom").click(function (){
                if (confirm("你确定要删除吗？")) {
                     alert("开始删除")
                    var $tr = $(this).parent().parent();
                    var id = $tr.find("td:eq(0)").html();
                    //alert("userCode:"+userCode)
                    $.ajax({
                        type: "GET",
                        async: true,
                        url: "/delete",
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
<form action="/list" method="post">
    <tr>
        <td>房间号：</td>
        <td>
            <input type="text" name="id" id="id">
        </td>
    </tr>
    <tr>
        <td>人数</td>
        <td><select name="size">
            <option value="-1">全部</option>
            <option value="0">2</option>
            <option value="1">4</option>
            <option value="2">8</option>
        </select></td>
        <td>
            面积
        </td>
        <td><select name="square">
            <option value="-1">全部</option>
            <option value="0">60以下</option>
            <option value="1">60-100</option>
            <option value="2">100以上</option>
        </select></td>
        <td>
            <input type="text" name="number" value="朝向"></td>
        <td>
        <td><select name="face">
            <option value="-1">全部</option>
            <option value="0">东</option>
            <option value="1">西</option>
        </select></td>
    </tr>
    <tr>
        <input type="submit" value="查询">
    </tr>
</form>
<table width="95%" border="1" cellpadding="5" cellspacing="0" align="center">
    <tr>
        <td>宿舍号：</td>
        <td>人数：</td>
        <td>面积：</td>
        <td>朝向：</td>
        <td>操作</td>
    </tr>
    <c:forEach items="${pageInfo.list}" var="room">
        <tr>
            <td>${room.id}</td>
            <td>${room.size}</td>
            <td>${room.square}</td>
            <td>${room.face}</td>
            <td>
                <a href="javascript:void(0);" class="removeRoom">删除</a>
                <a href="/toUpdate?id=${room.id}">更新</a>
            </td>
        </tr>
    </c:forEach>
    <a href="toAdd">添加</a>

</table>
<p>第${pageInfo.pageNum}页，总${pageInfo.pages}页，共${pageInfo.total}条记录&nbsp;
    <a href="/list?pageNum=1">首页</a>
    <c:if test="${pageInfo.hasPreviousPage}">
        <a href="/list?pageNum=${pageInfo.prePage}">上一页</a>
    </c:if>
    <c:if test="${pageInfo.hasNextPage}">
        <a href="/list?pageNum=${pageInfo.nextPage}">下一页</a>
    </c:if>
    <a href="/list?pageNum=${pageInfo.pages}">末页</a>
</p>


</body>
</html>