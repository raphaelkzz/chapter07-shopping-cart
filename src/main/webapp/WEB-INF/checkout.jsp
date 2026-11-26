<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<fmt:setLocale value="en_US"/>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Checkout - Shopping Cart</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/styles/main.css" type="text/css">
</head>
<body>
    <h1>Checkout</h1>
    <p>Thanks for your order.</p>
    <table border="1">
        <thead><tr><th>Quantity</th><th>Description</th><th class="right">Price</th><th class="right">Amount</th></tr></thead>
        <tbody>
            <c:forEach var="line" items="${lines}">
                <tr><td>${line.quantity}</td><td><c:out value="${line.description}"/></td>
                    <td class="right"><fmt:formatNumber value="${line.price}" type="currency" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2"/></td>
                    <td class="right"><fmt:formatNumber value="${line.amount}" type="currency" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2"/></td></tr>
            </c:forEach>
            <tr><td colspan="3" class="right"><b>Subtotal</b></td><td class="right"><fmt:formatNumber value="${subtotal}" type="currency" currencySymbol="$" minFractionDigits="2" maxFractionDigits="2"/></td></tr>
        </tbody>
    </table>
    <form action="${pageContext.request.contextPath}/cart" method="post"><input type="hidden" name="action" value="shop"><input type="submit" value="Continue Shopping"></form>
</body>
</html>
