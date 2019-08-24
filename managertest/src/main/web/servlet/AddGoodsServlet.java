package main.web.servlet;

import main.domain.Goods;
import main.service.GoodsService;
import main.service.impl.GoodsServiceImmpl;
import main.util.UUIdUtils;
import org.apache.commons.beanutils.BeanUtils;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.util.List;
import java.util.Map;

@WebServlet("/addGoodsServlet")
public class AddGoodsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        Map<String, String[]> map = request.getParameterMap();
        Goods good = new Goods();
        try {
            BeanUtils.populate(good, map);
            // 配置上传参数
            DiskFileItemFactory factory = new DiskFileItemFactory();
            ServletFileUpload upload = new ServletFileUpload(factory);
            // 解析请求的内容提取文件数据
            @SuppressWarnings("unchecked")
            List<FileItem> formItems = upload.parseRequest(request);
            // 迭代表单数据
            for (FileItem item : formItems) {
                // 处理不在表单中的字段
                if (!item.isFormField()) {
                    String fileName = item.getName();
                    //定义上传文件的存放路径
                    String path = "C:/ideaProject/shoptest/src/main/webapp/img";
                    //定义上传文件的完整路径
                    String filePath = String.format("%s/%s",path,fileName);
                    File storeFile = new File(filePath);
                    //保证商品图片的唯一性
                    String uuid= UUIdUtils.getUUid();
                    filePath+="?";
                    filePath+=uuid;
                    good.setPicture(filePath);
                    // 在控制台输出文件的上传路径
                    System.out.println(filePath);
                    // 保存文件到硬盘
                    item.write(storeFile);
                }
            }
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InvocationTargetException e) {
            e.printStackTrace();
        } catch (FileUploadException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(good.toString());
        //调用Service保存
        GoodsService service = new GoodsServiceImmpl();
        service.addGoods(good);
        //跳转到foodListServlet中
        response.sendRedirect("/managertest/findGoodsByPageServlet");
    }
        protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request,response);
    }
}
