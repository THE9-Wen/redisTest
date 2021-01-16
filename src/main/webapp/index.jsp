<%--
  Created by IntelliJ IDEA.
  User: 85477
  Date: 2021/1/16
  Time: 18:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>验证码</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <%
        String contextPath = request.getContextPath();
        request.setAttribute("contextPath",contextPath);
    %>
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <script src="${contextPath}/statics/js/jquery-3.5.1.js" type="text/javascript"></script>
    <!-- Bootstrap -->
    <link href="${contextPath}/statics/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${contextPath}/statics/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container">
    <br><br>
    <div class="row">
        <form class="form-inline" action="verify" method="post">
            <div class="form-group">
                <input type="text" class="form-control" id="phone" placeholder="电话">
                <button class="btn btn-default">获取验证码</button>
            </div>
            <br><br>
            <div class="form-group">
                <input type="text" class="form-control" id="code" placeholder="验证码">
                <button type="submit" class="btn btn-default">提交验证码</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
