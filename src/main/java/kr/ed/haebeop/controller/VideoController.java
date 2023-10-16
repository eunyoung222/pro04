package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Video;
import kr.ed.haebeop.service.VideoService;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/video/")
public class VideoController {

    @Autowired
    private VideoService videoService;

    @GetMapping("list.do")
    public String getVideoList(HttpServletRequest request, Model model) throws Exception {
        String type = request.getParameter("type");
        String keyword = request.getParameter("keyword");
        int curPage = request.getParameter("page") != null ? Integer.parseInt(request.getParameter("page")) : 1;

        Page page = new Page();
        page.setSearchType(type);
        page.setSearchKeyword(keyword);
        int total = videoService.totalCount(page);

        page.makeBlock(curPage, total);
        page.makeLastPageNum(total);
        page.makePostStart(curPage, total);

        model.addAttribute("type", type);
        model.addAttribute("keyword", keyword);
        model.addAttribute("page", page);
        model.addAttribute("curPage", curPage);

        List<Video> videoList = videoService.videoList(page);
        model.addAttribute("videoList", videoList);

        return "/video/videoList";
    }

        @GetMapping("detail.do")
        public String getVideoDetail(HttpServletRequest request, Model model) throws Exception {
            int no = Integer.parseInt(request.getParameter("no"));
            Video domain = videoService.videoDetail(no);
            model.addAttribute("domain", domain);

            return "/video/videoDetail";
        }

        @GetMapping("insert.do")
        public String insertForm(HttpServletRequest request, Model model) throws Exception {
            return "/video/videoInsert";
        }

        @PostMapping("insert.do")
        public String videoInsert(HttpServletRequest request, Model model, @RequestParam(value = "videofile", required = false) MultipartFile file, @RequestParam(value = "img", required = false) MultipartFile img) throws Exception {

            Video domain = new Video();
            domain.setTitle(request.getParameter("title"));
            domain.setContent(request.getParameter("content"));
            domain.setTeacher(request.getParameter("teacher"));

            // 파일 업로드
            String realPath = request.getSession().getServletContext().getRealPath("/resources/video/");           // 업로드 경로 설정
            String saveFolder = realPath;
            File folder = new File(saveFolder);
            if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
                folder.mkdirs();
            }

                // 첨부파일이 있는 경우
                if (file != null) {
                    String originalFileName = file.getOriginalFilename();   // 첨부파일의 실제 파일명
                    if(!originalFileName.isEmpty()) {
                        String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
                        domain.setVideofile(saveFileName);                       // 동영상 정보 저장
                        file.transferTo(new File(folder, saveFileName));    // 파일을 업로드 폴더에 저장
                    }
                }


            // 파일 업로드
            realPath = request.getSession().getServletContext().getRealPath("/resources/img/");           // 업로드 경로 설정
            saveFolder = realPath;
            File folder2 = new File(saveFolder);
            if(!folder2.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
                folder2.mkdirs();
            }

            // 첨부파일이 있는 경우
            if (img != null) {
                String originalFileName = img.getOriginalFilename();   // 첨부파일의 실제 파일명
                if(!originalFileName.isEmpty()) {
                    String saveFileName = UUID.randomUUID().toString() + originalFileName.substring(originalFileName.lastIndexOf("."));     // 파일 이름을 랜덤으로 설정
                    domain.setImg(saveFileName);                       // 동영상 정보 저장
                    img.transferTo(new File(folder2, saveFileName));    // 파일을 업로드 폴더에 저장
                }
            }

            videoService.videoInsert(domain);
            return "redirect:list.do";


        }



        @GetMapping("delete.do")
        public String videoDelete(HttpServletRequest request, Model model) throws Exception {
            int no = Integer.parseInt(request.getParameter("no"));
            videoService.videoDelete(no);
            return "redirect:list.do";
        }

        @GetMapping("edit.do")
        public String editForm(HttpServletRequest request, Model model) throws Exception {
            int no = Integer.parseInt(request.getParameter("no"));
            Video domain = videoService.videoDetail(no);
            model.addAttribute("domain", domain);
            return "/video/videoEdit";
        }

        @PostMapping("edit.do")
        public String videoEdit(HttpServletRequest request, Model model) throws Exception {
            int no = Integer.parseInt(request.getParameter("no"));
            Video domain = new Video();
            domain.setNo(no);
            domain.setTitle(request.getParameter("title"));
            domain.setContent(request.getParameter("content"));
            domain.setTeacher(request.getParameter("teacher"));

            // 파일 업로드
            String realPath = request.getSession().getServletContext().getRealPath("/resources/video/");           // 업로드 경로 설정
            String saveFolder = realPath;
            File folder = new File(saveFolder);
            if(!folder.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
                folder.mkdirs();
            }


            // 파일 업로드
            realPath = request.getSession().getServletContext().getRealPath("/resources/img/");           // 업로드 경로 설정
            saveFolder = realPath;
            File folder2 = new File(saveFolder);
            if(!folder2.exists()) {          // 폴더가 존재하지 않으면 폴더 생성
                folder2.mkdirs();
            }


            videoService.videoEdit(domain);
            return "redirect:list.do";
        }

        //ckeditor를 이용한 이미지 업로드
        @RequestMapping(value="imageUpload.do", method = RequestMethod.POST)
        public void imageUpload(HttpServletRequest request,
                                HttpServletResponse response, MultipartHttpServletRequest multiFile
                , @RequestParam MultipartFile upload) throws Exception{
            // 랜덤 문자 생성
            UUID uid = UUID.randomUUID();

            OutputStream out = null;
            PrintWriter printWriter = null;

            //인코딩
            response.setCharacterEncoding("utf-8");
            response.setContentType("text/html;charset=utf-8");
            try{
                //파일 이름 가져오기
                String fileName = upload.getOriginalFilename();
                byte[] bytes = upload.getBytes();

                //이미지 경로 생성
                String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";	// 이미지 경로 설정(폴더 자동 생성)
                String ckUploadPath = path + uid + "_" + fileName;
                File folder = new File(path);
                System.out.println("path:"+path);	// 이미지 저장경로 console에 확인
                //해당 디렉토리 확인
                if(!folder.exists()){
                    try{
                        folder.mkdirs(); // 폴더 생성
                    }catch(Exception e){
                        e.getStackTrace();
                    }
                }

                out = new FileOutputStream(new File(ckUploadPath));
                out.write(bytes);
                out.flush(); // outputStram에 저장된 데이터를 전송하고 초기화

                String callback = request.getParameter("CKEditorFuncNum");
                printWriter = response.getWriter();
                String fileUrl = "/team24_war/review/ckImgSubmit.do?uid=" + uid + "&fileName=" + fileName; // 작성화면

                // 업로드시 메시지 출력
                printWriter.println("{\"filename\" : \""+fileName+"\", \"uploaded\" : 1, \"url\":\""+fileUrl+"\"}");
                printWriter.flush();

            }catch(IOException e){
                e.printStackTrace();
            } finally {
                try {
                    if(out != null) { out.close(); }
                    if(printWriter != null) { printWriter.close(); }
                } catch(IOException e) { e.printStackTrace(); }
            }
            return;
        }

        //ckeditor를 이용한 서버에 전송된 이미지 뿌려주기
        @RequestMapping(value="ckImgSubmit.do")
        public void ckSubmit(@RequestParam(value="uid") String uid
                , @RequestParam(value="fileName") String fileName
                , HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

            //서버에 저장된 이미지 경로
            String path = "E:\\springframework\\pro04_2\\src\\main\\webapp\\resources\\upload" + "ckImage/";    // 저장된 이미지 경로
            System.out.println("path:" + path);
            String sDirPath = path + uid + "_" + fileName;

            File imgFile = new File(sDirPath);

            //사진 이미지 찾지 못하는 경우 예외처리로 빈 이미지 파일을 설정한다.
            if (imgFile.isFile()) {
                byte[] buf = new byte[1024];
                int readByte = 0;
                int length = 0;
                byte[] imgBuf = null;

                FileInputStream fileInputStream = null;
                ByteArrayOutputStream outputStream = null;
                ServletOutputStream out = null;

                try {
                    fileInputStream = new FileInputStream(imgFile);
                    outputStream = new ByteArrayOutputStream();
                    out = response.getOutputStream();

                    while ((readByte = fileInputStream.read(buf)) != -1) {
                        outputStream.write(buf, 0, readByte);
                    }

                    imgBuf = outputStream.toByteArray();
                    length = imgBuf.length;
                    out.write(imgBuf, 0, length);
                    out.flush();

                } catch (IOException e) {
                    e.printStackTrace();
                } finally {
                    outputStream.close();
                    fileInputStream.close();
                    out.close();
                }
            }
        }
    }


