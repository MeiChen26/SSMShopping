package cn.edu.neu.mapper;

import java.util.List;
import java.util.Map;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.model.Order;
import cn.edu.neu.model.OrderDetail;

public interface OrderMapper {

	void saveOrder(Order order);

	List<Order> findMyOrders(Page<Order> page);

	void saveOrderDetail(OrderDetail od);

	void delOrderDetail(String orderId);

	void delOrder(String orderId);

	void updateOrderStatus(String orderId, int status);

	int findOrderStatusById(int orderId);

	Order findOrderDetailById(String orderId);

	List<Order> findOrders(Page<Order> page);

	void updateOrderPostInfo(String orderId, String orderPostname, String orderPostcode,int status);

	Integer[] findOrderStatusByIds(String[] orderIds);

}
