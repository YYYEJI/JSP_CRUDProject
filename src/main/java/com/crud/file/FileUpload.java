package com.crud.file;

import com.crud.bean.BoardVO;
import com.crud.common.JDBCUtil;
import com.crud.dao.BoardDAO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class FileUpload {

    public BoardVO uploadPhoto (HttpServletRequest request){
        String filename = "";
        int sizeLimit = 15*1024*1024;

        String realPath = request.getServletContext().getRealPath("upload");
        System.out.println("start uploadphoto");
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;

        try{
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");

            one = new BoardVO();
            String sid = multipartRequest.getParameter("seq");
            System.out.println("sid : "+sid);
            if(sid!=null && !sid.equals("")) one.setSeq(Integer.parseInt(sid));
            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setPhoto(multipartRequest.getFilesystemName("photo"));

//            File f = new File(realPath+"/"+one.getPhoto());

//            try{
//                if(f.createNewFile()){
//                    System.out.println("File created");
//                }
//                else {
//                    System.out.println("File already exists");
//                }
//            }catch(Exception e){
//                e.printStackTrace();
//            }

            System.out.println(one.toString());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request, String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }

}
