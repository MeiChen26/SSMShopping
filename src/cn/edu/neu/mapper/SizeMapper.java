package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Size;

public interface SizeMapper {

	List<Size> findAllSizes(Page<Size> page);

	void updateSize(Size size);

	void delSize(String sizeId);

	void saveSize(Size size);

	Size findSizeById(String sizeId);

	List<Size> findAllSizes();

}
