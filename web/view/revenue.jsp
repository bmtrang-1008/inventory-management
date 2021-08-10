<%-- 
    Document   : revenue
    Created on : Mar 29, 2021, 5:35:00 PM
    Author     : Trangbmhe150464
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/revenue.css" rel="stylesheet" type="text/css"/>
        <title>JSP Page</title>
        
    </head>
    <body>
        <div class="e1_9">
            <div class="e21_210">
                </div>
            
                <span class="e2_3">GẠO NGON TÂY HỒ</span>
                <a href="/PRJ301_Project_ManageRiceStore/home" class="e2_5">Trang chủ</a>
                <a href="/PRJ301_Project_ManageRiceStore/import" class="e2_6">Nhập khoản chi</a>
                <a href="/PRJ301_Project_ManageRiceStore/export" class="e2_7">Nhập khoản thu</a>
                <a href="/PRJ301_Project_ManageRiceStore/edit" class="e2_8">Chỉnh sửa mặt hàng</a>
                    
        <span class="e2_12">Doanh thu theo tháng</span>
        
        <c:if test="${requestScope.ip != null || requestScope.ep != null}">
            
            <table border="1" align="center" width="80%" class="r">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tổng số tiền chi</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ip}" var="i">
                        <tr>
                            <td align="center">${i.id}</td>
                            <td align="center">${i.price}</td>
                            <td align="center">${i.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
                
                
            <table border="1" align="center" width="80%" class="r">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Tổng số tiền thu</th>
                        <th>Thời gian</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${ep}" var="e">
                        <tr>
                            <td align="center">${e.id}</td>
                            <td align="center">${e.price}</td>
                            <td align="center">${e.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
                        
            <div class="foot">Tổng doanh thu tháng: ${requestScope.revenue} VNĐ</div>
        </c:if>
            </div>
    </body>
</html>
