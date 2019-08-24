package main.shop.dao.impl;

import main.shop.dao.GoodsDao;
import main.shop.model.Goods;
import main.shop.tools.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.List;


public class GoodsImpl implements GoodsDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());
    @Override
    public int findTotalCount() {
        String sql="select count(*) from tb_goods";
        return template.queryForObject(sql,Integer.class);
    }

    @Override
    public List<Goods> findByPage(int start, int rows) {
        String sql="select * from tb_goods limit ? ,? ";
        List<Goods> goods = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class),start,rows);
        return goods;
    }

    @Override
    public List<Goods> findBySearch(String condition) {
        String sql="select * from tb_goods where 1 = 1 ";
        StringBuilder sb = new StringBuilder(sql);
        sb.append(" and "+"goodsName"+" like ");
        sb.append("'%"+condition+"%'");
        sb.append(" limit ? ");
        sql=sb.toString();

        List<Goods> goods = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class), 2);
        return goods;
    }
}
