package orders.bean;

import lombok.Getter;
import lombok.Setter;
import java.sql.Timestamp;

@Getter
@Setter
public class OrdersDTO {
    private int orderId;       // 주문 ID
    private String userId;     // 사용자 ID
    private int productId;     // 상품 ID (추가)
    private String productName;// 상품 이름
    private String productImage; // 상품 이미지
    private int productQty;    // 상품 개수
    private Timestamp logtime; // 주문 시간
}