package main.shop.dao.impl;

import main.shop.dao.MemberDao;
import main.shop.model.Member;
import main.shop.tools.JDBCUtils;
import org.springframework.jdbc.core.JdbcTemplate;

public class Memberimpl implements MemberDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    /**
     * 插入用户信息
     * @param member
     * @return
     */
    @Override
    public int insert(Member member) {
        int ret=-1;
        try{
            if(member.getUsername()!=null){
                String sql="insert into tb_Member(userName,password,tel,email)values(?,?,?,?)";
                ret = template.update(sql, member.getUsername(),member.getPassword(),member.getTel(),member.getEmail());
            }
        }catch (Exception e){
            e.printStackTrace();
            ret=0;
        }
        return ret;
    }
}
