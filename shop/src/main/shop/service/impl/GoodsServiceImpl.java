package main.shop.service.impl;

import main.shop.dao.GoodsDao;
import main.shop.dao.impl.GoodsImpl;
import main.shop.model.Goods;
import main.shop.model.PageBean;
import main.shop.service.GoodsService;

import java.util.List;

public class GoodsServiceImpl implements GoodsService {
    private GoodsDao dao=new GoodsImpl();

    @Override
    public PageBean<Goods> findGoodsByPage(String _currentPage, String _rows) {
        int currentPage=Integer.parseInt(_currentPage);
        int rows=Integer.parseInt(_rows);

        if(currentPage<0){
            currentPage=1;
        }
        PageBean<Goods> pb=new PageBean<Goods>();
        //设置参数
        pb.setCurrentPage(currentPage);
        pb.setRows(rows);

        //调用dao查询总记录数
        int totalCount=dao.findTotalCount();
        pb.setTotalCount(totalCount);
        //调用dao查询List集合

        //计算开始的记录索引
        int start=(currentPage-1)*rows;

        List<Goods> list=dao.findByPage(start,rows);
        pb.setList(list);

        //计算总页码
        int totalPage = (totalCount % rows)  == 0 ? totalCount/rows : (totalCount/rows) + 1;
        pb.setTotalPage(totalPage);

        return pb;
    }

    @Override
    public List<Goods> findGoodsBySearch(String condition) {
        List<Goods> goods=dao.findBySearch(condition);
        return goods;
    }
}
