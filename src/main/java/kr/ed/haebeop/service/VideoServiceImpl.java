package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Video;
import kr.ed.haebeop.persistence.VideoMapper;
import kr.ed.haebeop.util.Page;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class VideoServiceImpl implements VideoService {

    @Autowired
    private VideoMapper videoMapper;

    @Override
    public List<Video> videoList(Page page) throws Exception {
        return videoMapper.videoList(page);
    }

    @Override
    public Video videoDetail(int no) throws Exception {
        return videoMapper.videoDetail(no);
    }

    @Override
    public void videoInsert(Video domain) throws Exception {
        // 이미지 받아서 저장하는 로직 (resources/img)
        String uploadPath = "/webapp/resources/img/";
        // 비디오 받아서 저장 (video 폴더)

        // db에는 파일이름만 저장

        videoMapper.videoInsert(domain);
    }


    @Override
    public void videoDelete(int no) throws Exception {
        videoMapper.videoDelete(no);
    }

    @Override
    public void videoEdit(Video domain) throws Exception {
        videoMapper.videoEdit(domain);
    }

    @Override
    public int totalCount(Page page) throws Exception {
        return videoMapper.totalCount(page);
    }
}
