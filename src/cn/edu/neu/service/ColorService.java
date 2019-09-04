package cn.edu.neu.service;

import java.util.List;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Color;

public interface ColorService {

	Page<Color> getAllColors();

	Color getColorById(String colorId);

	void updateColor(Color color);

	void delColor(String colorId);

	void addColor(Color color);

	List<Color> getAllColorsWithoutPage();
}
