package product.bean;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductDTO {
	private String ctg;
    private int product_id;
    private String product_name;
    private int product_price;
    private int product_qty, hit, reply;
    private String product_image;
    private String product_description;
    private Date logtime;
}
