<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US"/>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Murach's Java Servlets and JSP</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css">
</head>
<body>
    <h1>Your cart</h1>
    <table border="1">
        <thead><tr><th>Quantity</th><th>Description</th><th class="right">Price</th><th class="right">Amount</th><th>&nbsp;</th></tr></thead>
        <tbody>
            <c:forEach var="line" items="${lines}">
                <tr>
                    <td><form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="productCode" value="<c:out value='${line.code}'/>">
                        <input type="text" name="quantity" value="${line.quantity}" size="3" aria-label="Quantity for ${line.description}">
                        <input type="submit" value="Update">
                    </form></td>
                    <td><c:out value="${line.description}"/></td>
                    <td class="right"><fmt:formatNumber value="${line.price}" type="currency" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2"/></td>
                    <td class="right"><fmt:formatNumber value="${line.amount}" type="currency" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2"/></td>
                    <td><form action="${pageContext.request.contextPath}/cart" method="post">
                        <input type="hidden" name="productCode" value="<c:out value='${line.code}'/>">
                        <input type="hidden" name="quantity" value="0">
                        <input type="submit" value="Remove Item">
                    </form></td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    <p><b>To change the quantity</b>, enter the new quantity and click on the Update button.</p>
    <form action="${pageContext.request.contextPath}/cart" method="post"><input type="hidden" name="action" value="shop"><input type="submit" value="Continue Shopping"></form>
    <form action="${pageContext.request.contextPath}/cart" method="post"><input type="hidden" name="action" value="checkout"><input type="submit" value="Checkout"></form>
</body>
</html>
