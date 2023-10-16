package kr.ed.haebeop.controller;

import kr.ed.haebeop.domain.Comment;
import kr.ed.haebeop.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/comment/")
public class CommentController {

    @Autowired
    private CommentService commentService;

    @GetMapping("insert.do")
    public String insertForm(HttpServletRequest request, Model model) throws Exception {
        return "/review/commentInsert";
    }

    @PostMapping("insert.do")
    public String commentInsert(HttpServletRequest request, Model model) throws Exception {
        Comment comment = new Comment();

        comment.setAuthor(request.getParameter("author"));
        comment.setContent(request.getParameter("content"));
        comment.setPar(Integer.parseInt(request.getParameter("par")));

        commentService.commentInsert(comment);

        return "redirect:/review/detail.do?no="+request.getParameter("par");

    }

    @GetMapping("delete.do")
    public ModelAndView commentDelete(HttpServletRequest request, Model model) throws Exception {
        int dno = Integer.parseInt(request.getParameter("dno"));
        int no = Integer.parseInt(request.getParameter("no"));
        commentService.commentDelete(dno);
        model.addAttribute("no", no);
        ModelAndView mav = new ModelAndView();
        mav.setView(new RedirectView(request.getContextPath() + "/review/detail.do"));
        return mav;
    }
}
