package product.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
    private int productId;
    private String productName;
    private int productPrice;
    private int productQty;
    private String productImage;
    private String productDescription;
    private String ctg;
}
