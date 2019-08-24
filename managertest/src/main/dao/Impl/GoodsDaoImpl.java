package main.dao.Impl;

import main.dao.GoodsDao;
import main.domain.Goods;
import main.util.JDBCUtils;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

public class GoodsDaoImpl implements GoodsDao {
    private JdbcTemplate template=new JdbcTemplate(JDBCUtils.getDataSource());

    @Override
    public List<Goods> findAll() {
        String sql="select * from tb_goods";
        List<Goods> goods = template.query(sql, new BeanPropertyRowMapper<Goods>(Goods.class));
        return goods;
    }

    @Override
    public void add(Goods good) {
        String sql="insert into tb_goods(ID,typeID,goodsName,price,nowprice,sale,address,picture) values " +
                "(null,?,?,?,?,?,?,?)";
        template.update(sql,good.getTypeID(),good.getGoodsName(),good.getPrice(),good.getNowPrice(),
                good.getSale(),good.getAddress(),good.getPicture());
    }

    @Override
    public void delete(int id) {
        String sql="delete from tb_goods where ID = ?";
        template.update(sql,id);
    }

    @Override
    public Goods findByid(int id) {
        String sql="select * from tb_goods where ID = ?";
        return template.queryForObject(sql, new BeanPropertyRowMapper<Goods>(Goods.class), id);
    }
    @Override
    public void update(Goods good) {
        String sql="update tb_goods set goodsName = ?,typeID = ?,sale = ?,price = ?,nowPrice = ?,picture = ? where ID = ? ";
        int update = template.update(sql, good.getGoodsName(), good.getTypeID(), good.getSale(), good.getPrice(), good.getNowPrice(),good.getPicture(),good.getID());
        System.out.println(update);
    }

    @Override
    public int findTotalCount(Map<String, String[]> condition){
        //定义一个模板sql
        String sql = "select count(*) from tb_goods where 1 = 1 ";
        StringBuilder sb=new StringBuilder(sql);
        //遍历map
        Set<String> keysSet=condition.keySet();

        List<Object> params=new ArrayList<>();
        for(String key:keysSet){
            if("currentPage".equals(key)||"rows".equals(key)){
                continue;
            }
            String value=condition.get(key)[0];
            if(value!=null&&!value.equals("")){
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        System.out.println(sb.toString());
        System.out.println(params);
        return template.queryForObject(sb.toString(),Integer.class,params.toArray());
    }

    @Override
    public List<Goods> findByPage(int start, int rows, Map<String, String[]> condition) {
        String sql = "select * from tb_goods  where 1 = 1 ";

        StringBuilder sb = new StringBuilder(sql);
        //2.遍历map
        Set<String> keySet = condition.keySet();
        //定义参数的集合
        List<Object> params = new ArrayList<Object>();
        for (String key : keySet) {

            //排除分页条件参数
            if("currentPage".equals(key) || "rows".equals(key)){
                continue;
            }
            //获取value
            String value = condition.get(key)[0];
            //判断value是否有值
            if(value != null && !"".equals(value)){
                //有值
                sb.append(" and "+key+" like ? ");
                params.add("%"+value+"%");//？条件的值
            }
        }
        //添加分页查询
        sb.append(" limit ?,? ");
        //添加分页查询参数值
        params.add(start);
        params.add(rows);
        sql = sb.toString();
        System.out.println(sql);
        System.out.println(params);
        //注意这里是拼接之后的sql语句，第三个参数是传入的参数
        return template.query(sql,new BeanPropertyRowMapper<Goods>(Goods.class),params.toArray());


        //select * from user limit 10,10 ;
    }
}
