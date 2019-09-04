package cn.edu.neu.mapper;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Color;

public interface ColorMapper {
	List<Color> findAllColors();

	List<Color> findAllColors(Page<Color> page);

	Color findColorById(String colorId);

	void updateColor(Color color);

	void delColor(String colorId);

	void saveColor(Color color);

}
