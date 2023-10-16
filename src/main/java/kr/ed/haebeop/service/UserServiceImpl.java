package kr.ed.haebeop.service;

import kr.ed.haebeop.domain.User;
import kr.ed.haebeop.persistence.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public List<User> userList() {
        return userMapper.userList();
    }

    @Override
    public int userCount() {
        return userMapper.userCount();
    }

    @Override
    public User getUser(String id) {
        return userMapper.getUser(id);
    }

    @Override
    public User signIn(User mdto) {
        return userMapper.signIn(mdto);
    }

    @Override
    public User loginCheck(User mdto) {
        return userMapper.loginCheck(mdto);
    }

    @Override
    public boolean logIn(HttpServletRequest request) {
        HttpSession session = request.getSession();
        boolean loginSuccess = false;
        User mdto = new User();

        mdto.setId(request.getParameter("id"));
        mdto.setPw(request.getParameter("pw"));

        User login = userMapper.logIn(mdto);

        loginSuccess = passwordEncoder.matches(mdto.getPw(), login.getPw());
        if(login != null && loginSuccess==true) {
            session.setAttribute("user", login);
            session.setAttribute("sid", login.getId());
            loginSuccess = true;
        }
        return loginSuccess;
    }

    @Override
    public void userInsert(User mdto) {
        userMapper.userInsert(mdto);
    }

    @Override
    public void userUpdate(User mdto) {
        userMapper.userUpdate(mdto);
    }

    @Override
    public void userDelete(String id) {
        userMapper.userDelete(id);
    }
}