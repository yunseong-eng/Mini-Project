package product.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ProductListPaging {
    private int currentPage;    //현재 페이지 번호
    private int pageBlock;      //한 번에 보여줄 페이지 블록 개수
    private int pageSize;       //한 페이지에 보여줄 상품 수
    private int totalA;         //총 상품 수
    private StringBuffer pagingHTML; //페이지 HTML을 저장하는 변수

    public void makePagingHTML() {
        pagingHTML = new StringBuffer();

        //총 페이지 수 계산
        int totalP = (totalA + pageSize - 1) / pageSize;

        //시작 페이지와 끝 페이지 계산
        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1;
        int endPage = startPage + pageBlock - 1;
        if (endPage > totalP) endPage = totalP;

        //[이전] 버튼 생성
        if (startPage > 1) {
            pagingHTML.append("<span id='paging' onclick='productPaging(").append(startPage - 1).append(")'>이전</span>");
        }

        //각 페이지 번호 생성
        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pagingHTML.append("<span id='currentPaging' onclick='productPaging(").append(i).append(")'>").append(i).append("</span>");
            } else {
                pagingHTML.append("<span id='paging' onclick='productPaging(").append(i).append(")'>").append(i).append("</span>");
            }
        }

        //[다음] 버튼 생성
        if (endPage < totalP) {
            pagingHTML.append("<span id='paging' onclick='productPaging(").append(endPage + 1).append(")'>다음</span>");
        }
    }
}
