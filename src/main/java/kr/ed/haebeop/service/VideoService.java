package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.Video;
import kr.ed.haebeop.util.Page;

import java.util.List;

public interface VideoService {
    public List<Video> videoList(Page page) throws Exception;
    public Video videoDetail(int no) throws Exception;
    public void videoInsert(Video domain) throws Exception;
    public void videoDelete(int no) throws Exception;
    public void videoEdit(Video domain) throws Exception;
    public int totalCount(Page page) throws Exception;
}
