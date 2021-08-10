<%-- 
    Document   : insertRice
    Created on : Mar 26, 2021, 9:23:16 PM
    Author     : Trangbmhe150464
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <script src="js/oidTextBox.js" type="text/javascript"></script>
        <script src="js/pagging.js" type="text/javascript"></script>
        <link href="css/edit.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="e1_9">
            <div class="e21_210">
                </div>
            
                <span class="e2_3">GẠO NGON TÂY HỒ</span>
                <a href="/PRJ301_Project_ManageRiceStore/home" class="e2_5">Trang chủ</a>
                <a href="/PRJ301_Project_ManageRiceStore/import" class="e2_6">Nhập khoản chi</a>
                <a href="/PRJ301_Project_ManageRiceStore/export" class="e2_7">Nhập khoản thu</a>
                <a href="/PRJ301_Project_ManageRiceStore/revenue" class="e2_8">Doanh thu theo tháng</a>
                    
        <span class="e2_12">Nhập mặt hàng mới</span>
        
        <form action="edit" method="POST">
            <span  class="e26_12">Tên</span>
            <input type="text" name="name" class="e26_8"/> 
            
            <span  class="e26_20">Khối lượng (kg)</span>
            <input type="text" name="weight" class="e26_21"/> 
            
            <input type="submit" value="Lưu mặt hàng" name="add" onclick="ResetIdBox();" class="e26_18"/> 
            
        </form>
        
        <table border="0" align="center" class="list">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Tên mặt hàng</th>
                    <th>Khối lượng</th>
                    <th></th>
                    <th></th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${rice}" var="r">
                    <tr>
                        <td>${r.rid}</td>
                        <td>${r.name}</td>
                        <td>${r.weight}</td>
                        <td><a href="delete?id=${r.id} " >Delete</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        
        <div id="botPagger" class="pagger"></div>
        <script> 
            generatePagger("botPagger",${requestScope.pageindex},${requestScope.totalpage},2,"edit");
        </script>
         </div>
    </body>
</html>
