package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Size;

public interface SizeService {

	Page<Size> getAllSizes();

	Size getSizeById(String sizeId);

	void addSize(Size size);

	void delSize(String sizeId);

	void updateSize(Size size);
	
	List<Size> getAllSizesWithoutPage();
}
