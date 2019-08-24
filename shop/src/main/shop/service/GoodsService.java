package main.shop.service;

import main.shop.model.Goods;
import main.shop.model.PageBean;

import java.util.List;

public interface GoodsService {
    PageBean<Goods> findGoodsByPage(String currentPage, String rows);

    List<Goods> findGoodsBySearch(String condition);
}
