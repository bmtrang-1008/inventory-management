<%-- 
    Document   : insertImportRice
    Created on : Mar 23, 2021, 1:54:58 PM
    Author     : Trangbmhe150464
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="css/insert.css" rel="stylesheet" type="text/css"/>
        <script src="js/oidTextBox.js" type="text/javascript"></script>
        
    </head>
    
    <body>
        <div class="e1_9">
            <div class="e21_210">
                </div>
            
                <span class="e2_3">GẠO NGON TÂY HỒ</span>
                <a href="/PRJ301_Project_ManageRiceStore/home" class="e2_5">Trang chủ</a>
                <a href="/PRJ301_Project_ManageRiceStore/export" class="e2_6">Nhập khoản thu</a>
                <a href="/PRJ301_Project_ManageRiceStore/edit" class="e2_7">Chỉnh sửa mặt hàng</a>
                <a href="/PRJ301_Project_ManageRiceStore/revenue" class="e2_8">Doanh thu theo tháng</a>
            
            
        
        <span class="e2_12">Nhập hóa đơn gạo</span>
        <form action="import" method="POST">            
                
            
                <span class="e2_17">ID</span>
                <input type="text" name="iid" id="oid" value="${iid}" class="e2_13"/>
            
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
                        </select></td>
                    <td><input type="text" name="quantity" class="e19_86"></td>
                    <td><input type="text" name="unitprice" class="e19_87"></td>
                </tr>
                
                </table>
            </p>
            
            <p>
                <input type="submit" value="Nhập" name="insert" onclick="ContinueId();" class="e2_26"/> 
                <input type="submit" value="Nhập hóa đơn mới" name="insert" onclick="ResetIdBox();" class="e2_27"/> 
            </p>
            
        </form>

            <br>
            <c:if test="${ibill != null}">
                <table class="bill" border="1" align="center">
                <tr>
                    <td align="center">ID</td>
                    <td align="center">Tên gạo</td>
                    <td align="center" >Khối lượng</td>
                    <td align="center" >Số lượng (bao)</td>
                    <td align="center" >Đơn vị giá (VNĐ)</td>
                    <td align="center" >Thành tiền (VNĐ)</td>
                    <td align="center" >Thời gian</td>
                </tr>
                <c:forEach items="${ibill}" var="i">
                <tr>
                    <td align="center" >${i.riceid}</td>
                    <td align="center" >${i.name}</td>
                    <td align="center" >${i.weight}</td>
                    <td align="center">${i.quantity}</td>
                    <td align="center">${i.unitprice}</td>
                    <td align="center">${i.price}</td>
                    <td align="center">${i.date}</td>
                    
                </tr>
                </c:forEach>
            </table>
            </c:if>
        </div>
    </body>
</html>
