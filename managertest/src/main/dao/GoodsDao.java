package main.dao;

import main.domain.Goods;

import java.util.List;
import java.util.Map;

public interface GoodsDao {
    List<Goods> findAll();

    void add(Goods good);

    void delete(int parseInt);

    Goods findByid(int i);

    void update(Goods good);

    int findTotalCount(Map<String, String[]> condition);

    List<Goods> findByPage(int start, int rows, Map<String, String[]> condition);
}
