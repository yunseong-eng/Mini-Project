package product.bean;

import lombok.Getter;
import lombok.Setter;
import java.util.Date;

@Getter
@Setter
public class ProductDTO {
    private int productId;
    private String ctg;
    private String productName;
    private int productPrice;
    private int productQty;
    private String productImage;
    private String productDescription;
    private int hit;             // 조회수
    private int reply;           // 후기 수
    private Date logtime;        // 등록 날짜
}
