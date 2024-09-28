package com.control;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
    urlPatterns = {"*.do"},
    initParams = {
        @WebInitParam(name = "propertyConfig", value = "command.properties")
    }
)
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 1,  // 1MB
	    maxFileSize = 1024 * 1024 * 10,       // 10MB
	    maxRequestSize = 1024 * 1024 * 50     // 50MB
	)
public class ControlServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private Map<String, Object> map = new HashMap<String, Object>();

    @Override
    public void init(ServletConfig config) throws ServletException {
        String propertyConfig = config.getInitParameter("propertyConfig");
        System.out.println("propertyConfig = " + propertyConfig);
        String realFolder = config.getServletContext().getRealPath("/WEB-INF");
        String realPath = realFolder + "/" + propertyConfig;
        System.out.println("realPath = " + realPath);

        FileInputStream fin = null;
        Properties properties = new Properties();

        try {
            fin = new FileInputStream(realPath);
            properties.load(fin);
            System.out.println("properties = "+properties);
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            try {
                if (fin != null) fin.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
            
        }
        System.out.println();

        Iterator<Object> it = properties.keySet().iterator();
        while (it.hasNext()) {
            String key = (String) it.next();
            System.out.println("key = " + key);
            String className = properties.getProperty(key);
            System.out.println("className = "+ className);
            try {
                Class<?> classType = Class.forName(className);
                Object ob = classType.getConstructor().newInstance();
                
                System.out.println("ob = "+ob);
                
                map.put(key, ob);
            } catch (Exception e) {
                e.printStackTrace();
             
                System.out.println();    
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        execute(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        execute(request, response);
    }

    protected void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getMethod().equals("POST")) request.setCharacterEncoding("UTF-8");

        String category = request.getServletPath();
        System.out.println("요청된 경로: " + category);
        
        if (category.equals("/review/writeReview.do")) {
            System.out.println("리뷰 작성 요청이 들어왔습니다.");
        }
        
        CommandProcess com = (CommandProcess) map.get(category);
        if (com != null) {
            System.out.println("매핑된 Command 클래스: " + com.getClass().getName());
        } else {
            System.out.println("매핑된 Command가 없습니다. 경로를 확인하세요: " + category);
        }

        String view = null;
        try {
            view = com.requestPro(request, response);
            System.out.println("view : " + view);
        } catch (Throwable e) {
            e.printStackTrace();
        }
      
        if (view != null && !view.equals("none")) {
            RequestDispatcher dispatcher = request.getRequestDispatcher(view);
            dispatcher.forward(request, response);
        }
    }
}
