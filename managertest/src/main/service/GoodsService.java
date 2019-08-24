package main.service;

import main.domain.Goods;
import main.domain.PageBean;

import java.util.List;
import java.util.Map;

public interface GoodsService {
    List<Goods> findAll();

    /**
     * 添加商品信息
     * @param good
     */
    void addGoods(Goods good);

    /**
     * 删除商品信息
     * @param id
     */
    void deleteGoods(String id);

    /**
     * 根据id查询商品
     * @param id
     * @return
     */
    Goods findGoodByid(String id);

    /**
     * 修改商品信息
     * @param good
     */
    void updateGoods(Goods good);

    /**
     * 删除选中的商品
     * @param uids
     */
    void delSelectedGoods(String[] uids);

    /**
     * 分页查询
     * @param currentPage
     * @param rows
     * @param condition
     * @return
     */
    PageBean<Goods> findGoodByPage(String currentPage, String rows, Map<String, String[]> condition);
}
