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
    <script type="text/javascript">
        $(function(){
            $("#get_code").click(function(){
                var phone = $("#phone").val()
                get_code(phone)
            })
            $("#submmit_code").click(function(){
                var phone = $("#phone").val()
                var code = $("#code").val()
                console.log(phone)
                console.log(code)
                verify_code(phone,code)
            })
        })
        function get_code(phone){

            $.ajax({
                url:"${contextPath}/verify/"  + phone,
                type:"POST",
                success:function(result){
                    $("#help_block").empty()
                    if (result){
                        $("#help_block").append("请在120秒之内输入验证码")
                    }else{
                        $("#help_block").append("24小时内发送验证码过于频繁")
                    }
                    return false;
                }
            })
        }
        function verify_code(phone,code){
            $.ajax({
                url:"${contextPath}/verify/"  + phone + "/" + code,
                type:"GET",
                success:function(result){
                    alert(result)
                }
            })
        }
    </script>
</head>
<body>
<div class="container">
    <br><br>
    <div class="row">
        <form class="form-inline">
            <div class="form-group">
                <input type="text" class="form-control" id="phone" name="phone" placeholder="电话">
                <button type="button" class="btn btn-default" id="get_code">获取验证码</button>
                <br>
                <span id="help_block" style="color: red"></span>
            </div>
            <br><br>
            <div class="form-group">
                <input type="text" class="form-control" id="code" placeholder="验证码">
                <button type="button" class="btn btn-default" id="submmit_code">提交验证码</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
