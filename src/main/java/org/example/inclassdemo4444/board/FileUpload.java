package org.example.inclassdemo4444.board;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

public class FileUpload {

    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024; // 파일 크기 제한 (15MB)

        // 실제 서버에 저장될 경로
        String realPath = request.getServletContext().getRealPath("upload");

        // 폴더가 없으면 생성
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = null;
        MultipartRequest multipartRequest = null;

        try {
            // 1. 파일 업로드 처리
            multipartRequest = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

            // 2. 업로드된 파일 이름 가져오기
            filename = multipartRequest.getFilesystemName("photo");

            // 3. 나머지 폼 데이터 가져와서 VO에 담기
            one = new BoardVO();
            String seq = multipartRequest.getParameter("seq");
            //새로 만든 data가 아니면 seq의 값을 가져옴
            if(seq!=null && !seq.equals("")) one.setSeq(Integer.parseInt(seq));

            one.setCategory(multipartRequest.getParameter("category"));
            one.setTitle(multipartRequest.getParameter("title"));
            one.setWriter(multipartRequest.getParameter("writer"));
            one.setPassword(multipartRequest.getParameter("password"));
            one.setContent(multipartRequest.getParameter("content"));
            one.setFilename(filename);

        } catch (IOException e) {
            e.printStackTrace();
        }

        return one;
    }
}