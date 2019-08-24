package main.shop.dao;

import main.shop.model.Goods;

import java.util.List;

public interface GoodsDao {
    int findTotalCount();

    List<Goods> findByPage(int start, int rows);

    List<Goods> findBySearch(String condition);
}
