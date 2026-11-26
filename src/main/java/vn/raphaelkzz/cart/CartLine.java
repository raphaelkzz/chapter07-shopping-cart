package vn.raphaelkzz.cart;

import java.math.BigDecimal;

public class CartLine {
    private final Product product;
    private final int quantity;

    public CartLine(Product product, int quantity) {
        this.product = product;
        this.quantity = quantity;
    }

    public String getCode() { return product.getCode(); }
    public String getDescription() { return product.getDescription(); }
    public BigDecimal getPrice() { return product.getPrice(); }
    public int getQuantity() { return quantity; }
    public BigDecimal getAmount() { return product.getPrice().multiply(BigDecimal.valueOf(quantity)); }
}
