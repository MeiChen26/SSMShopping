package cn.edu.neu.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.mapper.CateMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.User;
import cn.edu.neu.service.CateService;

@Service
@Transactional
public class CateServiceImpl implements CateService{
	@Resource
	private CateMapper mapper;

	@Override
	public List<Category> getAllCates() {
		// TODO Auto-generated method stub
		List<Category> cates=mapper.findAll(null);
		return cates;
	}
	@Override
	public Page<Category> getAdminCates() {
		// TODO Auto-generated method stub
		Page<Category> page = new Page<Category>(10);
		List<Category> catesList=mapper.findAll(page);
		page.setList(catesList);  
		return page;
	}
	@Override
	public void updateCate(Category cate) {
		// TODO Auto-generated method stub
		mapper.updateCate(cate);
	}
	@Override
	public void addCate(Category cate) {
		// TODO Auto-generated method stub
		mapper.saveCate(cate);
	}
	@Override
	public Category getCateById(String cateId) {
		// TODO Auto-generated method stub
		return mapper.findCateById(cateId);
	}
	@Override
	public void delCate(String cateId) {
		// TODO Auto-generated method stub
		List<Integer> goodsIds=mapper.findGoodsIdByCateId(cateId);
		System.out.println(goodsIds);
		if(goodsIds!=null && goodsIds.size()>0){
			mapper.delGoodsSize(goodsIds);
			mapper.delGoodsColor(goodsIds);
			mapper.delGoodsPic(goodsIds);
		}
		mapper.delGoods(cateId);
		mapper.delCate(cateId);
	}
}
