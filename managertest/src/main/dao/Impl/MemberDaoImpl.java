package main.dao.Impl;

import main.dao.MemberDao;
import main.domain.Member;
import main.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;


public class MemberDaoImpl implements MemberDao {
    JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public Member findUserByUsernameAndPassword(String username, String password) {
        String sql="select * from tb_manager where manager = ? and PWD = ?";
        try{
            Member member = template.queryForObject(sql, new BeanPropertyRowMapper<Member>(Member.class), username, password);
            return member;
        }catch (Exception e){
            return null;
        }

    }
}
