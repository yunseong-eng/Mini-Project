package product.service;

import java.nio.file.Paths;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.nio.file.Paths;  

import com.control.CommandProcess;
import product.bean.ProductDTO;
import product.dao.ProductDAO;

public class ProductModifySubmitService implements CommandProcess {

    @Override
    public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
        //텍스트 데이터는 getParameter로 가져오기
        String productIdStr = request.getParameter("productId");
        String productName = request.getParameter("productName");
        String productPriceStr = request.getParameter("productPrice");
        String productQtyStr = request.getParameter("productQty");
        String ctg = request.getParameter("ctg");
        String productDescription = request.getParameter("productDescription");

        //파일 데이터는 getPart로 가져오기
        Part productImagePart = request.getPart("productImage");
        String productImage = null;

        if (productImagePart != null && productImagePart.getSize() > 0) {
            //새로운 이미지 파일이 전송된 경우 처리
            String fileName = Paths.get(productImagePart.getSubmittedFileName()).getFileName().toString();
            productImage = "/storage/" + fileName;
            productImagePart.write(request.getServletContext().getRealPath("/storage") + "/" + fileName);  //파일 저장
        } else {
            //새로운 이미지가 없으면 기존 이미지를 유지
            ProductDAO productDAO = ProductDAO.getInstance();
            ProductDTO existingProduct = productDAO.getProductById(Integer.parseInt(productIdStr));
            productImage = existingProduct.getProductImage();  // 기존 이미지 경로 유지
        }

        //DTO에 수정된 상품 정보 설정
        ProductDTO productDTO = new ProductDTO();
        productDTO.setProductId(Integer.parseInt(productIdStr));
        productDTO.setProductName(productName);
        productDTO.setProductPrice(Integer.parseInt(productPriceStr));
        productDTO.setProductQty(Integer.parseInt(productQtyStr));
        productDTO.setCtg(ctg);
        productDTO.setProductDescription(productDescription);
        productDTO.setProductImage(productImage);

        //DB에 상품 정보 업데이트
        ProductDAO productDAO = ProductDAO.getInstance();
        productDAO.updateProduct(productDTO);

        //수정 완료 후 목록 페이지로 리다이렉트
        return "/manager/productListForm.do";
    }
}
