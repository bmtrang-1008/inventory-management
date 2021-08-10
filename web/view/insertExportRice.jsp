<%-- 
    Document   : insertExportRice
    Created on : Mar 23, 2021, 1:55:14 PM
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
        <link href="css/insert.css" rel="stylesheet" type="text/css"/>
        
    </head>
    <body>
        <div class="e1_9">
            <div class="e21_210">
                </div>
            
                <span class="e2_3">GẠO NGON TÂY HỒ</span>
                <a href="/PRJ301_Project_ManageRiceStore/home" class="e2_5">Trang chủ</a>
                <a href="/PRJ301_Project_ManageRiceStore/import" class="e2_6">Nhập khoản chi</a>
                <a href="/PRJ301_Project_ManageRiceStore/edit" class="e2_7">Chỉnh sửa mặt hàng</a>
                <a href="/PRJ301_Project_ManageRiceStore/revenue" class="e2_8">Doanh thu theo tháng</a>
            
            
        
        <span class="e2_12">Nhập hóa đơn xuất gạo</span>
        
        
        <form action="export" method="POST">
            
            <span class="e2_17">ID</span> 
            <input type="text" name="eid" id="oid" value="${eid}" class="e2_13"/>
            <table>
                <tr>
                    <td text-align="center" class="e2_21">Tên gạo</td>
                    <td text-align="center" class="e2_22">Số lượng (bao)</td>
                    <td text-align="center" class="e2_23">Đơn vị giá (VNĐ)</td>
                </tr>
                <tr>
                    <td>
                        <select name="ricename" class="e19_84">
                        <c:forEach items="${requestScope.rice}" var="r">
                            <option value="${r.id}"> ${r.name} </option>
                        </c:forEach>
                        </select>
                    </td>
                    <td><input type="text" name="quantity" class="e19_86">></td>
                    <td><input type="text" name="unitprice" class="e19_87"></td>
                </tr>
                
            </table>
            <input type="submit" value="Nhập" name="insert" onclick="ContinueId();" class="e2_26"/> 
            <input type="submit" value="Nhập hóa đơn mới" name="insert" onclick="ResetIdBox();" class="e2_27"/> 
            
        </form>
            
            <br>
            <c:if test="${ebill != null}">
                <table class="bill" border="1" align="center">
                <tr>
                    <td align="center" >ID</td>
                    <td align="center" >Tên gạo</td>
                    <td align="center" >Khối lượng</td>
                    <td align="center" >Số lượng (bao)</td>
                    <td align="center" >Đơn vị giá (VNĐ)</td>
                    <td align="center" >Thành tiền (VNĐ)</td>
                    <td align="center" >Thời gian</td>
                </tr>
                <c:forEach items="${ebill}" var="e">
                <tr>
                    <td align="center" >${e.riceid}</td>
                    <td align="center" >${e.name}</td>
                    <td align="center" >${e.weight}</td>
                    <td align="center" >${e.quantity}</td>
                    <td align="center" >${e.unitprice}</td>
                    <td align="center" >${e.price}</td>
                    <td align="center" >${e.date}</td>
                    
                </tr>
                </c:forEach>
            </table>
            </c:if>
            </div>
    </body>
</html>
