package vn.raphaelkzz.cart;

import java.math.BigDecimal;

public class Product {
    private final String code;
    private final String description;
    private final BigDecimal price;

    public Product(String code, String description, String price) {
        this.code = code;
        this.description = description;
        this.price = new BigDecimal(price);
    }

    public String getCode() { return code; }
    public String getDescription() { return description; }
    public BigDecimal getPrice() { return price; }
}
