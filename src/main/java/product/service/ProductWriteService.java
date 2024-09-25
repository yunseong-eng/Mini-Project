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
        // 파일이 업로드될 실제 폴더 경로 설정
        String realFolder = request.getServletContext().getRealPath("/storage");

        // 파일 업로드 처리
        MultipartRequest multi = new MultipartRequest(
                request,
                realFolder,
                5 * 1024 * 1024, // 5MB 제한
                "UTF-8",
                new DefaultFileRenamePolicy() // 파일명이 중복되면 자동으로 이름이 변경됨
        );
        
        // 폼 데이터 처리
        String productName = multi.getParameter("productName");
        int productPrice = Integer.parseInt(multi.getParameter("productPrice"));
        int productQty = Integer.parseInt(multi.getParameter("productQty"));
        String ctg = multi.getParameter("ctg");
        String productDescription = multi.getParameter("productDescription");
        String productImage = multi.getFilesystemName("productImage"); // 실제 저장된 파일명

        // DTO 생성 및 데이터 저장
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductName(productName);
        productDTO.setProductPrice(productPrice);
        productDTO.setProductQty(productQty);
        productDTO.setCtg(ctg);
        productDTO.setProductDescription(productDescription);
        productDTO.setProductImage("storage/" + productImage); // 가상 경로로 설정된 이미지 경로
        
        // DB에 저장
        ProductDAO productDAO = ProductDAO.getInstance();
        productDAO.insertProduct(productDTO);

        // 등록 완료 후 페이지로 이동
        return "/product/productWrite.jsp";
    }
}
