package main.service.impl;


import main.dao.GoodsDao;
import main.dao.Impl.GoodsDaoImpl;
import main.domain.Goods;
import main.domain.PageBean;
import main.service.GoodsService;


import java.util.List;
import java.util.Map;

public class GoodsServiceImmpl implements GoodsService {
    private GoodsDao dao=new GoodsDaoImpl();
    @Override
    public List<Goods> findAll() {
        return dao.findAll();
    }

    @Override
    public void addGoods(Goods good) {
        dao.add(good);
    }

    @Override
    public void deleteGoods(String id) {
        dao.delete(Integer.parseInt(id));
    }

    @Override
    public Goods findGoodByid(String id) {
        return dao.findByid(Integer.parseInt(id));
    }

    @Override
    public void updateGoods(Goods good) {
        dao.update(good);
    }

    @Override
    public void delSelectedGoods(String[] uids) {
        if(uids!=null||uids.length>0){
            for (String id : uids) {
                dao.delete(Integer.parseInt(id));
            }
        }
    }

    @Override
    public PageBean<Goods> findGoodByPage(String _currentPage, String _rows, Map<String, String[]> condition) {
        //创建空的PageBean对象
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);
        if (currentPage<=0){
            currentPage=1;
        }
        PageBean<Goods> pb=new PageBean<>();

        pb.setCurrentPage(currentPage);
        pb.setRows(rows);
        //查询总记录数
        int totalCount=dao.findTotalCount(condition);
        pb.setTotalCount(totalCount);

        int start=(currentPage-1)*rows;
        List<Goods> list=dao.findByPage(start,rows,condition);
        pb.setList(list);

        //计算总页码
        int totalPage=(totalCount% rows)  ==0 ? (totalCount/rows):(totalCount/rows+1);
        pb.setTotalPage(totalPage);

        return pb;
    }
}
