package user.bean;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class UserListPaging {
    private int currentPage;    // 현재 페이지 번호
    private int pageBlock;      // 한 번에 보여줄 페이지 블록 개수
    private int pageSize;       // 한 페이지에 보여줄 항목 수
    private int totalA;         // 총 회원 수
    private StringBuffer pagingHTML; // 페이지 HTML 저장

    public void makePagingHTML() {
        pagingHTML = new StringBuffer();

        int totalP = (totalA + pageSize - 1) / pageSize; // 총 페이지 수 계산

        int startPage = (currentPage - 1) / pageBlock * pageBlock + 1; // 시작 페이지 계산
        int endPage = startPage + pageBlock - 1;  // 끝 페이지 계산
        if (endPage > totalP) endPage = totalP;  // 끝 페이지가 총 페이지 수를 초과할 경우 조정

        // 이전 버튼
        if (currentPage > 1) {
            pagingHTML.append("<span class='paging' data-page='").append(currentPage - 1).append("'>이전</span>");
        }

        // 페이지 번호
        for (int i = startPage; i <= endPage; i++) {
            if (i == currentPage) {
                pagingHTML.append("<span id='currentPaging' data-page='").append(i).append("'>").append(i).append("</span>");
            } else {
                pagingHTML.append("<span class='paging' data-page='").append(i).append("'>").append(i).append("</span>");
            }
        }

        // 다음 버튼
        if (currentPage < totalP) {
            pagingHTML.append("<span class='paging' data-page='").append(currentPage + 1).append("'>다음</span>");
        }
    }
}
