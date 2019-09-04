package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.User;

public interface CateMapper {

	List<Category> findAll(Page<Category> page);

	void saveCate(Category cate);

	Category findCateById(String cateId);

	List<Integer> findGoodsIdByCateId(String cateId);

	void delGoodsSize(List<Integer> goodsIds);

	void delGoodsColor(List<Integer> goodsIds);

	void delGoodsPic(List<Integer> goodsIds);

	void delGoods(String cateId);

	void delCate(String cateId);

	void updateCate(Category cate);

}
