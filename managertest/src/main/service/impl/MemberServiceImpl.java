package main.service.impl;

import main.dao.MemberDao;
import main.dao.Impl.MemberDaoImpl;
import main.domain.Member;
import main.service.MemberService;

public class MemberServiceImpl implements MemberService {
    private MemberDao dao=new MemberDaoImpl();
    @Override
    public Member login(Member member) {
        return dao.findUserByUsernameAndPassword(member.getUsername(),member.getPassword());
    }

}
