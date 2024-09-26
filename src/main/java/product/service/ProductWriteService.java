package product.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductWriteService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        //실제 파일이 저장될 경로 설정
        String realFolder = request.getServletContext().getRealPath("/storage");

        //파일 업로드 처리
        MultipartRequest multi = new MultipartRequest(
                request,
                realFolder,  // 실제 저장 경로
                20 * 1024 * 1024,  // 파일 크기 제한 (5MB)
                "UTF-8",
                new DefaultFileRenamePolicy()  // 파일명이 중복될 경우 자동으로 이름 변경
        );

        //폼 데이터 처리
        String productName = multi.getParameter("productName");
        int productPrice = Integer.parseInt(multi.getParameter("productPrice"));
        int productQty = Integer.parseInt(multi.getParameter("productQty"));
        String ctg = multi.getParameter("ctg");
        String productDescription = multi.getParameter("productDescription");
        String productImage = multi.getFilesystemName("productImage");  //실제 업로드된 파일명

        // DTO에 데이터 설정
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductName(productName);
        productDTO.setProductPrice(productPrice);
        productDTO.setProductQty(productQty);
        productDTO.setCtg(ctg);
        productDTO.setProductDescription(productDescription);

        //이미지 경로 저장 (DB에는 storage/ 경로를 포함한 파일명 저장)
        if (productImage != null) {
        	String imagePath = "/storage/" + productImage;
            productDTO.setProductImage(imagePath);  // DB에 저장될 이미지 경로 설정
        }

        //DB에 저장
        ProductDAO productDAO = ProductDAO.getInstance();
        productDAO.insertProduct(productDTO);

        //등록 완료 후 전체 상품 목록 페이지로 리다이렉트
        return "/manager/productWrite.jsp";
    }
}
