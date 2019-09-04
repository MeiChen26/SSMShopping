package cn.edu.neu.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.ColorMapper;
import cn.edu.neu.model.Color;
import cn.edu.neu.service.ColorService;

@Service
@Transactional 
public class ColorServiceImpl implements ColorService{
	
	@Autowired
	private ColorMapper mapper;

	@Override
	public Page<Color> getAllColors() {
		// TODO Auto-generated method stub
		Page<Color> page = new Page<Color>(15);
		List<Color> colorList=mapper.findAllColors(page);
		page.setList(colorList);
		return page;
	}

	@Override
	public Color getColorById(String colorId) {
		// TODO Auto-generated method stub
		return mapper.findColorById(colorId);
	}

	@Override
	public void updateColor(Color color) {
		// TODO Auto-generated method stub
		mapper.updateColor(color);
	}

	@Override
	public void delColor(String colorId) {
		// TODO Auto-generated method stub
		mapper.delColor(colorId);
	}

	@Override
	public void addColor(Color color) {
		// TODO Auto-generated method stub
		mapper.saveColor(color);
	}

	@Override
	public List<Color> getAllColorsWithoutPage() {
		// TODO Auto-generated method stub
		List<Color> colorList=mapper.findAllColors();
		return colorList;
	}
}
