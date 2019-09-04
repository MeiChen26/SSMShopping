package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;

import cn.edu.neu.mapper.SizeMapper;
import cn.edu.neu.model.Category;
import cn.edu.neu.model.Size;
import cn.edu.neu.service.SizeService;

@Service
@Transactional 
public class SizeServiceImpl implements SizeService{
	
	@Autowired
	private SizeMapper mapper;

	@Override
	public Page<Size> getAllSizes() {
		// TODO Auto-generated method stub
		Page<Size> page = new Page<Size>(15);
		List<Size> sizeList=mapper.findAllSizes(page);
		page.setList(sizeList);
		return page;
	}

	@Override
	public Size getSizeById(String sizeId) {
		// TODO Auto-generated method stub
		return mapper.findSizeById(sizeId);
	}

	@Override
	public void addSize(Size size) {
		// TODO Auto-generated method stub
		mapper.saveSize(size);
	}

	@Override
	public void delSize(String sizeId) {
		// TODO Auto-generated method stub
		mapper.delSize(sizeId);
	}

	@Override
	public void updateSize(Size size) {
		// TODO Auto-generated method stub
		mapper.updateSize(size);
	}
	
	@Override
	public List<Size> getAllSizesWithoutPage() {
		// TODO Auto-generated method stub
		List<Size> sizeList=mapper.findAllSizes();		
		return sizeList;
	}
}
