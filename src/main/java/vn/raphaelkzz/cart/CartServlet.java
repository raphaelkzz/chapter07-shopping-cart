package vn.raphaelkzz.cart;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class CartServlet extends HttpServlet {
    private static final Map<String, Product> PRODUCTS = Map.of(
            "8601", new Product("8601", "86 (the band) - True Life Songs and Pictures", "14.95"),
            "pf01", new Product("pf01", "Paddlefoot - The first CD", "12.95"),
            "pf02", new Product("pf02", "Paddlefoot - The second CD", "14.95"),
            "jr01", new Product("jr01", "Joe Rut - Genuine Wood Grained Finish", "14.95")
    );

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        showCart(request, response, getCart(request.getSession()));
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        Map<String, Integer> cart = getCart(request.getSession());
        String action = request.getParameter("action");

        if ("shop".equals(action)) {
            response.sendRedirect(request.getContextPath() + "/");
            return;
        }
        if ("checkout".equals(action)) {
            showPage(request, response, cart, "/WEB-INF/checkout.jsp");
            return;
        }
        if (action != null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST);
            return;
        }

        String code = request.getParameter("productCode");
        if (code == null || !PRODUCTS.containsKey(code)) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Unknown product.");
            return;
        }
        String quantityText = request.getParameter("quantity");
        int quantity;
        try {
            quantity = quantityText == null ? 1 : Integer.parseInt(quantityText);
        } catch (NumberFormatException exception) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid quantity.");
            return;
        }
        if (quantity < 0 || quantity > 99) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Quantity must be between 0 and 99.");
            return;
        }
        if (quantity == 0) {
            cart.remove(code);
        } else {
            cart.put(code, quantity);
        }
        showCart(request, response, cart);
    }

    @SuppressWarnings("unchecked")
    private Map<String, Integer> getCart(HttpSession session) {
        Map<String, Integer> cart = (Map<String, Integer>) session.getAttribute("cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
            session.setAttribute("cart", cart);
        }
        return cart;
    }

    private void showCart(HttpServletRequest request, HttpServletResponse response,
                          Map<String, Integer> cart) throws ServletException, IOException {
        showPage(request, response, cart, "/WEB-INF/cart.jsp");
    }

    private void showPage(HttpServletRequest request, HttpServletResponse response,
                          Map<String, Integer> cart, String page) throws ServletException, IOException {
        List<CartLine> lines = new ArrayList<>();
        BigDecimal subtotal = BigDecimal.ZERO;
        for (Map.Entry<String, Integer> entry : cart.entrySet()) {
            CartLine line = new CartLine(PRODUCTS.get(entry.getKey()), entry.getValue());
            lines.add(line);
            subtotal = subtotal.add(line.getAmount());
        }
        request.setAttribute("lines", lines);
        request.setAttribute("subtotal", subtotal);
        request.getRequestDispatcher(page).forward(request, response);
    }
}
