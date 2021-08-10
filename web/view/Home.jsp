<%-- 
    Document   : Home
    Created on : Mar 21, 2021, 8:16:15 PM
    Author     : Trangbmhe150464
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/home.css" rel="stylesheet" type="text/css"/>
    </head>
    <body>
        
        <div class="e1_9">
            <div class="e21_210">
                </div>            
                <span class="e2_3">GẠO NGON TÂY HỒ</span>
                <a href="/PRJ301_Project_ManageRiceStore/import" class="e2_5">Nhập khoản chi</a>
                <a href="/PRJ301_Project_ManageRiceStore/export" class="e2_6">Nhập khoản thu</a>
                <a href="/PRJ301_Project_ManageRiceStore/edit" class="e2_7">Chỉnh sửa mặt hàng</a>
                <a href="/PRJ301_Project_ManageRiceStore/revenue" class="e2_8">Doanh thu theo tháng</a>            
        
        <span class="e2_12">Số gạo còn lại trong kho</span>
        
        <table align="center" border="1" class="a">
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="0" end="5">
                        <td align="center">${i.name}</td>
                    </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="0" end="5">
                        <td align="center" >${i.inventory}</td>
                    </c:forEach>
                </tr>
        </table>
        <br>
        <table align="center" border="1" class="b">
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="6" end="11">
                        <td align="center">${i.name}</td>
                    </c:forEach>
                    
                </tr>
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="6" end="11">
                        <td align="center">${i.inventory}</td>
                    </c:forEach>
                </tr>
        </table>
        
        
        <c:if test="${requestScope.inventory[12] != null}">
            <table align="center" border="1" class="b">
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="12" end="17">
                        <td align="center" >${i.name}</td>
                    </c:forEach>
                </tr>
                <tr>
                    <c:forEach items="${inventory}" var="i" begin="12" end="17">
                        <td align="center">${i.inventory}</td>
                    </c:forEach>
                </tr>
        </table>
        </c:if>
        
        </div>
    </body>
</html>
